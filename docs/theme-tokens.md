# 主题 Token 与终端高亮现状

**日期：** 2026-03-23

## 结论先说

当前仓库已经有一套统一的终端主题真相来源。终端 palette / 背景 / 光标 / 选区已经对齐；Fish 的输入区、pager 和 fallback 相关颜色也已经纳入 `chezmoi` 管理。

所以当前状态不是“没有主题”，而是：

- Ghostty 已经消费 `sayoriqwq-obsidian` 主题
- Fish 已经启用内建 syntax highlighting
- Fish 颜色来自受管文件 `~/.config/fish/conf.d/zz-theme-tokens.fish`

## 分层约定

当前把主题拆成三层：

1. 主题语义层

   真相来源是 [themes/sayoriqwq-obsidian.yml](/Users/sayori/.local/share/chezmoi/themes/sayoriqwq-obsidian.yml)。

   这里定义：

   - 基础终端字段：`background`、`foreground`、`cursor`、`selection_*`
   - ANSI 16 色：给终端和 TUI 使用
   - 稳定语义 token：给 Ghostty 适配、Fish 高亮映射等消费

2. 终端适配层

   当前是 [dot_config/ghostty/themes/sayoriqwq-obsidian](/Users/sayori/.local/share/chezmoi/dot_config/ghostty/themes/sayoriqwq-obsidian)。

   这一层只负责把主题语义源转成 Ghostty 可读字段，不负责定义 shell 语义高亮规则。

3. Shell 语义映射层

   这一层负责把 `command`、`error`、`autosuggestion`、`operator` 之类的 shell 语义映射到主题 token。

   当前受管入口是 [dot_config/fish/conf.d/zz-theme-tokens.fish](/Users/sayori/.local/share/chezmoi/dot_config/fish/conf.d/zz-theme-tokens.fish)。

## 当前 token 基线

当前 `sayoriqwq-obsidian` 的稳定 token 基线如下：

| Token | 颜色 | 用途 |
|---|---|---|
| `tokens.text.primary` | `#E0E0E0` | 正文主前景 |
| `tokens.text.muted` | `#D0D0D0` | 略弱一档的中性文本 |
| `tokens.text.subtle` | `#BDBDBD` | 说明性文本 |
| `tokens.text.faint` | `#454545` | 极弱文本、退后文本 |
| `tokens.intent.success` | `#81C784` | 成功 / 有效 / 可执行语义 |
| `tokens.intent.danger` | `#CF6679` | 错误 / 非法 / 风险语义 |
| `tokens.intent.info` | `#64B5F6` | 冷色功能性强调 |
| `tokens.intent.structure` | `#76C1E1` | 结构、连接、控制流语义 |
| `tokens.intent.accent` | `#A291B5` | 辅助强调色 |

## Fish 高亮的目标映射基线

下面这张表描述的是当前已经落到 repo 受管文件里的映射规则。

| Fish 语义 | 目标 token |
|---|---|
| `fish_color_normal` | `tokens.text.primary` |
| `fish_color_param` | `tokens.text.primary` |
| `fish_color_option` | `tokens.text.primary` |
| `fish_color_quote` | `tokens.text.primary` |
| `fish_color_valid_path` | `tokens.text.primary` |
| `fish_color_command` | `tokens.intent.success` |
| `fish_color_error` | `tokens.intent.danger` |
| `fish_color_keyword` | `tokens.intent.info` |
| `fish_color_escape` | `tokens.intent.info` |
| `fish_color_match` | `tokens.intent.info` |
| `fish_color_operator` | `tokens.intent.structure` |
| `fish_color_redirection` | `tokens.intent.structure` |
| `fish_color_end` | `tokens.intent.structure` |
| `fish_color_comment` | `tokens.text.faint` |
| `fish_color_autosuggestion` | `tokens.text.faint` |
| `fish_color_search_match` | `selection_bg` |
| `fish_color_selection` | `selection_bg` |

补全列表当前也倾向维持克制：

- `fish_pager_color_completion` 用正文前景
- `fish_pager_color_prefix` 用正文前景
- `fish_pager_color_description` 用正文前景
- `fish_pager_color_selected_background` 用 `selection_bg`
- `fish_pager_color_selected_description` 用 `tokens.text.faint`

第三组 fallback / prompt 相关字段当前采用下面的映射：

| Fish 语义 | 目标 token / 样式 |
|---|---|
| `fish_color_cwd` | `tokens.intent.info` |
| `fish_color_cwd_root` | `tokens.intent.danger` |
| `fish_color_user` | `tokens.intent.success` |
| `fish_color_host` | `tokens.text.primary` |
| `fish_color_host_remote` | `tokens.intent.structure` |
| `fish_color_status` | `tokens.intent.danger` |
| `fish_color_history_current` | `--bold` |
| `fish_color_cancel` | `--reverse` |
| `fish_pager_color_progress` | `tokens.text.primary` + `selection_bg` |

## 当前不一致点

截至 2026-03-23，Ghostty 的终端主题和 Fish 的已知高亮字段都已经切到同一套 Obsidian token。

当前剩余约束只有一个：

- 如果后续再次使用 `fish_config` 生成冻结主题文件，需要确认是否要继续保持 repo 中的 token 映射为唯一真相来源

## 后续处理原则

后续如果把 Fish 高亮正式纳入仓库，按下面的规则处理：

- 不把 Fish 颜色写进 `fish_variables`
- 优先在 repo 中新增受管文件，显式设置 `fish_color_*`
- Fish 只消费 token，不重新发明第二套 palette
- Ghostty 继续只负责终端主题适配，不承担 shell 语义映射职责
