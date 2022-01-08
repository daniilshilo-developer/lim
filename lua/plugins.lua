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
			require'nvim-tree'.setup{
				view = {
					width = 50,
					height = 30,
					hide_root_folder = false,
					side = 'right',
					auto_resize = true,
					mappings = {
						custom_only = false,
						list = {}
					},
					number = false,
					relativenumber = false,
					signcolumn = "yes"
				},
			}
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
		run = ':TSUpdate',
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
			require('kommentary.config').configure_language("typescript", {
				single_line_comment_string = "//",
				multi_line_comment_strings = {"/*", "*/"}
			})
		end
	}

-- }}}

-- LSP {{{

	-- Конфигурация для LSP
	use {
		'neovim/nvim-lspconfig',
	}

	-- Сниппеты
	use {
		'hrsh7th/cmp-vsnip',
		requires = {{'hrsh7th/vim-vsnip'}}
	}

	-- Иконки
	use {
		'onsails/lspkind-nvim',
		config = function()

			-- Поддержка иконок в nvim-cmp
			require('lspkind').init({

				-- Убираем текст рядом с иконками
				with_text = false,

				-- Карта для иконок
				symbol_map = {
					Text = "",
					Method = "",
					Function = "",
					Constructor = "",
					Field = "ﰠ",
					Variable = "",
					Class = "ﴯ",
					Interface = "",
					Module = "",
					Property = "ﰠ",
					Unit = "塞",
					Value = "",
					Enum = "",
					Keyword = "",
					Snippet = "",
					Color = "",
					File = "",
					Reference = "",
					Folder = "",
					EnumMember = "",
					Constant = "",
					Struct = "פּ",
					Event = "",
					Operator = "",
					TypeParameter = ""
				},
			})
		end,
	}

	-- Плагин для автодополнения
	use {
		'hrsh7th/nvim-cmp',
		requires = {{
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path'
		}},
		config = function()
			-- Инициализируем локальную переменную с модулем cmp
			local cmp = require('cmp')

			-- Инициализируем локальную переменную для модуля с иконками
			local lspkind = require('lspkind')

			-- Напишем конфигурацию
			cmp.setup({

				-- Иконки {{{
				formatting = {
					format = lspkind.cmp_format({
						with_text = false, -- Не показываем текст
						maxwidth = 50, -- Не показываем больше, чем 50 символов в попапе
					}),
				},

				-- }}}

				-- Сниппеты {{{
				snippet = {

					-- С помощью какого механизма сниппетов будет автодополняться код
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- VSnip
						-- require('luasnip').lsp_expand(args.body) -- LuaSnip
						-- require('snippy').expand_snippet(args.body) -- Snippy
						-- vim.fn["UltiSnips#Anon"](args.body) -- Ultisnips
					end,
				},
				-- }}}

				-- Хоткеи {{{
				-- Клавиши, которые будут взаимодействовать в nvim-cmp
				mapping = {

					-- Вызов меню автодополнения
					['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
					['<CR>'] = cmp.config.disable, -- Я не люблю, когда вещи автодополняются на <Enter>
					['<C-y>'] = cmp.mapping.confirm({ select = true }), -- А вот на <C-y> вполне ок

					-- Используем <C-e> для того чтобы прервать автодополнение
					['<C-e>'] = cmp.mapping({
						i = cmp.mapping.abort(), -- Прерываем автодополнение
						c = cmp.mapping.close(), -- Закрываем автодополнение
					}),
				},
				-- }}}

				-- Сорняки для автокомплита {{{
				-- Исходники, из которых будут идти варианты для автодополнения
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' }, -- LSP
					{ name = 'vsnip' }, -- VSnip
					-- { name = 'luasnip' }, -- LuaSnip
					-- { name = 'ultisnips' }, -- Ultisnips
					-- { name = 'snippy' }, -- Snippy

					{ name = 'cmp-nvim-lua' }, -- Автодополнение Neovim Lua
				}, {
					{ name = 'buffer' },
				}),
				-- }}}

			})
		end
	}

	-- Плагин для установки LS
	use {
		'williamboman/nvim-lsp-installer',

		-- Конфигурация для того, чтобы устанавливать сервера
		config = function()
			local lsp_installer = require("nvim-lsp-installer")

			-- Обработчик при включении сервера
			lsp_installer.on_server_ready(function(server)
				local opts = {}

				-- Подключаем конфигурацию к включившемуся серверу
				server:setup(opts)
			end)
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
