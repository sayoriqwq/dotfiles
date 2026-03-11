# use.md

这个仓库使用 [chezmoi](https://www.chezmoi.io/) 管理 dotfiles。

## 核心原则

- 日常修改，优先改 chezmoi 源文件，不直接改家目录目标文件
- 目标文件只在临时试验时直接修改，确认后再回收进源文件
- 每次修改后都用 `chezmoi diff` 检查是否还有漂移

## 目标文件与源文件

| 目标文件 | chezmoi 源文件 |
|---|---|
| `~/.gitconfig` | `dot_gitconfig` |
| `~/.zshrc` | `dot_zshrc` |
| `~/.wezterm.lua` | `dot_wezterm.lua` |
| `~/.config/starship.toml` | `dot_config/starship.toml` |

## 推荐工作流

### 1. 修改已有配置

```bash
chezmoi edit ~/.wezterm.lua
chezmoi diff -- ~/.wezterm.lua
chezmoi apply ~/.wezterm.lua
chezmoi diff -- ~/.wezterm.lua
```

说明：

- `chezmoi edit` 会打开对应的源文件
- `chezmoi apply` 会把源文件同步到家目录目标文件
- 最后一次 `chezmoi diff` 无输出，表示源和目标一致

### 2. 你手滑直接改了家目录文件

```bash
chezmoi diff -- ~/.wezterm.lua
chezmoi re-add ~/.wezterm.lua
chezmoi diff -- ~/.wezterm.lua
```

说明：

- `chezmoi re-add` 会把目标文件当前内容回收进源文件
- 在确认要保留本机修改前，不要先执行 `chezmoi apply`

### 3. 新增一个已有文件到 chezmoi 管理

```bash
chezmoi add ~/.config/example/app.toml
chezmoi diff -- ~/.config/example/app.toml
```

### 4. 检查当前有哪些文件被管理

```bash
chezmoi managed
```

### 5. 查看源文件实际路径

```bash
chezmoi source-path ~/.wezterm.lua
```

## 常用命令速查

```bash
# 编辑源文件
chezmoi edit ~/.wezterm.lua

# 应用到目标文件
chezmoi apply ~/.wezterm.lua

# 查看源/目标差异
chezmoi diff -- ~/.wezterm.lua

# 把目标文件改动回收进源文件
chezmoi re-add ~/.wezterm.lua

# 查看这个文件对应的源文件路径
chezmoi source-path ~/.wezterm.lua

# 列出所有受管文件
chezmoi managed
```

## 针对这个仓库的建议

- WezTerm: 用 `chezmoi edit ~/.wezterm.lua` 修改
- Starship: 用 `chezmoi edit ~/.config/starship.toml` 修改
- Git: 用 `chezmoi edit ~/.gitconfig` 修改
- Zsh: 用 `chezmoi edit ~/.zshrc` 修改

一句话规则：

`edit -> diff -> apply -> diff`
