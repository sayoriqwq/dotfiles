# CLI Tools

当前这台机器的终端基线是 `WezTerm + Zsh + chezmoi`。下面这份清单只记录已经在实际使用中的 CLI / 终端工具，以及最常见的使用方式。

## 终端与 Shell

### `wezterm`

主力终端。窗口、分屏、主题和快捷键都由 `chezmoi` 管理。

常见用法：

```bash
wezterm
```

### `zsh`

当前默认 shell，负责加载 prompt、补全、历史和 CLI 集成。

## Prompt 与历史

### `starship`

提示符工具。平时不用单独执行，主要通过 `~/.zshrc` 自动初始化。

### `atuin`

现代命令历史工具，负责更好用的历史搜索。

常见用法：

```bash
atuin search
atuin stats
```

说明：

- 已经接入 `zsh`
- 当前配置使用 `daemon-fuzzy`
- 适合替代纯粹依赖 shell 原始 history 的方式
- `Ctrl-R` 呼出完整 Atuin 搜索
- `Ctrl-↑` 呼出 `atuin-up-search`
- 普通 `↑ / ↓` 仍保留 Zsh 原生历史行为

## 导航与筛选

### `zoxide`

目录跳转工具。当前通过 `cd` 接管目录跳转体验。

常见用法：

```bash
zoxide query ecc
cd ecc_west
```

### `fzf`

模糊搜索工具，适合和文件列表、命令历史、`rg` 一起使用。

常见用法：

```bash
rg --files | fzf
history 1 | fzf
```

## 文件与内容查看

### `eza`

`ls` 的替代品。当前 shell 中 `ls` 已经别名到 `eza --icons=auto`。

常见用法：

```bash
ls
eza -la --icons=auto
```

### `fd`

更适合交互使用的文件查找工具，比 `find` 简洁。

常见用法：

```bash
fd env
fd -e ts check
fd package src
```

### `bat`

带语法高亮的文件查看工具，适合看配置文件、代码和 Markdown。

常见用法：

```bash
bat package.json
bat -n README.md
```

### `yazi`

终端文件管理器，适合快速浏览和移动文件。

常见用法：

```bash
yazi
yazi .
```

## 搜索、Diff 与数据处理

### `rg`

文本搜索主力工具。

常见用法：

```bash
rg "TODO" src
rg "DATABASE_URL"
rg --files | rg "package|tsconfig"
```

### `delta`

更易读的 diff 查看工具。

常见用法：

```bash
git diff | delta
delta file-a.txt file-b.txt
```

### `jq`

JSON 处理和查看工具。

常见用法：

```bash
jq '.scripts' package.json
jq '.name, .version' package.json
```

## 运行时与辅助工具

### `fnm`

当前在用的 Node 版本管理器。

常见用法：

```bash
fnm list
fnm use --install-if-missing 22
fnm default 22
```

### `thefuck`

命令纠错工具。当前 shell 中已经初始化。

常见用法：

```bash
fuck
```

### `mise`

已经安装，但当前不属于核心工作流。保留为后续可能的统一工具链管理选项。

常见用法：

```bash
mise ls
mise use node@latest
```

## 当前结论

- 当前最有实际价值的增强是 `atuin`
- `fd` 和 `bat` 已经适合纳入日常习惯
- `fnm` 仍然是当前 Node 管理主线
- `mise` 暂时保留，不强行进入基线
- `direnv` 目前不纳入默认工作流
