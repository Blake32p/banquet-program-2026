# Decisions log

Status key: **OPEN** means it needs an answer · **PROPOSED** means there's a recommendation and we're waiting for the owner's OK · **ADOPTED** means we're going ahead with it.
When a decision changes, edit its row, record the date and who decided, and add a line to `WORKLOG.md`.

| # | Decision | Status | Recommendation / outcome | Who / when |
|---|---|---|---|---|
| **D1** | **Where to host, and the address the QR code points to** | **ADOPTED** | GitHub Pages (free, allowed for organizations) at **`https://program.stratforddemocrats.com`** (a CNAME in Wix DNS). The QR code points at *our* domain, so the host can change without reprinting. Plan B: `www.stratforddemocrats.com/program` with a Netlify redirect. Full reasoning in `docs/02-hosting-research.md`. Repo: `Blake32p/banquet-program-2026` (public). | Approved by Blake, 2026-09-23 |
| D2 | How the page is built | ADOPTED | Plain static HTML/CSS in `public/`: one page, no framework, no build step. Codex, Claude, or a volunteer can edit it, and any host can serve it. | Kickoff, 2026-09-23 |
| D3 | Visual direction | ADOPTED (pending committee review) | Follows the 2026 flyer: navy, gold, and script. Dark theme with AAA contrast. | Kickoff, 2026-09-23 |
| D4 | Script accent font | OPEN | Playfair Display Bold Italic is the stand-in. The better option is the flyer's actual script, as a subset WOFF2 or an SVG wordmark of “Banquet.” We need the font name from whoever made the flyer. | Committee |
| D5 | Navigation | ADOPTED | One page with a fixed bottom bar: **Program · Honorees · Sponsors · About**. No hamburger menu. There are jump pills to each honoree. | Kickoff, 2026-09-23 |
| D6 | How sponsors and ads appear | OPEN | Sponsor names as text, by tier, on the page. Ad artwork appears in the PDF and optionally in a tap-to-open, lazy-loaded “View the ads” area (≤ 120 KB per ad). Paid ads also rule out Vercel Hobby (see doc 02). | Committee |
| D7 | Where the PDF comes from | PROPOSED | Generate it from the site's print styles, so it always matches and stays small. Alternative: a compressed Canva export (prettier, but it has to be kept in sync by hand). | Owner |
| D8 | Bio length on screen | ADOPTED (pending review) | Show the first paragraph, with a “Read full bio +” control (`<details>`) for the rest. It keeps the Honorees section easy to scan. | Kickoff, 2026-09-23 |
| D9 | Search indexing | PROPOSED | Keep `noindex`. The main site's event page is the public page, and this program is for guests in the room. | Owner |
| D10 | Analytics | PROPOSED | None. Zero third-party requests, and no privacy notice needed. | Owner |
| D11 | Link from the main site | OPTIONAL | On event day, add a “View the digital program” button to the event page. It costs 1 Netlify deploy (15 credits). Don't add more deploys during event week. | Owner |
| D12 | ChatGPT Sites | PROPOSED | Use Codex to *write* code in this folder. Don't host the guest program on ChatGPT Sites (speed, beta permanence, political-use policy, terms). See doc 02. | Owner |
| D13 | Printed backup | PROPOSED | Put 10–15 printed copies of the PDF at registration for guests without a smartphone or without signal. | Committee |
| D14 | Content for Volunteers of the Year and Outstanding Volunteers | OPEN | Names, citations, and whether to include a name list, as in 2025 | Committee |
| D15 | “Paid for by” line | OPEN | Ask the Chair or Treasurer | Committee |
