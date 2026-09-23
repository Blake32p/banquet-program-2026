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
