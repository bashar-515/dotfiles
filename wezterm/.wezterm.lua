local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("AnonymicePro Nerd Font Mono")
config.font_size = 15

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.color_scheme = "Dracula (Official)"


return config
