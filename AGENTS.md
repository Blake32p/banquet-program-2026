# AGENTS.md: 2026 Annual Awards Banquet digital program

This is the shared instruction file for **every AI agent on this project: OpenAI Codex, Claude Code, and anything else.** Codex reads `AGENTS.md` automatically. Claude Code reads it through `CLAUDE.md`, which imports it. Put project rules here, not in tool-specific files.

## What we're building

A **digital-only program** for the Stratford Democratic Town Committee's 2026 Annual Awards Banquet. Guests scan a QR code on their table and read it on their phones.

- **Event:** Sunday, September 27, 2026, 11 AM – 2 PM (Sunday brunch), Blackhawk Country Club, 385 Oronoque Ln, Stratford, CT 06614
- **Honorees:**
  - Democrats of the Year: Anthony Afriyie and Jill D’Angelo-Powers
  - Terry Backer Environmental Champion Award: Corrie Folsom-O’Keefe
  - Volunteers of the Year: names still to come
- **Owner / main contact:** Blake Powers. **Committee Chair:** Kathleen Callahan.
- **Hard deadline:** the QR code must be final by **Thu Sep 24** so table cards can print. Content locks **Sat Sep 26**. Content freezes **Sun Sep 27, 9:30 AM**.

## Start here: every session, every agent

1. Read the **latest entry** in `docs/WORKLOG.md` (newest is at the top) and the open items in `docs/DECISIONS.md`.
2. Do the work.
3. **Before you stop:** add a new entry at the top of `docs/WORKLOG.md` using the template in that file. Say which agent you are (Claude or Codex), what changed, what you checked, and exactly what the next step is. If you made or changed a decision, update `docs/DECISIONS.md`.
4. If you ran out of time mid-task, say so in the entry. Never leave the handoff silent.

## Folder map

| Path | What it is | Published? |
|---|---|---|
| `public/` | **The website.** Everything in here is deployed as-is. | **Yes, all of it** |
| `public/index.html` | The whole program: one page with inline CSS and about 1.5 KB of JS (the 2026-09-23 redesign, ported from `docs/mockups/redesign-v1.html`) | Yes |
| `public/assets/img/` | Compressed WebP images and the minified logo SVG | Yes |
| `public/assets/fonts/` | Poppins 400/700 and Allura 400 (the flyer’s script, ASCII subset). Playfair Display was removed with the redesign. All SIL OFL. | Yes |
| `content/` | **Source of truth for words.** Honoree bios, run of show, About/footer; archived sponsor reference | No |
| `content/private/` | Internal run-of-show notes and anything not for guests (gitignored) | No |
| `docs/` | Brief, hosting research, design system, timeline, launch checklist, decisions, worklog | No |
| `reference/` | The 2026 flyer and the Canva draft PDF (gitignored; may hold draft content) | No |
| `source-assets/` | Original, full-size photos | No |
| `Logos/` | Logo files supplied by the owner. Use `stratford-democrats-light.svg` on dark backgrounds | No |
| `scripts/check-budget.sh` | Page-weight check. Run it before every handoff | No |
| `print/` | Table-card QR code (`qr-program.svg` for print, plus a 1200px PNG). It encodes `HTTPS://PROGRAM.STRATFORDDEMOCRATS.COM` | No |
| `.github/workflows/pages.yml` | Deploys `public/` to GitHub Pages on every push to `main` that changes `public/` | No |

## Non-negotiables

**Content accuracy**
- Never invent names, titles, times, or facts. Anything unknown stays visibly marked `Draft:` until real content arrives.
- Bios are **verbatim** from `content/honorees.md`. Don't edit, shorten, or "improve" them. Copy changes go into `content/` first, then into the page.
- Use real typography: curly apostrophes (’), en dashes for ranges (11 AM – 2 PM), and the exact name spellings: **D’Angelo-Powers, Folsom-O’Keefe, Afriyie**.
- Credit Corrie’s photo: “Photo by Luke Franke.” (It is the caption on her photo on the event page.)
- The **closing “Congratulations!” page** (from the last page of the Canva program) is the **last ad in the Tributes section**, the program’s ad book (D32). Keep its text exactly as written. The other ads are the committee’s artwork from `original-ad-images/`, in their numbered order, as compressed WebP in `public/assets/img/ads/`, with alt text that transcribes each ad. A separate footer follows **Karen and Kathleen’s sign-off**: **About → Stay connected → PDF availability → Stratford Democrats logo**. Omit the footer email address and phone number (D24). Omit the additional Terry Backer award-background block (D22; the ad book, D32, replaces the old Sponsors idea); retain Corrie’s award title and biography.
- The program schedule comes from the committee's run of show (`content/run-of-show.md`). Changes are expected, so apply each new version there first.

