-- Импортируем packer.nvim
return require('packer').startup(function()

  -- Packer будет обновлять сам себя
  use 'wbthomason/packer.nvim'

  -- Подсветка синтаксиса
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Цветовая схема
  use 'EdenEast/nightfox.nvim'

  -- Статус-бар
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'anott03/nvim-lspinstall'

	-- LSP
	local lspconfig = require'lspconfig'
	local completion = require'completion'
	local function custom_on_attach(client)
		print('Attaching to ' .. client.name)
		completion.on_attach(client)
	end

	local default_config = {
		on_attach = custom_on_attach,
	}

	-- LSP Handlers
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		virtual_text = false,
		signs = true,
		update_in_insert = true,
	}
	)

	-- setup language servers here
	lspconfig.tsserver.setup(default_config)
end)

