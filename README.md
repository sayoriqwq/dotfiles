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
| 模糊搜索 | fzf |
| 现代 CLI | eza (ls), zoxide (cd), thefuck |

## 配置清单

| 类别 | 目标路径 | 说明 |
|------|---------|------|
| Shell | `~/.zshrc` | PATH、插件、别名 |
| Prompt | `~/.config/starship.toml` | Starship 提示符主题 |
| Git | `~/.gitconfig` | Git 用户信息 |
| Terminal | `~/.wezterm.lua` | 主题、快捷键、窗格管理 |

## 使用

```bash
# 安装 chezmoi 并初始化
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply sayoriqwq
```

日常使用清单见 [use.md](./use.md)。

## 致谢

目录组织参考了 [Innei/dotfiles](https://github.com/Innei/dotfiles) 的分类思路。
