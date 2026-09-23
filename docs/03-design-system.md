# 03 · Design system and performance budget

*Kickoff direction, 2026-09-23. The live values are the `:root` tokens in `public/index.html`. If you change one there, change it here too.*

## Direction: “the invitation, on your phone”

The page picks up the 2026 Save-the-Date flyer (`reference/2026-save-the-date-flyer.jpg`): a **deep navy** background, **gold** accents, a **script “Banquet,”** bold uppercase sans headings, and a few gold four-point sparkles. It uses the same logo as the website. The design is dark by default, and there's no light-mode toggle. On navy, a dark UI has less glare in a dim room, and it still reads in daylight because text contrast is 9.6–16.4:1.

What we deliberately **don't** do: animated sparkles, parallax, background video, big hero photos, carousels, a hamburger menu, pop-ups, or cookie banners (there are no cookies).

## Color tokens

| Token | Value | Use | Contrast on `--bg` |
|---|---|---|---|
| `--bg` | `#0a1230` | Page background (the flyer's navy) | n/a |
| `--bg-raised` | `#111c45` | Honoree cards, buttons, panels | n/a |
| `--bg-bar` | `#060b20` | Bottom navigation bar | n/a |
| `--text` | `#f5f2ea` | Body text (warm white) | 16.4:1 AAA (14.7:1 on cards) |
| `--text-soft` | `#c9cfe2` | Secondary text, schedule details | 11.8:1 AAA (10.6:1 on cards) |
| `--gold` | `#ecc062` | Headings accents, times, links, active tab | 10.8:1 AAA (9.6:1 on cards) |
| `--gold-deep` | `#b8903a` | Portrait rings and rules only, **never text** | n/a |
| `--sky` | `#8dd0e5` | Focus rings. It's the logo's “DEMOCRATS” color | 10.8:1 |
| `--rule` | gold at 38% | Dividers and outlines | n/a |

The draft-only color (`.draft-note`, in red) marks content still to come. The top “DRAFT” banner was removed on 2026-09-23.

## Type

| Role | Font | Size |
|---|---|---|
| Body | Poppins 400 | **19px** (1.1875rem), line-height 1.6 |
| Headings, labels | Poppins 700 | Section titles 34–46px, honoree names 26–32px, schedule items 21px |
| Script accent (“Banquet”, thank-you note) | Playfair Display 700 Italic (**stand-in**, see D4) | Scales with the h1 |
| Smallest text anywhere | n/a | 15px (photo credit, tab labels at 320px) |

The fonts are self-hosted WOFF2 Latin subsets copied from the main site's `@fontsource` packages (SIL Open Font License). They use `font-display: swap`, so text appears immediately in the system font and switches when the brand font arrives.

**D4 (open):** the flyer's script is a Canva font. Ask who made the flyer which font it is. If it's a Google font, we can use a WOFF2 subset of just the needed characters (≈10 KB). Or export “Banquet” from Canva as an SVG wordmark (≈3 KB, and it looks exactly like the flyer).

## Layout

- A single column, 40rem (640px) max, 44rem on tablets. The gutter is 18–32px and respects iPhone safe areas.
- **Order:** Hero → Program → Honorees → Sponsors → About (with the PDF download) → **Closing page “Congratulations!”** → Footer. The closing page reproduces the last page of the Canva program and **must stay last** (Blake, 2026-09-23). It's full-bleed on phones and a rounded card on tablets. The art is `assets/img/congratulations.svg` (10.5 KB gzipped, lazy-loaded), and the text is `#b8e3f6` on the darker part of the gradient (7:1 or more). The About tab stays highlighted while it's on screen.
- **Bottom tab bar:** fixed, 60px tall plus the safe area, four equal tabs. The active tab turns gold with a gold top bar, and about 1 KB of JavaScript (IntersectionObserver) tracks the section on screen. Without JS the links still work, just without highlighting.
- **Honoree card:** circular 176px portrait with a gold ring, then the name, the award label, the first bio paragraph, and a **“Read full bio +”** control (`<details>`, no JS). On tablets (768px and up), the photo sits beside the text.
- **Schedule:** on phones (under 480px) the time sits above each segment; on tablets it is a two-column grid (time | item). Speakers’ names are bold and never split across lines. Award items link to the honoree’s card.
- **Tap targets:** 48px or taller everywhere (pills, buttons, tabs).
- **No horizontal scrolling,** verified at 320, 375, and 768 px on 2026-09-23. Long hyphenated names like “Folsom-O’Keefe” don't break at the hyphen.

## Performance budget

| Item | Budget | Now (2026-09-23) |
|---|---|---|
| `index.html` gzipped | ≤ 14 KB (fits in the first round trip) | **11.7 KB** |
| Fonts (3 files) | ≤ 45 KB | 38.9 KB |
| Each portrait | ≤ 30 KB WebP 480×480 | 13.5 / 15.4 / 24.5 KB |
| JavaScript | ≤ 2 KB, inline | ~0.7 KB |
| **First visit total** | **≤ 200 KB target, 300 KB hard cap** | **104 KB** |
| Third-party requests | **0** | 0 |
| PDF (on tap only) | ≤ 1.5 MB, with its size shown on the button | not built yet |

For comparison, last year's Canva PDF was **3.8 MB**, about 37× heavier than this whole page.

Techniques we use:
- All CSS inline, the logo inline as SVG, and a favicon as a data URI. The first screen needs **only one request.**
- Photos use `loading="lazy"`, `decoding="async"`, and explicit `width`/`height` (no layout shift). They start downloading only as a guest scrolls toward them.
- There's no web-font request before first paint (`swap`).
- Sponsor ad images, if any, go behind a tap and are lazy-loaded (D6).

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

`@media print` switches to white paper and dark text, hides the tab bar, jump pills, and draft banner, and opens every “Read full bio” before printing. See `docs/05-launch-checklist.md` → “Build the PDF.”
