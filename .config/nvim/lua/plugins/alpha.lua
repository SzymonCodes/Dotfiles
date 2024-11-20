return {
	"goolord/alpha-nvim",
	event = "VimEnter", -- Lazy load on VimEnter (when Neovim starts)
	config = function()
		-- Alpha configuration for the dashboard
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header

		local logo = [[

                                              
       ████ ██████           █████      ██
      ███████████             █████ 
      █████████ ███████████████████ ███   ███████████
     █████████  ███    █████████████ █████ ██████████████
    █████████ ██████████ █████████ █████ █████ ████ █████
  ███████████ ███    ███ █████████ █████ █████ ████ █████
 ██████  █████████████████████ ████ █████ █████ ████ ██████

    ]]

		-- Split the logo by line breaks
		dashboard.section.header.val = vim.split(logo, "\n")

		-- Calculate how many lines to add above the header
		local total_lines = vim.o.lines
		local header_lines = #dashboard.section.header.val
		local lines_above = math.floor((total_lines - header_lines) / 2)

		-- Move the logo higher by x lines
		local adjustment = 5
		lines_above = lines_above - adjustment

		-- Add empty lines to center the logo vertically
		local empty_lines = {}
		for _ = 1, lines_above do
			table.insert(empty_lines, "")
		end

		-- Combine empty lines and logo lines
		dashboard.section.header.val = vim.list_extend(empty_lines, dashboard.section.header.val)

		-- Change the color of the header
		dashboard.section.header.opts.hl = "Error"

		-- Set menu (optional, you can customize this part)
		dashboard.section.buttons.val = {
			dashboard.button(
				"f",
				"  Find file",
				":cd $HOME | silent Telescope find_files hidden=true no_ignore=true <CR>"
			),
			dashboard.button("g", "  Find text", ":Telescope live_grep <CR>"),
			dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("b", "󱗼  File Explorer", ":Telescope file_browser<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
