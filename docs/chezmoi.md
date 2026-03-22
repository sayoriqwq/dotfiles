# Chezmoi 使用说明

这个仓库的真相来源是 `chezmoi` 源文件，不是家目录里的目标文件。

## 受管文件

| 目标路径 | 源路径 | 说明 |
|---|---|---|
| `~/.config/fish/config.fish` | `dot_config/fish/config.fish` | Fish 配置 |
| `~/.wezterm.lua` | `dot_wezterm.lua` | WezTerm 配置 |
| `~/.gitconfig` | `dot_gitconfig` | Git 配置 |
| `~/.hushlogin` | `create_empty_dot_hushlogin` | 静默登录提示 |
| `~/.config/starship.toml` | `dot_config/starship.toml` | Starship 配置 |
| `~/.config/atuin/config.toml` | `dot_config/atuin/config.toml` | Atuin 配置 |
| `~/HOME.md` | `HOME.md` | Home 顶层索引文档 |

## 忽略路径

- `*.md` 和 `docs/`：仓库文档默认只保留在 repo 内
- `HOME.md`：作为例外单独纳入 `chezmoi` 管理
- `dot_config/ghostty/config` 对应的 `~/.config/ghostty/config`：默认忽略
- `dot_zshrc` 对应的 `~/.zshrc`：仓库保留作为回退参考，默认忽略

## 日常工作流

修改已有配置：

```bash
chezmoi edit ~/.wezterm.lua
chezmoi diff -- ~/.wezterm.lua
chezmoi apply ~/.wezterm.lua
chezmoi diff -- ~/.wezterm.lua
```

把目标文件改动回收进源文件：

```bash
chezmoi diff -- ~/.wezterm.lua
chezmoi re-add ~/.wezterm.lua
chezmoi diff -- ~/.wezterm.lua
```

把现有目标文件纳入管理：

```bash
chezmoi add ~/HOME.md
chezmoi diff -- ~/HOME.md
```

查看当前受管文件：

```bash
chezmoi managed
```

查看某个目标文件对应的源路径：

```bash
chezmoi source-path ~/.wezterm.lua
```

一句话规则：`edit -> diff -> apply -> diff`

补充说明：当前以 `fish` 作为默认 shell 基线，WezTerm 也默认进入 `fish`；`zsh` 配置只在仓库中保留作为回退参考，默认不再由 `chezmoi` 管理。
