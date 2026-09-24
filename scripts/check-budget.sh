#!/usr/bin/env bash
# Page-weight check for the banquet program. Run from the project root:
#   bash scripts/check-budget.sh
# Budgets are defined in AGENTS.md and docs/03-design-system.md.
set -euo pipefail
cd "$(dirname "$0")/../public"

HTML_GZ_MAX=14336      # 14 KB gzipped: fits in the first network round trip
TOTAL_MAX=204800       # 200 KB first visit (target), not counting Tributes ads
FULL_MAX=307200        # 300 KB hard cap for everything the page references, Tributes ads included
PHOTO_MAX=30720        # 30 KB per portrait
AD_MAX=46080           # 45 KB per Tributes ad (D32): lazy-loaded, only fetched when a guest scrolls to Tributes

fail=0
html_raw=$(wc -c < index.html | tr -d ' ')
html_gz=$(gzip -9 -c index.html | wc -c | tr -d ' ')
printf "index.html         %7s bytes raw, %6s gzipped (budget %s)\n" "$html_raw" "$html_gz" "$HTML_GZ_MAX"
[ "$html_gz" -le "$HTML_GZ_MAX" ] || { echo "  OVER BUDGET: index.html"; fail=1; }

# Assets referenced by index.html (fonts + images). The PDF is excluded; it downloads only on tap.
# Tributes ads (assets/img/ads/) have their own per-ad cap and are reported separately (D32).
total=$html_gz
ads=0
for f in $(grep -oE '(src|href)="assets/[^"]+"|url\(assets/[^)]+\)' index.html | sed -E 's/^(src|href)="//; s/"$//; s/^url\(//; s/\)$//' | sort -u); do
  case "$f" in *.pdf) continue;; esac
  if [ ! -f "$f" ]; then echo "  MISSING: $f"; fail=1; continue; fi
  sz=$(wc -c < "$f" | tr -d ' ')
  case "$f" in *.svg|*.css|*.js) sz=$(gzip -9 -c "$f" | wc -c | tr -d ' ');; esac
  printf "%-40s %7s bytes\n" "$f" "$sz"
  case "$f" in
    assets/img/ads/*) [ "$sz" -le "$AD_MAX" ] || { echo "  OVER BUDGET: $f"; fail=1; }; ads=$((ads + sz)); continue;;
    assets/img/*.webp) [ "$sz" -le "$PHOTO_MAX" ] || { echo "  OVER BUDGET: $f"; fail=1; };;
  esac
  total=$((total + sz))
done
printf "FIRST-VISIT TOTAL  %7s bytes (target %s, excludes Tributes ads)\n" "$total" "$TOTAL_MAX"
[ "$total" -le "$TOTAL_MAX" ] || { echo "  OVER TARGET: total"; fail=1; }
printf "TRIBUTES ADS       %7s bytes (load on scroll; %s per ad)\n" "$ads" "$AD_MAX"
printf "FULL PAGE          %7s bytes (hard cap %s)\n" "$((total + ads))" "$FULL_MAX"
[ "$((total + ads))" -le "$FULL_MAX" ] || { echo "  OVER HARD CAP: full page"; fail=1; }

# Stray third-party requests are not allowed.
if grep -nE '(src|href)="https?://[^"]+\.(js|css|woff2?)' index.html; then echo "  THIRD-PARTY ASSET FOUND"; fail=1; fi

# PDF: report its size so the button label can match.
for p in assets/*.pdf; do [ -f "$p" ] && printf "PDF %-36s %7s bytes (label the button with this)\n" "$p" "$(wc -c < "$p" | tr -d ' ')"; done

[ "$fail" -eq 0 ] && echo "OK: within budget" || { echo "FAILED: see above"; exit 1; }
