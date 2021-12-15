-- Импортируем packer.nvim
return require('packer').startup({function()

	-- Packer будет обновлять сам себя
	use 'wbthomason/packer.nvim'

	-- Универсальное меню для поиска
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{ 'nvim-lua/plenary.nvim' }}
	}

	-- Интеграция Git
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require('gitsigns').setup()
		end
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

		-- Плагин для удобного просмотра и для установки LSP
		requires = {{ 'glepnir/lspsaga.nvim' }}
	}

	-- Плагин для автодополнения
	use {
		'ms-jpq/coq_nvim',
		branch = 'coq',
		config = require('config/coq')
	}

	use {'ms-jpq/coq.artifacts', branch = 'artifacts'}

	-- Плагин для установки LS
	use {
		'williamboman/nvim-lsp-installer',

		-- Конфигурация для того, чтобы устанавливать сервера
		config = {{ require('config/nvim-lsp-installer') }}
	}

	-- Плагин для сниппетов
	use {
		'L3MON4D3/LuaSnip',
		config = {{ require('config/luasnip') }}
	}

	-- Статус-бар
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = {{ require('config/lualine') }}
	}
end})

