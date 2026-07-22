# 当前终端架构与工具链

> **基调**：Ghostty (主) + cmux (可选工作台) + Fish (默认) + Home Manager / Chezmoi (分层管理)

## 核心基线
- **主终端**：Ghostty (默认集成 Fish)
- **工作台层**：cmux (复用 Ghostty 渲染基线，提供工作区 / 侧边栏 / 内置浏览器)
- **备用终端**：WezTerm (默认集成 Zsh，作兼容回退)
- **环境配置**：Home Manager 管理 Ghostty/Fish、WezTerm/Zsh、Git、Starship 与通用 CLI；Chezmoi 管理其余应用 Dotfiles
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

## 管理策略
- **Home Manager**：Ghostty、Fish、WezTerm、Zsh、Starship、Git、Helix、tmux、direnv/nix-direnv 与通用 CLI。
- **Chezmoi**：cmux、Atuin 可写配置、SSH (`hushlogin`) 及 `HOME.md`。
- **状态边界**：Atuin databases/key、Ghostty history/session、Fish universal variables、Zsh history、GitHub auth、history 与 cache 保持为本机可写数据。

## 设计与主题约束
1. **单一目标所有者**：Ghostty 与 WezTerm 的静态配置、Fish 与 Zsh 的 shell 配置以 `nix-config` 为唯一声明来源；本仓库的 YAML 继续服务尚未迁移的消费者。
2. **终端职责分离**：Ghostty 负责终端基线 ANSI 色、字体和窗体外观；cmux 负责工作区、侧边栏、浏览器与快捷键层；Fish 与 Starship 的语义级颜色由 `nix-config` 的 Home Manager 声明。
3. **交互提示不可弱化**：Fish 的语义映射除颜色外，还需保留其内建修饰符提示，例如有效路径下划线、补全前缀加粗下划线、搜索匹配与选区加粗。
4. **极简体验**：按需显示，不打扰，无弹窗。`direnv` 与 `nix-direnv` 由 Home Manager 提供，但项目仍需显式 `direnv allow`。
5. **启动输出策略**：Home Manager 显式禁用 `fish_greeting`，不输出时段问候、网络派生内容或隐藏彩蛋，启动后直接进入提示符。
