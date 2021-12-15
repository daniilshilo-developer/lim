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

-- Табы
map('n', '<leader>tt', '<cmd>tabnew<cr>', {})
map('n', '<leader>tw', '<cmd>tabclose<cr>', {})

-- Очистить поиск
map('n', '<C-l>', '<cmd>nohl<cr>', {noremap = true})

-- Lightspeed
map('n', '<leader>j', '<plug>Lightspeed_s', {noremap = true})
map('n', '<leader>k', '<plug>Lightspeed_S', {noremap = true})

-- LSP {{{
-- Перейти к определению
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })

-- Перейти к референсам
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })

-- Автодополнение
vim.cmd[[
inoremap <expr> <silent> <Tab>   pumvisible() ? "\<C-Space>" : "\<Tab>"
inoremap <expr> <silent> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
]]
-- }}}

-- LSP Saga (плагин для красивого отображения LSP) {{{
-- Показать определение
map('n', 'gD', '<cmd>Lspsaga preview_definition<cr>', { noremap = true, silent = true })

-- Переименовать объект
map('n', '<F2>', '<cmd>Lspsaga rename<cr>', {noremap = true, silent = true})
-- }}}
