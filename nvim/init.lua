-- Regular settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.wrap = true
vim.o.breakindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = false
vim.o.winborder = 'rounded'
vim.o.clipboard = 'unnamedplus'
vim.o.compatible = false
require("vim._core.ui2").enable({})

-- Regular keybinds
vim.g.mapleader = vim.keycode('<Space>')
 -- Leader+w to save
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')

-- List of pkgs
vim.pack.add{
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
	{ src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
	{ src = 'https://github.com/AlexvZyl/nordic.nvim' },
	{ src = 'https://github.com/akinsho/bufferline.nvim' },
	{ src = 'https://github.com/christoomey/vim-tmux-navigator' },
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons' },
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },
	{ src = 'https://github.com/rachartier/tiny-inline-diagnostic.nvim' },
}

-- Theme settigs
require('nordic').load()
vim.opt.termguicolors = true

-- Lua line
vim.o.showmode = false
require('lualine').setup{}

-- Bufferline
require("bufferline").setup{}
vim.keymap.set('n', 'gt', '<cmd>BufferLinePick<cr>')
vim.keymap.set('n', '<leader>bq', '<cmd>bdelete<cr>')

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)

-- Tiny-inline-diagnostic
require("tiny-inline-diagnostic").setup({
	options = {
		add_messages = {
			display_count = true,
		},
		multilines = {
			enabled = true,
		},
	},
})

-- Lsp settings
require('mason').setup()
require('mason-lspconfig').setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"clangd",
	},
})
-- To not get warning, using vimdot
vim.lsp.config('lua_ls', {
settings = {
Lua = {
	runtime = {
		version = 'LuaJIT',
	},
	diagnostics = {
		globals = {
			'vim',
			'require'
		},
	},
	workspace = {
		library = vim.api.nvim_get_runtime_file("", true),
	},
	telemetry = {
		enable = false,
	},
},
},
})

