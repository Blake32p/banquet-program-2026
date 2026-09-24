# Allura (the flyer’s script font)

- Source: `@fontsource/allura` 5.3.0 (Google Fonts, SIL Open Font License 1.1; see `LICENSE`).
- `allura-latin-400-normal.woff2`: the full Latin subset from the package (26.5 KB). Keep for re-subsetting.
- `public/assets/fonts/allura-400.woff2` (17.2 KB): what the site uses. ASCII letters, digits, and punctuation plus curly quotes and dashes, with the script’s contextual alternates kept.
- `allura-400-phrases-only.woff2` (5.7 KB): only the glyphs in “Banquet”, “Celebrating our 2026 honorees”, “Karen and Kathleen”, “Congratulations!”, “Thank you”. Use it only if every script phrase on the page is one of those.

Re-subset (fontTools, in a venv):
```bash
pyftsubset allura-latin-400-normal.woff2 --flavor=woff2 --layout-features='*' \
  --unicodes="U+0020-007E,U+00A0,U+2013,U+2014,U+2018,U+2019,U+201C,U+201D,U+2026" \
  --output-file=../../../public/assets/fonts/allura-400.woff2
```
