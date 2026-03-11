local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- basic appearance

config.font = wezterm.font("Maple Mono NF CN")
config.font_size = 19

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.automatically_reload_config = true

-- Keybindings (CMD-based)
-- ban default keys, only apply my needs
config.disable_default_key_bindings = true
config.disable_default_mouse_bindings = false

local SPLIT_PERCENT = 50
local RESIZE_STEP = 3

config.keys = {
    { key = "n",          mods = "CMD",       action = act.SpawnWindow },
    -- no confirm
    { key = "w",          mods = "CMD",       action = act.CloseCurrentPane({ confirm = false }) },
    -- zoom
    { key = "z",          mods = "CMD",       action = act.TogglePaneZoomState },
    -- Reload config
    { key = "r",          mods = "CMD",       action = act.ReloadConfiguration },
    -- Clipboard
    { key = "c",          mods = "CMD",       action = act.CopyTo("Clipboard") },
    { key = "v",          mods = "CMD",       action = act.PasteFrom("Clipboard") },

    -- Quick clear
    { key = "Backspace",  mods = "CMD",       action = act.SendString("clear\n") },
    { key = "Backspace",  mods = "CMD|SHIFT", action = act.ClearScrollback("ScrollbackAndViewport") },

    -- font size
    { key = "+",          mods = "CMD",       action = act.IncreaseFontSize },
    { key = "-",          mods = "CMD",       action = act.DecreaseFontSize },
    { key = "0",          mods = "CMD",       action = act.ResetFontSize },

    -- Search in scrollback
    { key = "f",          mods = "CMD",       action = act.Search({ CaseSensitiveString = "" }) },

    -- Pane focus movement
    { key = "Enter",      mods = "CMD",       action = act.SplitPane { direction = "Down", size = { Percent = 40 } } },
    -- 切换焦点：⌘ + 方向键
    { key = "LeftArrow",  mods = "CMD",       action = act.ActivatePaneDirection("Left") },
    { key = "DownArrow",  mods = "CMD",       action = act.ActivatePaneDirection("Down") },
    { key = "RightArrow", mods = "CMD",       action = act.ActivatePaneDirection("Right") },
    { key = "UpArrow",    mods = "CMD",       action = act.ActivatePaneDirection("Up") },

    -- 分割：⌘⇧ + 方向键
    { key = "LeftArrow",  mods = "CMD|SHIFT", action = act.SplitPane { direction = "Left", size = { Percent = SPLIT_PERCENT } } },
    { key = "DownArrow",  mods = "CMD|SHIFT", action = act.SplitPane { direction = "Down", size = { Percent = SPLIT_PERCENT } } },
    { key = "RightArrow", mods = "CMD|SHIFT", action = act.SplitPane { direction = "Right", size = { Percent = SPLIT_PERCENT } } },
    { key = "UpArrow",    mods = "CMD|SHIFT", action = act.SplitPane { direction = "Up", size = { Percent = SPLIT_PERCENT } } },

    -- Resize：⌘⌃ + 方向键
    { key = "LeftArrow",  mods = "CMD|CTRL",  action = act.AdjustPaneSize { "Left", RESIZE_STEP } },
    { key = "DownArrow",  mods = "CMD|CTRL",  action = act.AdjustPaneSize { "Down", RESIZE_STEP } },
    { key = "RightArrow", mods = "CMD|CTRL",  action = act.AdjustPaneSize { "Right", RESIZE_STEP } },
    { key = "UpArrow",    mods = "CMD|CTRL",  action = act.AdjustPaneSize { "Up", RESIZE_STEP } },
}

-- WezTerm Theme: Obsidian「custom」
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20

config.colors = {
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
}

return config
