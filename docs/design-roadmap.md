# 后续设计与优化路线图 (Design & Optimization Roadmap)

基于我们在 `.impeccable.md` 中确立的“沉浸、专注、禅意极简”设计原则，以及 `sayoriqwq-obsidian` 作为终端 Token 的真相来源，以下是我们在整个配置仓库中贯彻这一设计体系的后续路线图。

## 1. 补充 Token 与进阶设计 (已完成 ✅)
**成果**：在 `themes/sayoriqwq-obsidian.yml` 中新增了 `tokens.intent.warning` (`#D4A373`)、`tokens.bg.surface` (`#1E1E1E`) 和 `tokens.bg.highlight` (`#252525`)，并同步更新了 `docs/theme-tokens.md`，完善了语义覆盖面。

## 2. 规范化与对齐 Starship 提示符 (已完成 ✅)
**成果**：重写了 Starship 提示符。通过精准的 `$before_root_path`, `$repo_root` 等变量格式化，实现了深层 Monorepo 环境下的“外部截断灰化、内部全展高亮”的逻辑，同时所有的颜色都已经严丝合缝地映射到了 `sayoriqwq-obsidian` 的 Token 体系上。

## 3. 全局规范化与终端对齐 (已完成 ✅)
**成果**：更新了 Fish 的语义映射文件 `.config/fish/conf.d/zz-theme-tokens.fish`。将自动补全菜单背景对齐到 `bg.surface` (`#1E1E1E`)，进度条颜色对齐到 `intent.warning` (`#D4A373`)，搜索匹配对齐到 `bg.highlight` (`#252525`)。更新了 `docs/theme-tokens.md` 以反映这些变更。

## 4. 全局体验审查 (Audit) (已完成 ✅)
**成果**：运行了 `audit` 技能，生成了详细的体验审查报告 `docs/audit-report.md`。系统的核心设计质量极高，但在清理代码和次要终端的对齐上发现了改进点。

---

## 5. 审查后优化 (Post-Audit Fixes) (已完成 ✅)
**成果**：
1. **Distill Starship**：清理了 `starship.toml` 中冗长的调试与说明注释，完全符合极简禅意的美学和代码整洁度。
2. **Normalize WezTerm**：将 `dot_wezterm.lua` 升级为了 chezmoi 模板文件 `dot_wezterm.lua.tmpl`。现在它能在应用配置时，动态且实时地解析 `sayoriqwq-obsidian.yml` 中的颜色值。从而彻底消灭了散落的硬编码，实现了真正的**单一真相来源 (SSOT)**。
