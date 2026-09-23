# Stratford Democrats · 2026 Annual Awards Banquet: digital program

A fast, phone-first web page that guests open from a QR code on their table on **Sunday, September 27, 2026**.

- **Live address (planned):** https://program.stratforddemocrats.com (decision D1)
- **The website itself:** `public/index.html`. It's one file, and there's nothing to install or build.
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

> Codex looks for `AGENTS.md` starting at the git root, so run `git init` in this folder before using Codex. See the WORKLOG for the exact first steps.

## Preview on your computer

```bash
python3 -m http.server 4173 --bind 127.0.0.1 --directory public
```
Then open http://127.0.0.1:4173. To see it at phone size in Chrome, press ⌥⌘I, then the device-toolbar icon.

## Docs

1. [Project brief](docs/01-project-brief.md): goals, audience, content inventory
2. [Hosting research](docs/02-hosting-research.md): ChatGPT Sites vs Vercel vs GitHub Pages, and setup steps
3. [Design system and performance budget](docs/03-design-system.md)
4. [Timeline and tasks](docs/04-timeline-and-tasks.md): the 4-day plan, plus a draft content-request email
5. [Launch checklist](docs/05-launch-checklist.md): QR code spec, PDF, QA, event day
- [Decisions](docs/DECISIONS.md) · [Work log](docs/WORKLOG.md)
