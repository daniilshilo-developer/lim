-- Алиас для nmap
local map = vim.api.nvim_set_keymap

-- Ставим пробел как лидирующую кнопку для альтернативных клавиш
vim.g.mapleader = ' '

-- Default {{{

-- Табы
map('n', '<leader>t', '<cmd>tabnew<cr>', {})

-- Очистить поиск
map('n', '<C-l>', '<cmd>nohl<cr>', {noremap = true})

-- }}}

-- Telescope {{{

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

-- }}}

-- LSP {{{

-- Определения (LSP)
map('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', {})

-- Определения (LSP)
map('n', 'gr', '<cmd>Telescope lsp_references<cr>', {})

-- Переименовать объект
map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', {noremap = true, silent = true})

-- Документация
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {noremap = true})

-- }}}

-- NvimTree {{{

-- Открыть проводник
map('n', '<leader>v', '<cmd>:NvimTreeToggle<cr>', {})

-- }}}

-- Bufferline {{{

-- Перейти к предыдущему/следующему буферу
vim.cmd[[
nnoremap <silent>    <A-,> :BufferLineCyclePrev<CR>
nnoremap <silent>    <A-.> :BufferLineCycleNext<CR>
]]

-- Перетащить буфер влево/вправо
vim.cmd[[
nnoremap <silent>    <A-<> :BufferLineMovePrev<CR>
nnoremap <silent>    <A->> :BufferLineMoveNext<CR>
]]

-- Закрыть буфер
vim.cmd[[
nnoremap <silent>    <A-c> :bdelete<CR>
]]

-- Выбрать определенный буфер
vim.cmd[[
nnoremap <silent> <A-s>    :BufferPick<CR>
]]

-- }}}

-- Aerial {{{

map('n', '<leader>[', '<cmd>AerialToggle<cr>', {})

-- }}}