**Speed** (guests may have weak cell service)
- No frameworks, no build step, no CDNs, no third-party scripts, trackers, embeds, or web-font services. Everything is served from `public/`.
- Performance budget (details in `docs/03-design-system.md`):
  - `index.html` ≤ **14 KB gzipped**, so it arrives in the first network round trip
  - Total first visit ≤ **200 KB** (hard cap 300 KB), not counting the optional PDF
  - Portrait photos: WebP, 480×480, ≤ 30 KB each, with `loading="lazy"`, `width`, and `height`
  - Tributes ads: WebP, ≤ 45 KB each, lazy-loaded; counted separately from the first visit, and the full page stays under the 300 KB hard cap (D32)
  - JS ≤ 2 KB. The page must work fully with JS off.
- Run `scripts/check-budget.sh` after any change to `public/`.

**Readability and access** (dim room, all ages)
- Body text ≥ 19px. Nothing smaller than 15px. Large headings.
- Contrast is WCAG AAA (7:1) for body text on the navy background. Use the tokens in `:root` and don't add new colors ad hoc.
- Tap targets ≥ 48px tall. No horizontal scrolling from 320px to 1024px wide.
- Fixed bottom navigation: **Program | Honorees | Tributes | About** (D32). No hamburger menu. Tab labels must fit an 80px tab at 320px wide in 15px bold Poppins (about 78px of text).
- Open outbound website links in a new tab (`target="_blank"`, `rel="noopener noreferrer"`) and include a screen-reader notice. Keep in-program anchors in the current tab (Blake, D26).
- Restrained motion (Blake’s explicit requests, D25 and D30): a brief opening ornament flourish, purposeful control feedback, a gliding tab marker, and CSS scroll-linked effects on ornaments only (divider rules, schedule dots, portrait medallions, the closing art) are allowed. Keep text immediately visible, avoid loops and moving reading content, and gate animations and smooth scrolling with `prefers-reduced-motion`. Scroll-linked effects sit behind `@supports (animation-timeline: view())` so unsupported browsers get the static page. Preserve native controls and full use without JavaScript.
- Semantic HTML: headings in order, `<details>` for “Read full bio”, a skip link, and alt text on every photo.

**Safety**
- Don't put internal run-of-show notes, phone numbers of individuals, or anything from `content/private/` into `public/`. Exception: contact details that an advertiser printed in their own Tributes ad are published as supplied (Blake, D32). Keep `original-ad-images/` out of the repo (it is gitignored).
- Don't commit or push unless the owner asks. The GitHub repo will be **public**, so check `git status` before any commit.
- Deploying, changing DNS, and anything else outward-facing needs the owner’s OK in the chat.

## Preview locally

```bash
python3 -m http.server 4173 --bind 127.0.0.1 --directory public
```
Open http://127.0.0.1:4173 and check it at 320, 375, 414, and 768 px wide. In Chrome DevTools, throttle to **“Slow 4G”** and reload to feel event conditions.

## Check page weight

```bash
bash scripts/check-budget.sh
```

## Deploy (D1, adopted 2026-09-23)

- **Repo:** https://github.com/Blake32p/banquet-program-2026 (**public**). The branch is `main`.
- **Live:** https://program.stratforddemocrats.com. GitHub Pages serves it, and the DNS is a CNAME `program` → `blake32p.github.io` at Wix. The old `blake32p.github.io/banquet-program-2026/` address redirects to it.
- **How to publish:** commit a change under `public/` and push to `main` (with the owner's OK). The workflow `.github/workflows/pages.yml` deploys in about 1 minute. Watch it with `gh run list -R Blake32p/banquet-program-2026`. Guests who already have the page open may see the old copy for up to 10 more minutes (GitHub sets `max-age=600`).
- Changes to docs, content, or print files don't trigger a deploy.
- The printed QR code points to **our own domain**. Never point it at a `*.github.io`, `*.vercel.app`, or `*.chatgpt.site` address.

## Writing style for any new copy

Warm, brief, celebratory. Sentence case for headings, except proper award names. Mark any copy an agent wrote with an HTML comment `<!-- DRAFT COPY: needs committee approval -->` until Blake or Kathleen approves it.
