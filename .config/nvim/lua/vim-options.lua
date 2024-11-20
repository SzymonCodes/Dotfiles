-- Basic settings
vim.g.mapleader = " "
vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.opt.fillchars = { eob = " " }

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

-- Go back to dashboard
vim.keymap.set("n", "<leader>da", ":Alpha<CR>", {})

-- Center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})

-- Vim and Tmux motions
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})

-- Moving selected code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {})

-- Making commenting better
vim.keymap.set({ "n", "v" }, "<leader>/", ":CommentToggle<CR>", {})

-- Toggling Undotree
vim.keymap.set("n", "<leader>hh", ":UndotreeToggle<CR>", {})
-- Persistent undo history through Undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

-- Run in Quarto
vim.keymap.set("n", "<leader>q", ":QuartoPreview<CR>", {})
