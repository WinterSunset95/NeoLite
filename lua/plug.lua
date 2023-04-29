-- Initialize vim-plug
vim.cmd('call plug#begin()')

-- Plugins
-- Example Plugin
vim.cmd([[
	Plug 'junegunn/vim-plug'
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'williamboman/mason.nvim'
	Plug 'williamboman/mason-lspconfig.nvim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'github/copilot.vim'
]])

-- Call plug#end() to close the list of plugins
vim.cmd('call plug#end()')
