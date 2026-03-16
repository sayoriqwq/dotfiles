# Terminal Tools Current State

**Date:** 2026-03-17
**Repo:** `/Users/sayori/.local/share/chezmoi`

## Summary

This machine currently uses WezTerm as the primary terminal, Zsh as the shell, and `chezmoi` as the source of truth for terminal-related dotfiles. Ghostty remains an optional zero-config secondary terminal. The current modernization work has effectively narrowed down to a small set of high-value interactive CLI tools rather than a broad terminal-stack migration.

## Core Terminal Setup

- Primary terminal: `wezterm`
- Secondary terminal: `ghostty` in zero-config evaluation mode
- Shell: `zsh`
- Dotfiles manager: `chezmoi`

## Current Tool Stack

### Active shell and terminal tools

These tools are installed and part of the current interactive workflow:

- `wezterm`
- `zsh`
- `starship`
- `fnm`
- `fzf`
- `zoxide`
- `eza`
- `thefuck`
- `rg`
- `delta`
- `yazi`
- `jq`
- `atuin`
- `fd`
- `bat`

### Installed but not part of the core workflow

- `mise`

### Not currently adopted

- `direnv`
- `kitty`

### Explicitly removed / avoided

- `kaku`

## What Each Tool Is Doing

- `wezterm`: primary terminal with managed theme, font, and pane workflow
- `ghostty`: unmanaged zero-config sidecar terminal for native defaults
- `starship`: prompt
- `fnm`: current Node version manager
- `fzf`: fuzzy selection in shell
- `zoxide`: directory jumping through `cd`
- `eza`: `ls` replacement
- `thefuck`: command correction helper
- `rg`: text search
- `delta`: diff pager
- `yazi`: terminal file manager
- `jq`: JSON inspection
- `atuin`: modern shell history and search
- `fd`: interactive file discovery
- `bat`: syntax-highlighted file preview
- `mise`: installed, but not yet part of the baseline shell workflow

## Chezmoi-Managed State

### Managed files

- `~/.zshrc` from `dot_zshrc`
- `~/.wezterm.lua` from `dot_wezterm.lua`
- `~/.config/starship.toml` from `dot_config/starship.toml`
- `~/.config/atuin/config.toml` from `dot_config/atuin/config.toml`

### Ghostty handling

- source kept at `dot_config/ghostty/config`
- apply intentionally blocked by `.chezmoiignore`
- target `~/.config/ghostty/config` is currently absent

This keeps the previous Ghostty config available for rollback without making Ghostty part of the default managed setup.

## Atuin Managed State

`atuin` is now part of the managed terminal baseline.

Managed behavior:

- `dot_zshrc` conditionally loads `~/.atuin/bin/env` when present
- `dot_zshrc` initializes `atuin` only when the command is available
- `dot_config/atuin/config.toml` keeps the shell history search on `daemon-fuzzy`
- `atuin` daemon autostart is enabled

## Current Conclusions

1. `atuin` is the only clear must-have addition that has now been migrated into the managed shell workflow.
2. `fd` and `bat` are useful daily interactive upgrades and are now part of the practical tool stack.
3. `mise` is installed, but not necessary for the current baseline because the workflow is mainly latest-version Node full-stack work.
4. `direnv` is not a baseline need for the current project mix because key projects already load `.env` through framework or script-level mechanisms.
5. The right direction is incremental refinement of the existing WezTerm-and-Zsh workflow, not a larger migration.

## Constraints

- Keep WezTerm as the primary terminal
- Keep Zsh as the shell
- Keep Ghostty as an optional zero-config terminal
- Do not reintroduce Kaku
- Do not force `mise` or `direnv` into the baseline workflow
- Prefer small, reversible shell improvements
