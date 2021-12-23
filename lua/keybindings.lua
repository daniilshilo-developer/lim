-- Алиас для nmap
local map = vim.api.nvim_set_keymap

-- Ставим пробел как лидирующую кнопку для альтернативных клавиш
vim.g.mapleader = ' '

-- Быстрый поиск файлов
map('n', '<leader>p', '<cmd>Telescope find_files<cr>', {})

-- Буферы
map('n', '<leader>q', '<cmd>Telescope buffers<cr>', {})

-- Поиск
map('n', '<leader>f', '<cmd>Telescope live_grep<cr>', {})

-- MRU
map('n', '<leader>r', '<cmd>Telescope oldfiles<cr>', {})

-- Проводник
map('n', '<leader>e', '<cmd>Telescope file_browser<cr>', {})

-- Посмотреть измененные файлы
map('n', '<leader>g', '<cmd>Telescope git_status<cr>', {})

-- Ветки (Git)
map('n', '<leader>b', '<cmd>Telescope git_branches<cr>', {})

-- Определения (LSP)
map('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', {})

-- Определения (LSP)
map('n', 'gr', '<cmd>Telescope lsp_references<cr>', {})

-- Открыть проводник
map('n', '<leader>v', '<cmd>:NvimTreeToggle<cr>', {})

-- Табы
map('n', '<leader>t', '<cmd>tabnew<cr>', {})

-- Очистить поиск
map('n', '<C-l>', '<cmd>nohl<cr>', {noremap = true})

-- LSP {{{

	-- Переименовать объект
	map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', {noremap = true, silent = true})

	-- Документация
	map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {noremap = true})

	-- }}}

	-- Barbar {{{
		-- Move to previous/next
		vim.cmd[[
		nnoremap <silent>    <A-,> :BufferLineCyclePrev<CR>
		nnoremap <silent>    <A-.> :BufferLineCycleNext<CR>
		]]
		-- Re-order to previous/next
		vim.cmd[[
		nnoremap <silent>    <A-<> :BufferLineMovePrev<CR>
		nnoremap <silent>    <A->> :BufferLineMoveNext<CR>
		]]
		-- Close buffer
		vim.cmd[[
		nnoremap <silent>    <A-c> :bdelete<CR>
		nnoremap <silent>    <A-i> :BufferLineCloseLeft<CR>
		nnoremap <silent>    <A-o> :BufferLineCloseRight<CR>
		]]
		-- Magic buffer-picking mode
		vim.cmd[[
		nnoremap <silent> <A-s>    :BufferPick<CR>
		]]
	-- }}}

	-- Vista
	map('n', '<leader>[', '<cmd>AerialToggle<cr>', {})
