@AGENTS.md

<!-- Claude Code: the line above imports AGENTS.md, the shared rules for Claude and Codex.
     Put project rules in AGENTS.md, not here, so Codex sees them too.
     Claude-only notes go below this comment. -->

## Claude-only notes

- `.claude/launch.json` defines a `program` preview server (python http.server on port 4173, serving `public/`). Use `preview_start` with name `program` to open it in the browser pane.
- `.claude/launch.json` also defines a `mockup` server (port 4174, serving the project root) so design mockups in `docs/mockups/` can load `public/assets/`. Open http://127.0.0.1:4174/docs/mockups/redesign-v1.html.
