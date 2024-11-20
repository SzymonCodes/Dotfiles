local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.color_scheme = "rose-pine-moon"

config.font = wezterm.font("Hack Nerd Font")
config.font_size = 15

config.window_background_opacity = 0.8
config.macos_window_background_blur = 50
return config
