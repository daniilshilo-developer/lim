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
map('n', '<leader>v', '<cmd>:CHADopen<cr>', {})

-- Табы
map('n', '<leader>tt', '<cmd>tabnew<cr>', {})
map('n', '<leader>tw', '<cmd>tabclose<cr>', {})

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
		nnoremap <silent>    <A-,> :BufferPrevious<CR>
		nnoremap <silent>    <A-.> :BufferNext<CR>
		]]
		-- Re-order to previous/next
		vim.cmd[[
		nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
		nnoremap <silent>    <A->> :BufferMoveNext<CR>
		]]
		-- Goto buffer in position...
		vim.cmd[[
		nnoremap <silent>    <A-1> :BufferGoto 1<CR>
		nnoremap <silent>    <A-2> :BufferGoto 2<CR>
		nnoremap <silent>    <A-3> :BufferGoto 3<CR>
		nnoremap <silent>    <A-4> :BufferGoto 4<CR>
		nnoremap <silent>    <A-5> :BufferGoto 5<CR>
		nnoremap <silent>    <A-6> :BufferGoto 6<CR>
		nnoremap <silent>    <A-7> :BufferGoto 7<CR>
		nnoremap <silent>    <A-8> :BufferGoto 8<CR>
		nnoremap <silent>    <A-9> :BufferLast<CR>
		]]
		-- Close buffer
		vim.cmd[[nnoremap <silent>    <A-c> :BufferClose<CR>
		]]
		-- Magic buffer-picking mode
		vim.cmd[[nnoremap <silent> <A-s>    :BufferPick<CR>
		]]
	-- }}}

	-- Vista
	map('n', '<leader>[', '<cmd>Vista nvim_lsp<cr>', {})
