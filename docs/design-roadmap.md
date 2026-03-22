# 后续设计与优化路线图 (Design & Optimization Roadmap)

基于我们在 `.impeccable.md` 中确立的“沉浸、专注、禅意极简”设计原则，以及 `sayoriqwq-obsidian` 作为终端 Token 的真相来源，以下是我们在整个配置仓库中贯彻这一设计体系的后续路线图。

## 1. 提炼与极简化终端提示符 (Distill)
**目标**：去除多余的色彩和符号，降低信息密度，使其符合 Obsidian 纯粹、克制的阅读体验。
**当前情况**：`dot_config/starship.toml` 等提示符配置中仍在使用基础颜色名（如 `purple`, `red`, `green`, `yellow`, `cyan`）。这可能导致色彩交替过于频繁，违背“禅意极简”和“减少视觉干扰”的原则。
**行动**：使用 `distill` 技能，重新设计 Starship 及其他 Shell 提示符，使其达到最低且最优雅的信息展示程度。

## 2. 补充 Token 与进阶设计
**目标**：完善 `sayoriqwq-obsidian.yml` 的语义覆盖面，确保所有终端交互都有合适的色彩映射。
**当前情况**：现有的语义 Token (`tokens.text`, `tokens.intent`) 已经涵盖了基础需求，但在实际应用（如复杂的代码高亮、特定的 TUI 界面）中，可能需要更精细的控制（例如：更深的背景色用于悬浮窗，或者特定的 Git 状态颜色）。
**行动**：在后续的梳理中，识别出缺乏明确语义映射的场景，并在源文件 `themes/sayoriqwq-obsidian.yml` 中补充相应的 Token，然后更新适配层。

## 3. 规范化与对齐 (Normalize)
**目标**：确保所有外围工具（如 Starship, 命令行工具的 fallback 颜色等）严格对齐到已有的语义 Token。
**当前情况**：虽然终端主题已经定义了清晰的语义（如 `tokens.intent.success`, `tokens.intent.danger` 等），但部分工具配置可能仍使用硬编码的颜色或不匹配的语义。
**行动**：使用 `normalize` 技能，将各处的散落配置统一映射到我们在 `.impeccable.md` 中确立的规则和 Token 上，确保语义的一致性。

## 4. 全局体验审查 (Audit)
**目标**：找出任何可能破坏沉浸感的地方，确保全局体验符合设计原则。
**当前情况**：我们刚刚建立规则，可能还有一些没注意到的死角（比如 Zsh/Fish 的自动补全颜色、Pager 的高亮颜色等是否符合最低对比度与舒适度）。
**行动**：使用 `audit` 技能，对整个仓库的终端配置（Ghostty, WezTerm, Fish, Zsh, Starship）做一次全面的体验审查，出具一份报告。
