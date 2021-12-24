-- Перекачиваем плагины после сохранения конфигурации Packer'а
vim.cmd[[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Добавляем пакет Packer'а
vim.cmd[[packadd packer.nvim]]

-- Инициализируем Packer
return require('packer').startup(function(use)

-- Packer собственно {{{

	-- Packer будет обновлять сам себя
	use {
		'wbthomason/packer.nvim',
	}

-- }}}

-- Файловый менеджер {{{

	-- Файловый менеджер
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		config = function()
			require'nvim-tree'.setup{}
		end,
	}

-- }}}

-- Поиск {{{

	-- Универсальное меню для поиска
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

-- }}}

-- Темы и синтаксис {{{

	-- Подсветка синтаксиса
	use {
		'nvim-treesitter/nvim-treesitter',
		--run = ':TSUpdate',
		config = function()
			require('config/treesitter')
		end
	}

	-- Цветовая схема
	use 'sainnhe/gruvbox-material'
	use 'tanvirtin/monokai.nvim'
	use 'navarasu/onedark.nvim'

-- }}}

-- Комментарии {{{

	-- Комментарии
	use {
		'b3nj5m1n/kommentary',
		config = function()
			require('config/kommentary')
		end
	}

-- }}}

-- LSP {{{

	-- Конфигурация для LSP
	use {
		'neovim/nvim-lspconfig',
	}

	-- Плагин для автодополнения
	use {
		'ms-jpq/coq_nvim',
		branch = 'coq',
		config = function()
			require('config/coq')
		end,

		-- Post-Install hook
		run = function()
			vim.cmd[[COQdeps]]
		end
	}
	use {'ms-jpq/coq.artifacts', branch = 'artifacts'}

	-- Плагин для установки LS
	use {
		'williamboman/nvim-lsp-installer',

		-- Конфигурация для того, чтобы устанавливать сервера
		config = function()
			require('config/nvim-lsp-installer')
		end
	}

	-- Дерево методов
	use {
		'stevearc/aerial.nvim',
		config = function()
			require('config/aerial')
		end
	}

	-- Улучшеная подсветка
	use 'folke/lsp-colors.nvim'

-- }}}

-- Табы и статус {{{

	-- Статус-бар
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function()
			require('config/lualine') 
		end
	}

	-- Табы
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('bufferline').setup()
		end
	}

-- }}}

-- Git {{{

	use {
		'tanvirtin/vgit.nvim',
		event = 'BufWinEnter',
		requires = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			require('vgit').setup()
		end,
	}

-- }}}

-- Прочее {{{

	-- Плавный скролл
	use {
		'karb94/neoscroll.nvim',
		config = function()
			require('config/neoscroll')
		end
	}

	-- Автодополнение скобок
	use {
		'windwp/nvim-autopairs',
		config = function()
			require('config/autopairs')
		end
	}

-- }}}
end)

-- vim:ts=2:foldmethod=marker:foldlevel=0:sw=0:sts=2:noet:noci
