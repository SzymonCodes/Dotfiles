return {
	"andrewferrier/wrapping.nvim",
	config = function()
		require("wrapping").get_current_mode()
		require("wrapping").setup({
			auto_set_mode_filetype_allowlist = {
				"markdown",
			},
			softener = {
				markdown = true,
			},
		})
	end,
}
