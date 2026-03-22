# 终端当前状态

**日期：** 2026-03-22

## 当前基线

- 主终端：`wezterm`
- 默认 shell：`fish`
- dotfiles 管理器：`chezmoi`
- `Node.js` / `Bun` 管理器：`mise`
- 辅助终端：`ghostty`，按 zero-config 模式使用

## 核心工具

- Prompt：`starship`
- 历史搜索：`atuin`
- 模糊搜索：`fzf`
- 目录跳转：`zoxide`
- Fish 内建：autosuggestions、syntax highlighting
- 文件与预览：`eza`、`fd`、`bat`、`yazi`
- 搜索与 diff：`rg`、`delta`、`jq`
- 辅助工具：`thefuck`

## 非基线项

- 当前不纳入基线：`direnv`
- 明确不再采用：`kaku`

## 受管状态

- 当前受管：`~/.config/fish/config.fish`、`~/.wezterm.lua`、`~/.gitconfig`、`~/.hushlogin`
- 当前受管：`~/.config/starship.toml`、`~/.config/atuin/config.toml`、`~/HOME.md`
- 默认忽略：`~/.config/ghostty/config`、`~/.zshrc`
- 默认仅保留在 repo 内的文档：`README.md` 与 `docs/`
- 单独受管的 Markdown：`~/HOME.md`

## 当前结论

当前方向是 `WezTerm + Fish + chezmoi`；`fish` 已经成为默认 shell，`zsh` 配置仅在仓库中保留作为回退参考，默认不再受管。
