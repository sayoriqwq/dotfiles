# Chezmoi 管理指南

> 核心原则：**此仓库是 Chezmoi 职责范围内的真相来源**。Ghostty、Fish、Git、Starship 与通用 CLI 已由 `nix-config` 的 Home Manager 层接管；一个目标路径只能有一个配置所有者。

## 核心受管清单

| 目标路径 | 仓库源路径 | 职能 |
|---|---|---|
| `~/.config/cmux/settings.json` | `dot_config/cmux/settings.json` | cmux 工作台设置 |
| `~/.config/atuin/config.toml` | `dot_config/atuin/config.toml` | 历史记录搜索 |
| `~/.wezterm.lua` | `dot_wezterm.lua.tmpl` | WezTerm (备用终端，动态读取主题) |
| `~/HOME.md` | `HOME.md` | 主页索引 |

*(注：主题文件映射见 [主题与 Token 架构体系](./theme-tokens.md))*

## Home Manager 所有权边界

以下目标不再由 Chezmoi 管理，其声明位于 `nix-config`：

- `~/.config/fish/config.fish`、相关 `conf.d` 与 functions；
- `~/.config/starship.toml`；
- Git XDG config、global ignore 与 credential helper。
- `~/.config/ghostty/config` 与 `~/.config/ghostty/themes/sayoriqwq-obsidian`。

Git identity 保留在本机私有 `~/.config/git/identity.inc`，不进入两个仓库。Atuin config/data、Ghostty history/session、Fish universal variables 与 GitHub auth 等可变状态不由 Home Manager 链接进 Nix Store。不要对 Home Manager 拥有的路径运行 `chezmoi add`、`re-add` 或 `apply`。

## 仓库保留文件

以下文件**不会**被 Chezmoi 部署到你的家目录，它们仅存在于本仓库中用于管理和指引：
- `README.md`, `AGENTS.md`, `docs/` (文档体系)
- `themes/` (主题源文件)
- `.impeccable.md` (AI 核心设计准则)

## 常用工作流命令

**修改现有配置：**
```bash
chezmoi edit ~/.config/cmux/settings.json
chezmoi apply ~/.config/cmux/settings.json
```

**查看状态：**
```bash
chezmoi managed            # 查看所有受管文件
chezmoi source-path <file> # 找出一个文件的真实源路径
```
