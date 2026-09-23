# Work log

**Newest entry first.** Every agent session (Claude or Codex) and every meaningful human session adds an entry here *before stopping*. That lets the next person or agent pick up without re-reading the chat history.

### Template (copy it to the top)
```
## YYYY-MM-DD HH:MM ET · <Claude | Codex | Blake | …> · <one-line summary>
**Did:** bullets of what changed (files)
**Checked:** what was verified (budget script, widths, devices)
**Decisions:** any D# changed (also update DECISIONS.md)
**Blocked on / waiting for:** …
**Next step (exact):** the very next thing to do, specific enough to start cold
```

---

## 2026-09-23 16:10 ET · Claude · Published run of show v1 + closing page

**Did:** With Blake's OK, committed `c9abf45` and pushed. The Actions deploy run 35911503101 succeeded.
**Checked:** https://program.stratforddemocrats.com serves the new Program section (it contains “Governor Ned Lamont” and the “Anthony Afriyie” link) and `#congratulations`. `congratulations.svg` returns 200 (10.7 KB). `http://` now 301s to `https://` (the earlier cached 200 has cleared).
**Blocked on / waiting for:** event team answers on D14, D15, and D17; sponsors (D6); the Terry Backer blurb; run of show v2 if it changes.
**Next step (exact):** Blake test-scans a printed proof of `print/qr-program.svg` on iPhone and Android, then sends the table cards to print (by Thu 9/24). Apply run-of-show updates using `content/run-of-show.md` → “How to apply a new version.”

---

## 2026-09-23 16:00 ET · Claude (Claude Code, Opus 5.5) · HTTPS live; run of show v1 and closing page built

**Did:**
- **Domain live.** Blake added the Wix CNAME. The domain didn't get a certificate on its own, because it was attached before the DNS record existed. Re-saving the custom domain (API: clear it, then set it again) got it **issued** right away (Let's Encrypt, expires 2026-12-22). **Enforce HTTPS is on.**
- **Run of show v1** (Blake, 3:37 PM): saved as `reference/run-of-show-2026-09-23.docx` (gitignored). Raw text and the guest-facing table are in `content/run-of-show.md`. Rebuilt `#program`: Arrival 11:00 → Welcome remarks 11:20 (5 speakers) → Brunch 12:00 → Awards 1:00 (5 segments, with award lines linking to honoree cards) → Departure 2:00. On phones, the time now sits above each segment.
- **Closing page** (Blake: “the final page… needs to be included basically as it is… the end of the program”):
  - Extracted the Canva page's own vector art (lettering, burst, rays, and 14 stars) with `pdftocairo -svg`. Removed the background JPEG, the text glyphs, and a stray 24×13 dark mark that appears in the PDF. Pruned unused defs and rounded coordinates → `public/assets/img/congratulations.svg` (38.8 KB, 10.5 KB gzipped).
  - It's the new last section, `#congratulations`: a royal-blue gradient with the exact text as live HTML in `#b8e3f6` (7:1 or more).
  - The About thank-you blockquote was removed so the note isn't repeated. The footer moved below the closing page. The About tab is highlighted while the closing page is on screen.
- Docs: AGENTS (closing page must stay last; the run of show is the source), DECISIONS D14–D17, doc 03 (layout order), `content/sponsors-and-about.md`.

**Checked:**
- https://program.stratforddemocrats.com serves every asset with 200 and the right certificate subject. The github.io address 301s to it.
- Plain `http://` still returned a cached 200 about 8 minutes after enforcement (Fastly `X-Cache: HIT`). Recheck later; the QR code uses https anyway.
- Budget: HTML 12.5 KB gzipped, first visit 115 KB. OK.
- No horizontal overflow at 320, 375, or 768 px. Screenshots of the Awards list and the closing page were reviewed at 375 and 768.

**Decisions:** D16 adopted; D17 proposed; D14 and D15 updated.

**Blocked on / waiting for:**
- ~~Blake: OK to publish~~ Approved and published at 16:10 (see the entry above).
- **Event team:** confirm “Presented by” (D17), the volunteer segment naming (D14), and the “Paid for by” question (D15).

**Next step (exact):** once Blake approves, `git add -A && git commit` (message: "Add run of show v1 and closing Congratulations page") and push. Wait for the Actions run to finish, then load https://program.stratforddemocrats.com on a phone and check the Program and closing sections. When run of show v2 arrives, follow “How to apply a new version” in `content/run-of-show.md`.

---

## 2026-09-23 14:40 ET · Claude (Claude Code, Opus 5.5) · GitHub Pages set up, photo credit corrected, QR code generated

**Did:**
- **Corrected the photo credit:** “Photo by Luke Franke” belongs to **Corrie’s** photo, not Jill’s. It's the `<figcaption>` on Corrie’s photo on the event page, and my kickoff text extraction had attached it to the end of Jill’s bio. Fixed in `public/index.html`, `content/honorees.md`, `AGENTS.md`, and the doc 05 checklist.
- **D1 adopted** (Blake approved): GitHub Pages + `program.stratforddemocrats.com`.
- `git init` (branch `main`). Repo-local identity: Blake Powers `380243+Blake32p@users.noreply.github.com`, matching the main site repo; the global git config wasn't touched. First commit `7d4ff9d`.
- Created the **public** repo https://github.com/Blake32p/banquet-program-2026 and pushed.
- Turned on Pages (`build_type=workflow`). The first Actions deploy passed (run 35903142549). The custom domain is set to `program.stratforddemocrats.com`.
- Generated the QR code → `print/qr-program.svg` and `print/qr-program-1200px.png` (version 2, 25×25 modules, ECC M, navy on white).

