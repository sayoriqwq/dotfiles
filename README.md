# Sayori's Dotfiles

使用 [Chezmoi](https://www.chezmoi.io/) 构建的极简、禅意 macOS 个人终端环境。

## 核心基调
- **主终端**: [Ghostty](https://ghostty.org/)
- **多工作区工作台**: [cmux](https://cmux.com/) (可选，复用 Ghostty 基线)
- **主 Shell**: Fish
- **备用回退**: [WezTerm](https://wezfurlong.org/wezterm/) + Zsh
- **环境管理**: Chezmoi (Dotfiles), Mise (Node.js/Bun)

整个终端环境基于一套名为 `sayoriqwq-obsidian` 的低饱和度设计系统。所有组件（包括 Starship 提示符、Fish 语法高亮、Ghostty / cmux / WezTerm 的终端呈现）均严格对齐该 Token 体系，确保长时间使用的视觉沉浸感。

## 快速开始

```bash
# 全新机器一键初始化
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply sayoriqwq
```

## 文档指引
> 详见 [docs/README.md](./docs/README.md) 导航页

- [终端与工具链](./docs/terminal-current-state.md): 了解当前使用的现代 CLI 工具替代品 (如 eza, zoxide, fd)。
- [Chezmoi 管理指南](./docs/chezmoi.md): 了解配置的同步规则、文件源路径及日常增改查工作流。
- [主题与 Token 体系](./docs/theme-tokens.md): 了解本仓库如何实现“单一真相来源”的全局终端着色。

## 设计原则
本仓库维护遵循 [`.impeccable.md`](./.impeccable.md) 中的设计纲领：
**沉浸、专注、禅意极简**。任何针对 UI 的 PR 与配置修改，都必须确保低视觉噪音和绝对的语义一致性。
