---@diagnostic disable: undefined-field
return {
	"rasulomaroff/reactive.nvim",
	config = function()
		require("reactive").add_preset({
			name = "rose-pine",
			init = function()
				vim.opt.guicursor:append("a:ReactiveCursor")
			end,
			modes = {
				n = {
					-- normal mode configuration
					frozen = true,
					hl = {
						ReactiveCursor = { bg = "#ea9a97" },
						CursorLine = { bg = "#56526e" },
					},
				},
				i = {
					-- insert mode configuration
					hl = {
						ReactiveCursor = { bg = "#9ccfd8" },
						CursorLine = { bg = "#56526e" },
					},
				},
				[{ "v", "V", "\x16" }] = {
					-- visual mode configuration
					hl = {
						ReactiveCursor = { bg = "#c4a7e7" },
						Visual = { bg = "#77659C" },
					},
				},
				[{ "no", "nov", "noV", "no\x16" }] = {
					operators = {
						d = {
							-- delete mode config
							hl = {
								ReactiveCursor = { bg = "#eb6f92" },
								CursorLine = { bg = "#8A4A76" },
							},
						},
						c = {
							-- change mode config
							hl = {
								ReactiveCursor = { bg = "#3e8fb0" },
								CursorLine = { bg = "#56526e" },
							},
						},
						y = {
							-- yank mode config
							hl = {
								ReactiveCursor = { bg = "#f6c177" },
								CursorLine = { bg = "#56526e" },
							},
						},
					},
				},
			},
		})
		require("reactive").setup({
			load = "rose-pine",
		})
	end,
}
