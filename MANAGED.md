# Managed Dotfiles

> 由 chezmoi 管理的配置文件映射表

| 类别 | 目标路径 | 源路径 | 说明 |
|------|---------|--------|------|
| Shell | `~/.zshrc` | `dot_zshrc` | Zsh 配置：PATH、插件、别名 |
| Prompt | `~/.config/starship.toml` | `dot_config/starship.toml` | Starship 提示符主题 |
| History | `~/.config/atuin/config.toml` | `dot_config/atuin/config.toml` | Atuin 历史搜索配置 |
| Git | `~/.gitconfig` | `dot_gitconfig` | Git 用户信息 |
| Terminal | `~/.wezterm.lua` | `dot_wezterm.lua` | WezTerm 终端配置：主题、快捷键、窗格 |

## 特殊处理

- `~/.config/ghostty/config` 的源文件是 `dot_config/ghostty/config`
- 该文件当前被 `.chezmoiignore` 显式忽略，不会在 `chezmoi apply` 时写入目标路径
- 当前 Ghostty 的使用策略是保留源配置用于回滚，但默认以 zero-config 模式运行
