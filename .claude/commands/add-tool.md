Add the tool `$ARGUMENTS` to this mac from scratch and integrate it into the mac_setup repo.

Follow these steps in order:

1. **Research**: Web search for `$ARGUMENTS` to find the official install method, Homebrew formula/cask name, and where it stores its config files on macOS.

2. **Install**: Install `$ARGUMENTS` via Homebrew (`brew install` or `brew install --cask`). If it's not on Homebrew, use the official install method.

3. **Generate default config**: Run the tool once headlessly if needed to generate its default config files, so there's something to copy into the repo.

4. **Brewfile**: Add the formula or cask to `Brewfile` under an appropriate comment header.

5. **Config directory**: Find where the config lives (`~/.config/$ARGUMENTS/` or `~/Library/Application Support/$ARGUMENTS/` are the most common on macOS). Create a `$ARGUMENTS/` directory at the repo root and copy the config files into it.

6. **install.sh**: Add a numbered symlink step following the existing pattern — back up any existing non-symlink file before overwriting, symlink repo files to the system config path, print confirmation. Use the correct pattern from CLAUDE.md depending on whether the target is `~/.config/` or `~/Library/Application Support/`. Keep section numbers consecutive.

7. **README.md**: Update the one-liner header to include `$ARGUMENTS`, update the install steps list if the symlink target is non-obvious, and add a `### $ARGUMENTS` section under "What's included" with a short description, theme/visual setup if relevant, and key bindings.

8. **CLAUDE.md**: Add `$ARGUMENTS` and its config location to the reference table at the bottom.
