# dotfiles

使用 [chezmoi](https://www.chezmoi.io/) 管理的 macOS 个人配置。

当前基线：

- Terminal: [WezTerm](https://wezfurlong.org/wezterm/)
- Shell: Zsh
- Dotfiles manager: `chezmoi`
- Ghostty: zero-config sidecar，不默认托管配置

## 初始化

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply sayoriqwq
```

## 文档

- [docs/chezmoi.md](./docs/chezmoi.md): 受管文件、日常工作流、忽略策略
- [docs/terminal-current-state.md](./docs/terminal-current-state.md): 当前终端工具基线与采用结论

仓库文档只保留在 repo 内，已通过 `.chezmoiignore` 排除，不会在 `chezmoi apply` 时写入 `~`。
