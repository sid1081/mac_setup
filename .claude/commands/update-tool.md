Update the configuration of an existing tool in this mac_setup repo.

The tool and what to change: `$ARGUMENTS`

Follow these steps:

1. **Understand the request**: Parse `$ARGUMENTS` to identify the tool name and what needs to change (e.g. "sketchybar add a cpu widget", "superfile enable zoxide", "aerospace add workspace for Figma").

2. **Read current config**: Read all relevant config files for the tool from the repo (not the system — the repo is the source of truth).

3. **Research if needed**: If the change requires something new (a new widget, plugin, or feature you don't have full context on), web search for how to implement it for this specific tool.

4. **Make the change**: Edit the relevant files in the repo. Follow the existing patterns and conventions already present in the config (naming, structure, style).

5. **README.md**: If the change is user-visible (new keybinding, new widget, new feature), update the relevant section in README.md to reflect it.

The symlinks mean your live config updates immediately — no need to restart unless the tool requires it (e.g. `brew services restart sketchybar` for SketchyBar changes).
