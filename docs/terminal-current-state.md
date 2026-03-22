# 当前终端架构与工具链

> **基调**：Ghostty (主) + Fish (默认) + Chezmoi (管理)

## 核心基线
- **主终端**：Ghostty (默认集成 Fish)
- **备用终端**：WezTerm (默认集成 Zsh，作兼容回退)
- **环境配置**：Chezmoi
- **开发环境**：Mise (管理 Node.js/Bun 等)

## 核心工具集
| 功能 | 工具 | 说明 |
|---|---|---|
| **Prompt** | `starship` | 极简、上下文感知的提示符 |
| **历史记录** | `atuin` | `Ctrl+Up` 触发，保留原生上下键 |
| **模糊搜索** | `fzf` | 终端内万物搜索 |
| **目录跳转** | `zoxide` | 替代 `cd`，智能跳转 (`z`) |
| **高亮与提示** | `fish` 内建 | Autosuggestions & Syntax Highlighting |
| **文件与预览** | `eza`, `fd`, `bat`, `yazi` | 现代化的系统核心命令替代品 |
| **代码搜索** | `rg`, `delta`, `jq` | 高性能文本与数据处理 |

## 管理策略 (Chezmoi)
- **受管文件**：Ghostty, Fish, Starship, Atuin, Git, SSH (`hushlogin`) 及 `HOME.md`。
- **动态模板**：`wezterm.lua.tmpl` (实时拉取主题源配置)。
- **非受管/忽略**：`.zshrc` (仅作回退参考)。

## 设计与主题约束
1. **单一真相来源 (SSOT)**：所有终端颜色必须来源于 `themes/sayoriqwq-obsidian.yml`。
2. **终端职责分离**：Ghostty 仅负责基线 ANSI 色和窗体外观；语义级颜色（如 Fish 的语法高亮）由 `zz-theme-tokens.fish` 在 Shell 层独立完成。
3. **极简体验**：按需显示，不打扰，无弹窗。`direnv` 暂不作为默认项引入，避免复杂化环境。
4. **启动文案策略**：`fish_greeting` 输出时段问候与一条禅意短句；短句优先使用 6 小时缓存的一言，网络请求失败时无感回退到本地句库，避免启动体验被网络状态绑架。
