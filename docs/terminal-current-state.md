# 终端当前状态

**日期：** 2026-03-22

## 当前基线

- 主终端：`ghostty`
- Ghostty 默认 shell：`fish`
- WezTerm 默认 shell：`zsh`
- dotfiles 管理器：`chezmoi`
- `Node.js` / `Bun` 管理器：`mise`
- 保留终端：`wezterm`，用于兼容 / 回退

## 核心工具

- Prompt：`starship`
- 历史搜索：`atuin`
- 模糊搜索：`fzf`
- 目录跳转：`zoxide`
- Fish 内建：autosuggestions、syntax highlighting
- 文件与预览：`eza`、`fd`、`bat`、`yazi`
- 搜索与 diff：`rg`、`delta`、`jq`
- 辅助工具：`thefuck`

## 受管状态

- 当前受管：`~/.config/fish/config.fish`、`~/.config/ghostty/config`、`~/.config/ghostty/themes/sayoriqwq-obsidian`、`~/.wezterm.lua`、`~/.gitconfig`、`~/.hushlogin`
- 当前受管：`~/.config/starship.toml`、`~/.config/atuin/config.toml`、`~/HOME.md`
- 默认忽略：`~/.zshrc`
- 默认仅保留在 repo 内的文档：`README.md` 与 `docs/`
- 单独受管的 Markdown：`~/HOME.md`

## 当前约束

- 当前方向是 `Ghostty + Fish + chezmoi`
- `WezTerm` 配置仍然保留并受管，但不再作为主终端基线
- `zsh` 配置仅在仓库中保留作为回退参考，默认不再受管
- Ghostty 与 WezTerm 都显式绑定各自 shell，不跟随系统 login shell
- Fish 配置默认直接初始化基线工具；缺失工具会在 shell 启动时直接暴露错误
- Fish 语法高亮当前刻意向 `zsh-syntax-highlighting` 的输入区表现靠拢
- 主题颜色的语义层真相来源单独放在 `themes/`，终端配置只负责适配
- Ghostty 当前通过 `theme = sayoriqwq-obsidian` 加载本地主题适配文件
- Ghostty 当前保留 tabs，并使用 `macos-titlebar-style = tabs`
- `direnv` 不是默认基线，除非用户明确要求，不要把它写成必需项
