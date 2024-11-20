return {
	"jpalardy/vim-slime",
	init = function()
		-- these two should be set before the plugin loads
		vim.g.slime_target = "tmux"
		vim.g.slime_bracketed_paste = 1
		vim.g.slime_python_ipython = 0
		vim.g.slime_no_mappings = 1
		vim.g.slime_default_config = { socket_name = "default", target_pane = "Terminal:" }
		-- vim.g.slime_default_config = { socket_name = "default", pane_id = "3" }
		vim.g.slime_dont_ask_default = 1
	end,
	config = function()
		vim.g.slime_input_pid = false
		vim.g.slime_suggest_default = true
		vim.g.slime_menu_config = false
		vim.g.slime_neovim_ignore_unlisted = false
		-- options not set here are g:slime_neovim_menu_order, g:slime_neovim_menu_delimiter, and g:slime_get_jobid
		-- see the documentation above to learn about those options

		-- called MotionSend but works with textobjects as well
		vim.keymap.set("n", "gz", "<Plug>SlimeMotionSend", { remap = true, silent = false })
		vim.keymap.set("n", "gzz", "<Plug>SlimeLineSend", { remap = true, silent = false })
		vim.keymap.set("x", "gz", "<Plug>SlimeRegionSend", { remap = true, silent = false })
		vim.keymap.set("n", "gzc", "<Plug>SlimeConfig", { remap = true, silent = false })
	end,
}
