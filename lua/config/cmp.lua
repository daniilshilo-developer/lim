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
	-- Сниппеты
	snippet = {

		-- С помощью какого механизма сниппетов будет автодополняться код
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- VSnip
			-- require('luasnip').lsp_expand(args.body) -- LuaSnip
			-- require('snippy').expand_snippet(args.body) -- Snippy
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
		{ name = 'cmp-nvim-lua' }, -- Автодополнение Neovim Lua
		{ name = 'cmp-path' }, -- Автодополнение путей
		{ name = 'cmp-buffer' }, -- Автодополнение из буферов
		-- { name = 'luasnip' }, -- LuaSnip
		-- { name = 'snippy' }, -- Snippy
		-- { name = 'ultisnips' }, -- Ultisnips

	}, {
		{ name = 'buffer' },
	}),
	-- }}}

	experimental = {

		-- Включаем гост
		ghost_text = true
	},
})
-- vim:ts=2:foldmethod=marker:foldlevel=0:sw=0:sts=2:noet:noci
