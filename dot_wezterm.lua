local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- basic appearance

config.font = wezterm.font("Maple Mono NF CN")
config.font_size = 20
config.default_prog = { "/bin/zsh", "-l" }

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.automatically_reload_config = true

config.keys = {
    { key = "d",          mods = "SUPER",       action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { key = "d",          mods = "SHIFT|SUPER", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
    { key = "Enter",      mods = "SHIFT|SUPER", action = act.TogglePaneZoomState },
    { key = "LeftArrow",  mods = "ALT|SUPER",   action = act.ActivatePaneDirection "Left" },
    { key = "DownArrow",  mods = "ALT|SUPER",   action = act.ActivatePaneDirection "Down" },
    { key = "RightArrow", mods = "ALT|SUPER",   action = act.ActivatePaneDirection "Right" },
    { key = "UpArrow",    mods = "ALT|SUPER",   action = act.ActivatePaneDirection "Up" },
    { key = "LeftArrow",  mods = "CTRL|SUPER",  action = act.AdjustPaneSize { "Left", 10 } },
    { key = "DownArrow",  mods = "CTRL|SUPER",  action = act.AdjustPaneSize { "Down", 10 } },
    { key = "RightArrow", mods = "CTRL|SUPER",  action = act.AdjustPaneSize { "Right", 10 } },
    { key = "UpArrow",    mods = "CTRL|SUPER",  action = act.AdjustPaneSize { "Up", 10 } },
}

-- WezTerm Theme: sayoriqwq-obsidian
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20

config.color_schemes = {
    ["sayoriqwq-obsidian"] = {
        foreground = "#E0E0E0",
        background = "#121212",
        cursor_bg = "#5FAFFF",
        cursor_border = "#5FAFFF",
        cursor_fg = "#121212",
        selection_bg = "#2C3E50",
        selection_fg = "#E0E0E0",

        ansi = {
            "#121212",
            "#CF6679",
            "#81C784",
            "#BDBDBD",
            "#64B5F6",
            "#A291B5",
            "#76C1E1",
            "#D0D0D0"
        },

        brights = {
            "#454545",
            "#FF8A80",
            "#B9F6CA",
            "#FFFFFF",
            "#82B1FF",
            "#C1B1D1",
            "#99D6EA",
            "#FFFFFF"
        },
    },
}
config.color_scheme = "sayoriqwq-obsidian"

return config
