-- Настройки для Coq
-- Coq не имеет встроенной поддержки Lua, поэтому будем редактировать его настройки через глобальную переменную
vim.g.coq_settings = {
	
	-- Автозапуск Coq
	auto_start = true,

	-- Исходники для автозавершения
	clients = {

		tabnine = {
			enabled = false
		},

		third_party = {
			enabled = false,
		},

		tmux = {
			enabled = false,
		},

		buffers = {
			enabled = true,
			short_name = 'B'
		},

		tree_sitter = {
			enabled = false
		},

		paths = {
			enabled = true,
			short_name = 'P'
		},

		snippets = {
			enabled = true,
			short_name = 'S'
		},

		tags = {
			enabled = false,
		},

		lsp = {
			enabled = true,
			short_name = 'L',
			weight_adjust = 1.2
		},
	},
	-- Параметры комбинаций клавиш
	keymap = {

		-- Выбрать первый элемент по умолчанию
		pre_select = false

	},

	-- Параметры для поиска
	match = {

		-- Максимальное количество результатов
		max_results = 10,

		-- Сколько строк (вверху и внизу) использовать для автодополнения
		proximate_lines = 8,

	},

	-- Настройки времени для Coq
	limits = {

		-- Таймаут на автокомплит при введении символов
		completion_auto_timeout = 0.5,

	},

	-- Параметры отображения
	display = {

		-- Меню автодополнениея
	--	pum = {
			-- Обёртка для исходников исходников
			--source_context = {{''}, {''}},

			-- Обёртка для типов символов
			--kind_context = {{''}, {''}},
	--},

		-- Иконки
		icons = {

		--[[
		Параметры отображения иконок
			none  : Нет
			short : Только иконки
			log   : Иконки и название символа
		--]]
			mode = 'short',

			-- Отступ после иконки (пробельных символов)
			spacing = 2,

			-- Сами иконки
			mappings = {
				Boolean = "",
				Character = "",
				Class = "",
				Color = "",
				Constant = "",
				Constructor = "",
				Enum = "",
				EnumMember = "",
				Event = "ﳅ",
				Field = "",
				File = "",
				Folder = "",
				Function = "ﬦ",
				Interface = "",
				Keyword = "",
				Method = "",
				Module = "",
				Number = "",
				Operator = "Ψ",
				Parameter = "",
				Property = "",
				Reference = "",
				Snippet = "",
				String = "",
				Struct = "ﯟ",
				Text = "",
				TypeParameter = "",
				Unit = "",
				Value = "",
				Variable = "﵂",
			}
		}
	}
}
