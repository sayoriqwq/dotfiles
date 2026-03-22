# Chezmoi 管理指南

> 核心原则：**此仓库是真相来源 (SSOT)**。请勿直接修改家目录文件，所有变更必须通过 Chezmoi。

## 核心受管清单

| 目标路径 | 仓库源路径 | 职能 |
|---|---|---|
| `~/.config/ghostty/config` | `dot_config/ghostty/config` | Ghostty (主终端) |
| `~/.config/fish/config.fish` | `dot_config/fish/config.fish` | Fish (主 Shell) |
| `~/.config/starship.toml` | `dot_config/starship.toml` | 提示符 |
| `~/.config/atuin/config.toml` | `dot_config/atuin/config.toml` | 历史记录搜索 |
| `~/.wezterm.lua` | `dot_wezterm.lua.tmpl` | WezTerm (备用终端，动态读取主题) |
| `~/.gitconfig` | `dot_gitconfig` | Git 全局配置 |
| `~/HOME.md` | `HOME.md` | 主页索引 |

*(注：主题文件映射见 [主题与 Token 架构体系](./theme-tokens.md))*

## 仓库保留文件

以下文件**不会**被 Chezmoi 部署到你的家目录，它们仅存在于本仓库中用于管理和指引：
- `README.md`, `AGENTS.md`, `docs/` (文档体系)
- `themes/` (主题源文件)
- `.impeccable.md` (AI 核心设计准则)

## 常用工作流命令

**修改现有配置：**
```bash
chezmoi edit ~/.config/ghostty/config
# (此时打开的是仓库源文件)
chezmoi apply ~/.config/ghostty/config
```

**将外部修改同步回仓库：**
```bash
chezmoi diff -- ~/.config/ghostty/config
chezmoi re-add ~/.config/ghostty/config
```

**查看状态：**
```bash
chezmoi managed            # 查看所有受管文件
chezmoi source-path <file> # 找出一个文件的真实源路径
```