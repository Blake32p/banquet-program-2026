#!/usr/bin/env bash
# Builds the downloadable program PDF (D33) from pdf/program.html. Run from the project root:
#   bash scripts/build-pdf.sh
# Rebuild after ANY content change to public/index.html (edit pdf/program.html to match first).
# Needs: Google Chrome, dwebp (brew install webp), poppler (brew install poppler) for the checks, python3.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
out="$root/public/assets/2026-annual-awards-banquet-program.pdf"
chrome="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
port="${PDF_PORT:-4176}"
tmp="$(mktemp -d)"
srv=""
trap '[ -n "$srv" ] && kill "$srv" 2>/dev/null; rm -rf "$tmp"' EXIT

# 1. JPEG copies of the site's images (same crops). Chrome passes JPEG through as is,
#    but re-encodes WebP losslessly, which makes the PDF about 5x larger.
mkdir -p "$root/pdf/img"
for src in "$root"/public/assets/img/*.webp "$root"/public/assets/img/ads/*.webp; do
  name="$(basename "$src" .webp)"
  dwebp -quiet "$src" -o "$tmp/$name.png"
  sips -s format jpeg -s formatOptions 88 "$tmp/$name.png" --out "$root/pdf/img/$name.jpg" >/dev/null
done

# Page backgrounds: one 150 dpi JPEG each for normal pages and the closing page (see pdf/background.html).
for v in page finale; do
  "$chrome" --headless=new --disable-gpu --hide-scrollbars --window-size=816,1056 --force-device-scale-factor=1.5625 \
    --screenshot="$tmp/bg-$v.png" "file://$root/pdf/background.html?$v" 2>/dev/null
  sips -s format jpeg -s formatOptions 90 "$tmp/bg-$v.png" --out "$root/pdf/img/bg-$v.jpg" >/dev/null
done

# 2. Serve the project root (Chrome won't load web fonts into a file:// page) and print to PDF.
python3 -m http.server "$port" --bind 127.0.0.1 --directory "$root" >/dev/null 2>&1 &
srv=$!
for _ in $(seq 50); do curl -fsS -o /dev/null "http://127.0.0.1:$port/pdf/program.html" 2>/dev/null && break; sleep 0.1; done
"$chrome" --headless=new --disable-gpu --no-pdf-header-footer --generate-pdf-document-outline \
  --virtual-time-budget=10000 --print-to-pdf="$out" "http://127.0.0.1:$port/pdf/program.html" 2>/dev/null

# 3. Check it: page count and size, fonts, and that every word matches the live page.
python3 "$root/scripts/check-pdf.py"
