-- Файл для настройки Treesitter
-- Данный плагин нужен для подсветки синтаксиса
require('nvim-treesitter.configs').setup {
	ensure_installed = {
		"pug",
		"html",
		"css",
		"scss",
		"javascript",
		"typescript",
		"tsx",
		"svelte",
		"vue",
		"json",
		"jsonc",
		"http",
		"dockerfile",
		"yaml",
		"c",
		"cpp",
		"python",
		"comment",
		"lua",
		"elm",
		"bash",
	},
	sync_install = false,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},

}
