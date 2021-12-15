-- Импортируем packer.nvim
return require('packer').startup({function()

	-- Packer будет обновлять сам себя
	use 'wbthomason/packer.nvim'

	-- Универсальное меню для поиска
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{ 'nvim-lua/plenary.nvim' }}
	}

	-- Плавный скролл
	use {
		'karb94/neoscroll.nvim',
		config = {{ require('config/neoscroll') }}
	}

	-- Подсветка синтаксиса
	use {
		'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate',
	config = {{ require('config/treesitter') }}
}

	-- Цветовая схема
	use 'sainnhe/gruvbox-material'

	-- Автодополнение
	use {
		'windwp/nvim-autopairs',
		config = {{ require('config/autopairs') }}
	}

	-- Иконки для меню автодополнения
	use { 
		'onsails/lspkind-nvim',
		config = {{ require('config/lspkind') }}
	}

	-- LSP
	use {
		'neovim/nvim-lspconfig',
		config = {{ require('config/lspconfig') }},

		-- Плагин для удобного просмотра и для установки LSP
		requires = {{ 'glepnir/lspsaga.nvim' }}
	}

	use {
		'williamboman/nvim-lsp-installer',

		-- Конфигурация для того, чтобы устанавливать сервера
		config = {{ require('config/nvim-lsp-installer') }}
	}


	-- Плагин для автодополнения
	use {
		'hrsh7th/nvim-cmp',
		requires = {{ "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path" }},
		config = {{ require('config/complete') }}
	}

	-- Статус-бар
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = {{ require('config/lualine') }}
	}
end})

