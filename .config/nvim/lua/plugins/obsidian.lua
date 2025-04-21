return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Personal",
				path = "~/Documents/Notes/Personal",
			},
		},
		ui = {
			enable = false,
		},
		templates = {
			folder = "Templates",
			date_format = "%d-%m-%Y",
			time_format = "%H-%M",
		},
	},
}
