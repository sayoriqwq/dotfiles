# dotfiles

使用 [chezmoi](https://www.chezmoi.io/) 管理的 macOS 个人配置。

当前基线：

- Terminal: [Ghostty](https://ghostty.org/)
- Shell: Fish
- Dotfiles manager: `chezmoi`
- Node.js / Bun manager: `mise`
- Fallback terminal: [WezTerm](https://wezfurlong.org/wezterm/)

## 初始化

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply sayoriqwq
```

## 文档

- [docs/README.md](./docs/README.md): 文档入口与分工
- [docs/terminal-current-state.md](./docs/terminal-current-state.md): 当前终端基线、保留项、受管现状
- [docs/chezmoi.md](./docs/chezmoi.md): `chezmoi` 受管范围、忽略策略、常用工作流

当前仓库以 `Ghostty + Fish + chezmoi` 为主基线，`WezTerm` 保留为兼容 / 回退终端，`zsh` 配置只作为回退参考，默认不再由 `chezmoi` 受管。

主题颜色的语义层真相来源单独保存在 `themes/`，终端配置只负责消费和适配，不应反向把终端专属设置混入主题源。

仓库文档默认只保留在 repo 内，已通过 `.chezmoiignore` 排除，不会在 `chezmoi apply` 时写入 `~`。当前唯一受管的 Markdown 是 `~/HOME.md`。
