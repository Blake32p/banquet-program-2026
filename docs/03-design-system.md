# 03 · Design system and performance budget

*Updated 2026-09-23 through D31. The redesign is published: `public/index.html` was ported from `docs/mockups/redesign-v1.html` on 2026-09-23 (D31). Make future design changes in `public/index.html`; the mockup is kept as a record.*

## Direction: “the invitation, on your phone”

The page picks up the 2026 Save-the-Date flyer (`reference/2026-save-the-date-flyer.jpg`): a **deep navy** background, **gold** accents, a **script “Banquet,”** bold uppercase sans headings, and a few gold four-point sparkles. It uses the same logo as the website. The design is dark by default, and there's no light-mode toggle. On navy, a dark UI has less glare in a dim room, and it still reads in daylight because text contrast is 9.6–16.4:1.

Avoid looping effects, parallax, background video, big hero photos, carousels, a hamburger menu, pop-ups, and cookie banners. D25 permits a brief opening ornament animation and useful control feedback; the motion rules below govern it.

## Color tokens

| Token | Value | Use | Contrast on `--bg` |
|---|---|---|---|
| `--bg` | `#0a1230` | Page background (the flyer's navy) | n/a |
| `--bg-top` | `#101b48` | Top of the page gradient | n/a |
| `--bg-deep` | `#060b20` | Footer background and navigation bar | n/a |
| `--text` | `#f5f2ea` | Body text and headings (warm white) | 16.4:1 AAA |
| `--text-soft` | `#c9cfe2` | Secondary text, schedule details | 11.8:1 AAA |
| `--gold` | `#ecc062` | Awards, times, links, active tab, script | 10.8:1 AAA |
| `--gold-deep` | `#b8903a` | Portrait rings and rules only, **never text** | n/a |
| `--sky` | `#8dd0e5` | Focus rings. It's the logo's “DEMOCRATS” color | 10.8:1 |
| `--rule` | gold at 38% | Dividers and outlines | n/a |
| `--rule-soft` | gold at 22% | Schedule separators and timeline | n/a |
| `--frame` | gold at 50% | Honoree and roll borders | n/a |

Honoree cards use a 2.5% white tint. Recheck contrast against the actual rendered background when changing colors. Remaining draft content is visibly labeled; neither the production draft banner nor the mockup’s design banner is required.

## Type

| Role | Font | Size |
|---|---|---|
| Body | Poppins 400 | **19px** (1.1875rem), line-height 1.6 |
| Headings, labels | Poppins 700 | Section titles 32–42px, honoree names 28–34px, schedule items 23px |
| Script accent (“Banquet”, honoree roll, sign-off) | Allura 400 (D4, adopted) | Responsive; sign-off 48px; never synthesize bold |
| Smallest text anywhere | n/a | 15px (photo credit, tab labels at 320px) |

Poppins and Allura are self-hosted WOFF2 subsets under the SIL Open Font License. They use `font-display: swap`, so text appears immediately in the system font and switches when the brand font arrives.

**D4 (adopted):** Blake identified the flyer’s script as Allura. Its subset is `public/assets/fonts/allura-400.woff2`; source and license are in `source-assets/fonts/allura/`. The published page uses Allura; Playfair was removed (D31).

## Layout

- A single column, 40rem (640px) max, 44rem on tablets. The gutter is 18–32px and respects iPhone safe areas.
- **Order:** Hero and honoree roll → Program → Honorees → **Tributes** (the ad book: supplied ads, then the Congratulations page and exact sign-off as the last ad, D32) → footer: **About → Stay connected → PDF availability → Stratford Democrats logo**. Congratulations remains the last ceremonial program section. Preserve its original SVG and wording. It uses navy, warm-white text, and a gold Allura sign-off (D18, adopted).
- **Tributes (D32):** ads stack full width in 1px gold-edged frames; every ad, including full-page (portrait) ads, uses the same width (Blake, 2026-09-24), each linking to its own image full size in a new tab. Alt text transcribes each ad.
- **Omitted:** a Sponsors tier layout, the extra Terry Backer award-background description, and footer email/phone details. Corrie’s award title and biography remain.
- **Bottom tab bar:** fixed, 60px tall plus the safe area, four equal tabs: **Program | Honorees | Tributes | About** (D32). The active tab turns gold; Tributes covers the ads and the closing, and About covers the footer. Labels must fit ~78px at 15px bold (320px screens). A few lines of the page’s ~1.5 KB of JavaScript track the visible section. Without JS, links still work.
- **Honoree card:** centered 160px portrait overlapping its frame, name, presenter, verbatim first bio paragraph, and native **“Read full bio”** disclosure. With JavaScript, opening a bio hides that control and a matching **“Show less”** button appears after the last paragraph, so the text reads without interruption; closing returns focus to “Read full bio” and centers it on screen. Without JavaScript, the native disclosure works as before (D29). Award labels sit above the relevant cards; Corrie’s photo credit remains below her portrait. Tablets keep the centered layout. Card side padding is 8px below 360px (D23), yielding 266px of biography width at 320px; text remains 19px.
- **Schedule:** a vertical timeline with times above segments and simple separators between award entries. Speakers’ names are bold; award names link to the honoree’s card using at least 48px-high targets.
- **Tap targets:** 48px or taller everywhere (pills, buttons, tabs).
- **No horizontal scrolling,** verified at 320, 375, and 768 px on 2026-09-23. Long hyphenated names like “Folsom-O’Keefe” don't break at the hyphen.
- **Outbound links:** Volunteer, email updates, Facebook, Instagram, and Website open in a new tab, with `rel="noopener noreferrer"` and a screen-reader notice. Section and honoree anchors stay in the current tab (D26).

## Motion (D25, D30)

- One opening sequence: existing gold stars glint and the date rule extends, finishing within 800ms.
- Control feedback is brief: 140–200ms color/chevron transitions and a 180ms biography opacity transition. The 700ms honoree-target border highlight was removed (D30): it finished during the ~1.5s smooth scroll, before the card was on screen.
- Tab bar: one 3px gold marker glides between tabs (320ms) instead of each tab drawing its own bar; built with `:has()`, no JavaScript. With reduced motion, the per-tab bar returns.
- Scroll-linked ornament (CSS `animation-timeline`, no JavaScript): divider and award-title rules draw out from the center and the divider star turns as they enter; schedule dots glow as they cross the middle of the screen (a reading cue, not event status); portraits settle from 90% to full size as the gold ring closes; the closing art rises from 88% and brightens. Progress follows scroll position, so effects reverse when scrolling up. Wrapped in `@supports (animation-timeline:view())` and screen media; unsupported browsers (older iOS, Firefox) show the static page.
- Animate only under `@media screen and (prefers-reduced-motion:no-preference)`. Smooth scrolling uses the same preference. Reduced-motion users get static decoration and immediate state feedback.
- No loops, moving reading text, hidden content awaiting a reveal, added dependencies, or extra JavaScript for motion. Native disclosures and anchors remain usable without scripts. (The bio “Show less” control, D29, is the only JavaScript added since v0; it is not animation.)

## Performance budget

| Item | Budget |
|---|---|
| `index.html` gzipped | ≤ 14 KB (14,336 bytes) |
| Fonts (3 files) | ≤ 45 KB |
| Each portrait | ≤ 30 KB WebP, 480×480 |
| Each Tributes ad | ≤ 45 KB WebP, lazy-loaded; counted separately (D32) |
| JavaScript | ≤ 2 KB, inline |
| **First visit total** | **≤ 200 KB target**, excluding Tributes ads and the optional PDF |
| **Full page** | **≤ 300 KB hard cap**, Tributes ads included |
| Third-party asset requests | **0** |
| PDF (on tap only) | ≤ 1.5 MB, with actual size shown beside its link |

The published redesign measures 10,590 bytes gzipped HTML and 110,853 bytes for the first visit (budget script, 2026-09-23). Its JavaScript is 1,469 bytes. The PDF has not been built.

Techniques we use:
- Inline CSS and self-hosted assets. The header and footer reference the same logo SVG file, so the browser downloads it once. (Inlining it would leave only ~230 bytes under the HTML budget; D31.)
- Photos use `loading="lazy"`, `decoding="async"`, and explicit `width`/`height` (no layout shift). They start downloading only as a guest scrolls toward them.
- `font-display:swap` keeps text readable while local font files load.
- No sponsor/ad image payload is part of the website (D6/D22).

Run `bash scripts/check-budget.sh` after every change.

## Image recipe (for new photos, like Volunteers of the Year)

```bash
# 1. Square crop around the face (the y offset puts the face in the upper-middle), then resize to 480px.
sips -c 720 720 --cropOffset 40 0 original.png --out sq.png
sips -Z 480 sq.png --out r.png
# 2. Encode WebP. Aim for 15–25 KB.
cwebp -q 70 -m 6 -sharp_yuv r.png -o public/assets/img/name.webp
```
(If the original is WebP, convert it first: `dwebp original.webp -o original.png`.) Keep full-size originals in `source-assets/`.

## Print / PDF styles

`@media print` switches to white paper and dark text and hides navigation/disclosure controls. The `beforeprint` handler expands biographies; check all are open when generating the PDF. Animation rules are screen-only. See `docs/05-launch-checklist.md` → “Build the PDF.”
