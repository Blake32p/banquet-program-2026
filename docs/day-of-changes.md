# Day-of changes (Sun Sep 27)

After the 9:30 AM freeze, only **small changes Blake approves** go in (D35). Examples: a speaker can't come, a presenter changes, or a name or title is wrong. Don't add sections, photos, or ads, and never touch the bios (they are verbatim).

A change is live about 1–2 minutes after the push. A guest who already has the page open may see the old copy for up to 10 more minutes; pulling down to refresh usually brings the new one.

## From your phone: a Claude cloud session (the Mac can be off)

A cloud session runs on Anthropic’s servers from the GitHub repo, so it works even with the Mac closed. It updates the **website**; the PDF waits for the Mac (see step 4).

1. In the Claude app, tap **Code** and choose the repo `Blake32p/banquet-program-2026` (branch `main`). The first time, it asks you to connect GitHub.
2. Say what happened, for example:
   > Event-day change (D35): Governor Ned Lamont can’t make it. Follow docs/day-of-changes.md: remove him from Welcome remarks in public/index.html and pdf/program.html, log it in content/run-of-show.md and docs/WORKLOG.md, run the budget check, and open a pull request.
3. Look over the change, then open the pull request (tap **Create PR** if Claude hasn’t already made one) and **merge** it in the GitHub app or on github.com. Cloud sessions can’t push to `main` themselves, so the site updates about a minute after you merge.
4. The PDF can’t be rebuilt in the cloud (the build uses Mac-only tools), so the downloadable PDF keeps the old wording until someone runs `bash scripts/build-pdf.sh` on the Mac and publishes it, the same day if possible.

Try it once tonight with a harmless request, e.g. “Read docs/day-of-changes.md and tell me which lines list Governor Lamont. Don’t change anything.” That checks the GitHub connection without touching the site.

## On Blake’s Mac: Claude or Codex (website and PDF together)

Say what happened, e.g. “Governor Lamont can’t make it. Take him off the program and publish.” The agent:

1. Adds a dated line under “Changes since v1” in `content/run-of-show.md`.
2. Makes the same edit in `public/index.html` **and** `pdf/program.html` (see the table below).
3. Runs `bash scripts/build-pdf.sh` (if it says the size label is out of date, updates “PDF · x.x MB” in `public/index.html` and runs it again), then `bash scripts/check-budget.sh`.
4. Commits and pushes to `main`, watches `gh run list -R Blake32p/banquet-program-2026`, and confirms the live page changed.
5. Adds a WORKLOG entry.

About 5 minutes in all. From the banquet, Blake can also reach a Claude session on the Mac from the Claude app by Remote Control, as long as the Mac is on, awake, and the Claude app is open.

## Phone-only fallback: edit on GitHub (website only)

Use this if neither Claude option works.

1. In a phone browser, signed in to GitHub, open
   https://github.com/Blake32p/banquet-program-2026/edit/main/public/index.html
2. Find the line (table below), change it, and leave everything else alone.
3. Tap **Commit changes…** and commit straight to `main`. The site updates in about a minute.
4. The PDF still shows the old wording. Later, have Claude or Codex on the Mac bring `pdf/program.html` in line and rebuild the PDF (the Mac steps above).

Tip: open that link once the night before to check you’re signed in, then leave without committing.

## Where each change goes

Line numbers are as of 2026-09-26 and shift if lines are added above them. Search for the name if they don’t match.

| Change | Website: `public/index.html` | PDF: `pdf/program.html` |
|---|---|---|
| A Welcome remarks speaker can’t come | Delete that speaker’s whole line, e.g. `<li>Governor <strong>Ned Lamont</strong></li>` (lines 316–320) | Same line (199–203) |
| Mayor Chess can’t give opening remarks | Delete the whole `<li>` that starts `<li><span class="seg">Opening remarks</span>` (line 325) | Same (line 208) |
| A presenter changes | Their name is in **two** places: the schedule’s “Presented by” (lines 326–328) and the honoree card’s “Presented by” (Anthony 344, Jill 358, Corrie 377, where first and last name are joined by `&nbsp;`). Change both. | Also two places: lines 209–211, and the honoree pages (Anthony 233, Jill 250, Corrie 270) |
| A time changes | The `<time>` line for that segment in `#program` | The same `<time>` line |

- Use the person’s title and name exactly as the committee gives them, with the same curly apostrophes (’). If a replacement presenter isn’t confirmed, ask Blake or Kathleen; don’t guess.
- Small time slips need no change: the program already says “Times are approximate.”