**Checked:**
- Before setting the custom domain, the live site at the github.io address returned 200 for the page, a photo, a font, and the logo. The HTML is 11.7 KB gzipped, served with `cache-control: max-age=600` and gzip.
- The live HTML has the credit under Corrie’s photo.
- The QR code was decoded with Chrome’s BarcodeDetector and returns exactly `HTTPS://PROGRAM.STRATFORDDEMOCRATS.COM`.
- `git status` before the commit: `reference/` is ignored, and no private files are included.

**Decisions:** D1 → ADOPTED.

**Notes for later (after the event):** the Actions run warns that `actions/checkout@v4`, `configure-pages@v5`, and `deploy-pages@v4` target Node 20. They're forced onto Node 24 and still work. Bump them to their latest majors **after** the event, not during event week.

**Blocked on / waiting for:**
- **Blake:** add the DNS record in Wix: **CNAME, Host `program`, Value `blake32p.github.io`**. Optional: verify the domain in GitHub (github.com/settings/pages → Add a domain → `stratforddemocrats.com` → add the TXT record it shows in Wix).
- **Committee:** content items (email draft in doc 04).

**Next step (exact):**
1. Once `dig +short CNAME program.stratforddemocrats.com @1.1.1.1` returns `blake32p.github.io.` and `gh api repos/Blake32p/banquet-program-2026/pages --jq .https_certificate.state` returns `approved`, run:
   `gh api -X PUT repos/Blake32p/banquet-program-2026/pages -F https_enforced=true`
   If the certificate stays “none” for more than about 30 minutes after DNS resolves, clear the custom domain and set it again in repo Settings → Pages. That re-triggers the certificate request.
2. Test https://program.stratforddemocrats.com on a phone using cellular data, then scan `print/qr-program.svg` from a printed proof.

---

## 2026-09-23 · Claude (Claude Code, Opus 5.5) · Kickoff: research, plan, v0 prototype

**Did:**
- Reviewed the inputs: the 2026 Save-the-Date flyer, the Canva program PDF (a 2025 template; only page 7 is updated for 2026), the `Logos/` folder, and the event page at stratforddemocrats.com.
- Researched hosting (two parallel research passes, with sources) → `docs/02-hosting-research.md`:
  - “Codex site” = **ChatGPT Sites** (public beta since Jul 9, 2026).
  - Vercel Hobby is “non-commercial personal use only.”
  - GitHub Pages allows organizational projects.
  - The main site is on **Netlify Free** and its DNS is at **Wix**.
- Wrote `AGENTS.md` (shared rules for Codex and Claude) and `CLAUDE.md` (imports AGENTS.md).
- Wrote docs `01` to `05`, `DECISIONS.md`, and this log.
- Content: `content/honorees.md` (bios verbatim from the event page), `content/run-of-show.md` (waiting for the run of show), `content/sponsors-and-about.md`.
- Assets:
  - Honoree photos cropped square, 480px WebP, 13–25 KB each (the originals were 35–95 KB) → `public/assets/img/`. Originals are in `source-assets/`.
  - Logo minified 12.4 → 9.0 KB (3.4 KB gzipped) and inlined.
  - Fonts copied from the main site's @fontsource packages.
- Built the **v0 prototype**, `public/index.html`:
  - Sections: hero, Program (placeholder times, marked Draft), Honorees (real bios with “Read full bio”), Sponsors (placeholder), and About (thank-you note, DTC blurb, links, PDF button).
  - A fixed bottom tab bar with scroll highlighting.
  - Print styles for the PDF.
- Added `scripts/check-budget.sh`, `.github/workflows/pages.yml` (not active until a repo exists), `.gitignore`, and `.claude/launch.json` (preview server).

**Checked:**
- Budget script: HTML **11.7 KB gzipped**, first-visit total **104 KB**. PASS.
- Widths 320, 375, and 768 px: no horizontal scrolling, all 4 tabs fit at 320px, and photos load.
- Contrast computed: body 16.4:1, secondary 11.8:1, gold 10.8:1 (all AAA).
- Fixed a line break in “Folsom-O’Keefe” and the photo-credit placement on tablets.

**Decisions:** proposed D1, D7, D9, D10, D12, and D13. Adopted D2, D3, D5, and D8 (pending review). D4, D6, D14, and D15 are open (see DECISIONS.md).

**Blocked on / waiting for:**
- **Owner:** D1 approval, then the GitHub repo, Pages, and the Wix CNAME. This is the critical path for printing the QR code.
- **Committee:** run of show, Volunteers of the Year, sponsors and ads, Terry Backer blurb, thank-you wording, and the “Paid for by” answer. A draft email is in `docs/04-timeline-and-tasks.md`.

**Next step (exact):**
1. Owner approves D1.
2. `git init` + first commit. Check `git status` first, and confirm `reference/` and `content/private/` are ignored.
3. Create a **public** repo, `Blake32p/banquet-program-2026`, and push.
4. Set Settings → Pages → Source to “GitHub Actions,” and set the custom domain to `program.stratforddemocrats.com`.
5. In Wix DNS, add CNAME `program` → `blake32p.github.io`.
6. Then generate the QR code (doc 05 §A).

**Starter prompt for the next Codex session (copy-paste):**
> Read AGENTS.md, then the newest entry in docs/WORKLOG.md and the open items in docs/DECISIONS.md. The final run of show is pasted in content/run-of-show.md under “Raw run of show.” Write the guest-facing version in the same file, update the #program section of public/index.html to match, remove the program Draft note, run `bash scripts/check-budget.sh`, preview at 320px and 375px, then add a WORKLOG entry. Don't commit.
