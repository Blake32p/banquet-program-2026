# Stratford Democrats · 2026 Annual Awards Banquet: digital program

A fast, phone-first web page that guests open from a QR code on their table on **Sunday, September 27, 2026**.

- **Live address:** https://program.stratforddemocrats.com (GitHub Pages, repo [Blake32p/banquet-program-2026](https://github.com/Blake32p/banquet-program-2026))
- **Table-card QR code:** `print/qr-program.svg`
- **The website itself:** `public/index.html`. It's one file, and there's nothing to install or build.
- **Current design refinement:** [docs/mockups/redesign-v1.html](docs/mockups/redesign-v1.html). The approved edits are in this local mockup; porting and publishing are separate steps. See the [redesign plan](docs/06-redesign-plan.md).
- **Rules for AI agents (Codex or Claude):** [AGENTS.md](AGENTS.md)
- **Where things stand right now:** [docs/WORKLOG.md](docs/WORKLOG.md) (newest entry at the top)

## Switching between Claude and Codex

Both tools read the same instructions and leave notes in the same place:

| | Claude Code | Codex |
|---|---|---|
| Reads project rules from | `CLAUDE.md` → imports `AGENTS.md` | `AGENTS.md` (automatically) |
| Before starting | Read the newest `docs/WORKLOG.md` entry and `docs/DECISIONS.md` | Same |
| Before stopping | Add a `docs/WORKLOG.md` entry with an exact “Next step” | Same |

To hand off, open the other tool in this folder and paste the “Starter prompt” from the newest WORKLOG entry.

The repository is already initialized. Use the latest WORKLOG entry for the current handoff.

## Preview on your computer

```bash
python3 -m http.server 4173 --bind 127.0.0.1 --directory public
```
Then open http://127.0.0.1:4173. To see it at phone size in Chrome, press ⌥⌘I, then the device-toolbar icon.

For the current mockup, serve the project root with `python3 -m http.server 4174 --bind 127.0.0.1`, then open http://127.0.0.1:4174/docs/mockups/redesign-v1.html?v=4. Files in `docs/` are not deployed by GitHub Pages.

## Docs

1. [Project brief](docs/01-project-brief.md): goals, audience, content inventory
2. [Hosting research](docs/02-hosting-research.md): ChatGPT Sites vs Vercel vs GitHub Pages, and setup steps
3. [Design system and performance budget](docs/03-design-system.md)
4. [Timeline and tasks](docs/04-timeline-and-tasks.md): the 4-day plan, plus a draft content-request email
5. [Launch checklist](docs/05-launch-checklist.md): QR code spec, PDF, QA, event day
6. [Redesign plan](docs/06-redesign-plan.md): current mockup and requirements for the production port
- [Decisions](docs/DECISIONS.md) · [Work log](docs/WORKLOG.md)
