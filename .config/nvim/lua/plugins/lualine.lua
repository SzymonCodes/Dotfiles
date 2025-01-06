return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local rosepine_theme_custom = require("lualine.themes.rose-pine")
    rosepine_theme_custom.normal.c.bg = "none"
    rosepine_theme_custom.replace.c.bg = "none"
    rosepine_theme_custom.insert.c.bg = "none"
    rosepine_theme_custom.command.c.bg = "none"
    rosepine_theme_custom.visual.c.bg = "none"
    require("lualine").setup({
      options = { theme = rosepine_theme_custom },
    })
  end,
}
