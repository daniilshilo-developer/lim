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

	-- Плагины
	use {
		'b3nj5m1n/kommentary',
		config = {{ require('config/kommentary') }}
	}

	-- Структура файлов
	use {
		'liuchengxu/vista.vim'
	}

	-- Цветовая схема
	use 'sainnhe/gruvbox-material'

	-- Дашбоард
	use {
		'mhinz/vim-startify',
		setup = function()
			vim.cmd[[
			" Не меняем директорию при переходе
			let g:startify_change_to_dir = 0

			" Меняем директорию на директорию VCS (git)
			let g:startify_change_to_vcs_root = 1
			]]
		end,
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
