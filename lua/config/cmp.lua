-- Инициализируем локальную переменную с модулем cmp
local cmp = require('cmp')

-- Напишем конфигурацию
cmp.setup({

	-- Сниппеты {{{
	-- Сниппеты
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
-- vim:ts=2:foldmethod=marker:foldlevel=0:sw=0:sts=2:noet:noci
