# 当前终端架构与工具链

> **基调**：Ghostty (主) + cmux (可选工作台) + Fish (默认) + Chezmoi (管理)

## 核心基线
- **主终端**：Ghostty (默认集成 Fish)
- **工作台层**：cmux (复用 Ghostty 渲染基线，提供工作区 / 侧边栏 / 内置浏览器)
- **备用终端**：WezTerm (默认集成 Zsh，作兼容回退)
- **环境配置**：Chezmoi
- **开发环境**：Mise (管理 Node.js/Bun 等)

## 核心工具集
| 功能 | 工具 | 说明 |
|---|---|---|
| **Prompt** | `starship` | 极简、上下文感知的提示符 |
| **历史记录** | `atuin` | `Ctrl+Up` 触发，保留原生上下键 |
| **模糊搜索** | `fzf` | 终端内万物搜索 |
| **目录跳转** | `zoxide` | 接管 `cd`；本地路径不存在但命中数据库时先提醒，多个候选时进入交互选择 (`cdi`) |
| **高亮与提示** | `fish` 内建 | Autosuggestions & Syntax Highlighting |
| **文件与预览** | `eza`, `fd`, `bat`, `yazi` | 现代化的系统核心命令替代品 |
| **代码搜索** | `rg`, `delta`, `jq` | 高性能文本与数据处理 |

## 管理策略 (Chezmoi)
- **受管文件**：Ghostty, cmux, Fish, Starship, Atuin, Git, SSH (`hushlogin`) 及 `HOME.md`。
- **动态模板**：`wezterm.lua.tmpl` (实时拉取主题源配置)。
- **非受管/忽略**：`.zshrc` (仅作回退参考)。

## 设计与主题约束
1. **单一真相来源 (SSOT)**：所有终端颜色必须来源于 `themes/sayoriqwq-obsidian.yml`。
2. **终端职责分离**：Ghostty 负责终端基线 ANSI 色、字体和窗体外观；cmux 负责工作区、侧边栏、浏览器与快捷键层；语义级颜色（如 Fish 的语法高亮）由 `zz-theme-tokens.fish` 在 Shell 层独立完成。
3. **交互提示不可弱化**：Fish 的语义映射除颜色外，还需保留其内建修饰符提示，例如有效路径下划线、补全前缀加粗下划线、搜索匹配与选区加粗。
4. **极简体验**：按需显示，不打扰，无弹窗。`direnv` 暂不作为默认项引入，避免复杂化环境。
5. **启动输出策略**：`fish_greeting` 当前显式禁用启动文案，不输出时段问候、网络派生内容或隐藏彩蛋，启动后直接进入提示符。
