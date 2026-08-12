# Dotfiles archive

本仓库已完成退役，不再部署或管理任何本机配置。

## 当前事实来源

- [`nix-config`](https://github.com/sayoriqwq/nix-config)：软件、终端、Shell、CLI 与 Home Manager / nix-darwin 配置。
- [`yume-design`](https://github.com/sayoriqwq/yume-design)：`sayoriqwq-obsidian` 的颜色、语义 Token 与设计原则。

不要从本仓库运行 `chezmoi init`、`chezmoi apply`，也不要将历史文件重新作为活动配置。需要追溯迁移前实现时，使用 Git 历史中的不可变提交。

本地与远端仓库只保留审计价值；远端应保持只读归档，而不是删除，以维持 `nix-config` 迁移记录中的历史链接。
