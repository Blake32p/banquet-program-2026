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
| `public/index.html` | The whole program: one page with inline CSS and about 1 KB of JS | Yes |
| `public/assets/img/` | Compressed WebP images and the minified logo SVG | Yes |
| `public/assets/fonts/` | Poppins 400/700 and Playfair Display 700 Italic, Latin subsets (SIL OFL) | Yes |
| `content/` | **Source of truth for words.** Honoree bios, run of show, sponsors, About | No |
| `content/private/` | Internal run-of-show notes and anything not for guests (gitignored) | No |
| `docs/` | Brief, hosting research, design system, timeline, launch checklist, decisions, worklog | No |
| `reference/` | The 2026 flyer and the Canva draft PDF (gitignored; may hold draft content) | No |
| `source-assets/` | Original, full-size photos | No |
| `Logos/` | Logo files supplied by the owner. Use `stratford-democrats-light.svg` on dark backgrounds | No |
| `scripts/check-budget.sh` | Page-weight check. Run it before every handoff | No |
| `.github/workflows/pages.yml` | GitHub Pages deploy of `public/` (used if decision D1 = GitHub Pages) | No |

## Non-negotiables

**Content accuracy**
- Never invent names, titles, times, or facts. Anything unknown stays visibly marked `Draft:` until real content arrives.
- Bios are **verbatim** from `content/honorees.md`. Don't edit, shorten, or "improve" them. Copy changes go into `content/` first, then into the page.
- Use real typography: curly apostrophes (’), en dashes for ranges (11 AM – 2 PM), and the exact name spellings: **D’Angelo-Powers, Folsom-O’Keefe, Afriyie**.
- Credit Corrie’s photo: “Photo by Luke Franke.” (It is the caption on her photo on the event page.)

**Speed** (guests may have weak cell service)
- No frameworks, no build step, no CDNs, no third-party scripts, trackers, embeds, or web-font services. Everything is served from `public/`.
- Performance budget (details in `docs/03-design-system.md`):
  - `index.html` ≤ **14 KB gzipped**, so it arrives in the first network round trip
  - Total first visit ≤ **200 KB** (hard cap 300 KB), not counting the optional PDF
  - Portrait photos: WebP, 480×480, ≤ 30 KB each, with `loading="lazy"`, `width`, and `height`
  - JS ≤ 2 KB. The page must work fully with JS off.
- Run `scripts/check-budget.sh` after any change to `public/`.

**Readability and access** (dim room, all ages)
- Body text ≥ 19px. Nothing smaller than 15px. Large headings.
- Contrast is WCAG AAA (7:1) for body text on the navy background. Use the tokens in `:root` and don't add new colors ad hoc.
- Tap targets ≥ 48px tall. No horizontal scrolling from 320px to 1024px wide.
- Fixed bottom navigation: **Program | Honorees | Sponsors | About**. No hamburger menu.
- Minimal motion. Smooth scrolling only when `prefers-reduced-motion` allows it. No animations.
- Semantic HTML: headings in order, `<details>` for “Read full bio”, a skip link, and alt text on every photo.

**Safety**
- Don't put internal run-of-show notes, phone numbers of individuals, or anything from `content/private/` into `public/`.
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

## Deploy

See `docs/02-hosting-research.md` and decision **D1** in `docs/DECISIONS.md`. The recommended setup is GitHub Pages, deployed by `.github/workflows/pages.yml`, with the custom domain `program.stratforddemocrats.com`. The printed QR code must point to **our own domain**, never to a `*.github.io`, `*.vercel.app`, or `*.chatgpt.site` address.

## Writing style for any new copy

Warm, brief, celebratory. Sentence case for headings, except proper award names. Mark any copy an agent wrote with an HTML comment `<!-- DRAFT COPY: needs committee approval -->` until Blake or Kathleen approves it.
