# 主题与 Token 架构体系

> **核心原则**：所有的颜色都必须具有明确的语义。绝不写死“红色”或“蓝色”，只使用 `intent.danger` 或 `intent.info`。
> **真相来源**：`themes/sayoriqwq-obsidian.yml`

## 1. 语义 Token 基线
为保障“禅意”与低视觉疲劳，我们在基础的 ANSI 16 色之上，抽象出了以下业务级 Token：

### 文本层级 (Text)
| Token | 颜色值 | 适用场景 |
|---|---|---|
| `text.primary` | `#E0E0E0` | 正文主前景 |
| `text.muted` | `#D0D0D0` | 略弱一档的中性文本 (如次要路径) |
| `text.subtle` | `#BDBDBD` | 说明性文本 |
| `text.faint` | `#454545` | 极弱文本 (如自动补全提示、Git 状态符号) |

### 意图层级 (Intent)
| Token | 颜色值 | 适用场景 |
|---|---|---|
| `intent.success` | `#81C784` | 成功 / 有效命令 / Vim Normal 模式 |
| `intent.danger` | `#CF6679` | 错误 / 非法语法 / Root 警告 |
| `intent.warning` | `#D4A373` | 警告 / 变更中间态 / 耗时过长 |
| `intent.info` | `#64B5F6` | 冷色强调 (如当前目录名、关键字) |
| `intent.structure` | `#76C1E1` | 结构连接词 / 括号与操作符 |
| `intent.accent` | `#A291B5` | 辅助强调色 (如 Git 分支名) |

### 界面层级 (Background)
| Token | 颜色值 | 适用场景 |
|---|---|---|
| `bg.surface` | `#1E1E1E` | 浮层背景 (如 Fish Pager 补全菜单) |
| `bg.highlight` | `#252525` | 极弱高亮底色 (如搜索匹配行) |
| `selection_bg` | `#2C3E50` | 强选区背景 |

---

## 2. 终端侧的实现映射

### Fish Shell 语法高亮
Fish 的颜色不由终端调色板接管，而是直接将上述 Token 映射为 HEX 写入 `zz-theme-tokens.fish`。
除颜色映射外，需保留 Fish 内建的交互提示修饰符，避免语义统一后削弱可感知性。
**核心映射范例：**
- 普通命令 (`command`) -> `intent.success`
- 非法命令 (`error`) -> `intent.danger`
- 管道/重定向 (`operator` / `redirection`) -> `intent.structure`
- 有效路径 (`valid_path`) -> `text.primary` + `--underline`
- 搜索匹配 / 选区 (`search_match` / `selection`) -> `text.primary` + 背景强调 + `--bold`
- 补全前缀 (`pager_color_prefix`) -> `text.primary` + `--bold --underline`
- 补全描述 (`pager_color_description`) -> `text.primary` + `--italics`
- 补全菜单背景 (`pager_color_selected_background`) -> `bg.surface`

> 说明：Fish 4.5 已不再使用 `fish_color_match`，不应继续把它当作有效的主题入口。

### Starship 提示符
充分利用 `$before_root_path` (仓库外) 和 `$path` (仓库内)，配合 Token 实现沉浸式路径引导：
- 目录路径前缀 -> `text.muted`
- 当前 Git 仓库名及内部路径 -> `intent.info`
- 分支名称 -> `intent.accent`

### Ghostty 与 WezTerm
- **Ghostty**：通过静态的 `sayoriqwq-obsidian` 主题文件，仅消费基础的 ANSI 色谱与窗口背景色。
- **WezTerm**：通过 Chezmoi 的 `.tmpl` 模板动态解析 YAML 真相来源，消灭配置硬编码。
