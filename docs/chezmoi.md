# Chezmoi Guide

这个仓库的真相来源是 `chezmoi` 源文件，不是家目录里的目标文件。

## 基线受管文件

| 目标路径 | 源路径 | 说明 |
|---|---|---|
| `~/.config/fish/config.fish` | `dot_config/fish/config.fish` | Fish 配置 |
| `~/.config/fish/conf.d/zz-theme-tokens.fish` | `dot_config/fish/conf.d/zz-theme-tokens.fish` | Fish 语义高亮 token 映射 |
| `~/.config/ghostty/config` | `dot_config/ghostty/config` | Ghostty 主终端配置 |
| `~/.config/ghostty/themes/sayoriqwq-obsidian` | `dot_config/ghostty/themes/sayoriqwq-obsidian` | Ghostty 主题适配文件 |
| `~/.wezterm.lua` | `dot_wezterm.lua` | WezTerm 兼容 / 回退配置 |
| `~/.gitconfig` | `dot_gitconfig` | Git 配置 |
| `~/.hushlogin` | `create_empty_dot_hushlogin` | 静默登录提示 |
| `~/.config/starship.toml` | `dot_config/starship.toml` | Starship 配置 |
| `~/.config/atuin/config.toml` | `dot_config/atuin/config.toml` | Atuin 配置 |
| `~/HOME.md` | `HOME.md` | Home 顶层索引文档 |

## Repo 内保留项

- `README.md`、`AGENTS.md`、`docs/`：仓库说明文档，只保留在 repo 内
- `themes/`：终端主题语义层源文件，只保留在 repo 内
- `.gitignore`：仓库元数据，只保留在 repo 内

## 忽略与例外

- `*.md` 和 `docs/`：仓库文档默认只保留在 repo 内
- `HOME.md`：作为例外单独纳入 `chezmoi` 管理
- `dot_zshrc` 对应的 `~/.zshrc`：仓库保留作为回退参考，默认忽略

## 本地附加源项

当前工作树里还存在 `skills/` 与 `skills-lock.json` 这类本地附加源项；它们会出现在 `chezmoi managed` 中，但不属于这里定义的终端基线文档范围。

## 日常工作流

修改已有配置：

```bash
chezmoi edit ~/.config/ghostty/config
chezmoi diff -- ~/.config/ghostty/config
chezmoi apply ~/.config/ghostty/config
chezmoi diff -- ~/.config/ghostty/config
```

把目标文件改动回收进源文件：

```bash
chezmoi diff -- ~/.config/ghostty/config
chezmoi re-add ~/.config/ghostty/config
chezmoi diff -- ~/.config/ghostty/config
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
chezmoi source-path ~/.config/ghostty/config
```

一句话规则：`edit -> diff -> apply -> diff`

补充说明：当前以 `Ghostty + Fish + chezmoi` 作为终端基线；Ghostty 主配置只保留终端行为和外观项，颜色主题通过本地 theme 文件适配；`WezTerm` 配置仍受管，但定位是兼容 / 回退；`zsh` 配置只在仓库中保留作为回退参考，默认不再由 `chezmoi` 管理。
