# 后续设计与优化路线图 (Design & Optimization Roadmap)

基于我们在 `.impeccable.md` 中确立的“沉浸、专注、禅意极简”设计原则，以及 `sayoriqwq-obsidian` 作为终端 Token 的真相来源，以下是我们在整个配置仓库中贯彻这一设计体系的后续路线图。

## 1. 补充 Token 与进阶设计 (已完成 ✅)
**成果**：在 `themes/sayoriqwq-obsidian.yml` 中新增了 `tokens.intent.warning` (`#D4A373`)、`tokens.bg.surface` (`#1E1E1E`) 和 `tokens.bg.highlight` (`#252525`)，并同步更新了 `docs/theme-tokens.md`，完善了语义覆盖面。

## 2. 规范化与对齐 Starship 提示符 (Normalize) (进行中 🏃)
**目标**：将 Starship 的散落颜色配置严格对齐到已有的语义 Token 上，确保颜色不仅好看，而且在整个系统中拥有绝对严谨的语义逻辑。
**行动**：使用 `normalize` 技能，通过 HEX 值直接映射，去除对基础 ANSI 颜色名（如 `red`, `blue`）的依赖，避免终端调色板可能引起的语义混淆。同时利用 `colorize` 和 `polish` 思路，调整间距和色彩策略。

## 3. 全局规范化与终端对齐 (Normalize - Phase 2)
**目标**：确保所有外围工具（如 Fish 的高亮规则、Ghostty 的适配层等）严格对齐到已更新的 `sayoriqwq-obsidian.yml`。
**行动**：更新 `.config/fish/conf.d/zz-theme-tokens.fish` 和 `.config/ghostty/themes/sayoriqwq-obsidian`，承接新增的 Token，确保系统级的一致性。

## 4. 全局体验审查 (Audit)
**目标**：找出任何可能破坏沉浸感的地方，确保全局体验符合设计原则。
**行动**：使用 `audit` 技能，对整个仓库的终端配置（Ghostty, WezTerm, Fish, Zsh, Starship）做一次全面的体验审查，出具体验报告。
