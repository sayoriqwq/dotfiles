# dotfiles

使用 [chezmoi](https://www.chezmoi.io/) 管理的 macOS 个人配置。

## 工具栈

| 类别 | 工具 |
|------|------|
| Shell | Zsh + zsh-autosuggestions + zsh-syntax-highlighting |
| Prompt | [Starship](https://starship.rs/) |
| Terminal | [WezTerm](https://wezfurlong.org/wezterm/) |
| 包管理 | Homebrew |
| Node 版本 | fnm |
| 历史与筛选 | atuin, fzf |
| 导航与文件 | zoxide, eza, fd, bat, yazi |
| 搜索与 Diff | rg, delta, jq |
| 其他 | thefuck, mise（已安装，暂未纳入基线） |

## 配置清单

| 类别 | 目标路径 | 说明 |
|------|---------|------|
| Shell | `~/.zshrc` | PATH、插件、别名 |
| Prompt | `~/.config/starship.toml` | Starship 提示符主题 |
| History | `~/.config/atuin/config.toml` | Atuin 历史搜索配置 |
| Git | `~/.gitconfig` | Git 用户信息 |
| Terminal | `~/.wezterm.lua` | 主题、快捷键、窗格管理 |

## 使用

```bash
# 安装 chezmoi 并初始化
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply sayoriqwq
```

日常使用清单见 [use.md](./use.md)。

CLI 工具速查见 [CLI-tools.md](./CLI-tools.md)。

当前终端工具现状见 [docs/superpowers/2026-03-17-terminal-tools-current-state.md](./docs/superpowers/2026-03-17-terminal-tools-current-state.md)。

## 致谢

目录组织参考了 [Innei/dotfiles](https://github.com/Innei/dotfiles) 的分类思路。
