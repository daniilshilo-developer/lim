-- Импортируем packer.nvim
return require('packer').startup({function()

	-- Packer будет обновлять сам себя
	use 'wbthomason/packer.nvim'

	-- Подсветка синтаксиса
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = {{ require('config/treesitter') }}
	}

	-- Файловый менеджер
	use {
		'ms-jpq/chadtree',
		branch = 'chad',
		run = ':CHADdeps',
	}

	-- Универсальное меню для поиска
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}

	-- Плавный скролл
	use {
		'karb94/neoscroll.nvim',
		config = {{ require('config/neoscroll') }}
	}

	-- Структура файлов
	use {
		'liuchengxu/vista.vim'
	}

	-- Цветовая схема
	use {
		'folke/tokyonight.nvim',

		config = function()
			require('tokyonight').setup({
				tokyonight_style = 'storm',
				tokyonight_italic_comments = true,
				tokyonight_italic_keywords = true,
				tokyonight_transparent = true,

				vim.cmd[[colorscheme tokyonight]]
			})
		end
	}

	-- Дашбоард
	use {
		'mhinz/vim-startify',
	}

	-- Автодополнение скобок
	use {
		'windwp/nvim-autopairs',
		config = {{ require('config/autopairs') }}
	}

	-- LSP
	use {
		'neovim/nvim-lspconfig',
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

	-- Статус-бар
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = {{ require('config/lualine') }}
	}

	-- Таббар
	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}
end})
