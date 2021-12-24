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
map('n', '<A-,>', '<cmd>BufferPrevious<CR>', {silent = true})
map('n', '<A-.>', '<cmd>BufferNext<CR>', {silent = true})

-- Перетащить буфер влево/вправо
map('n', '<A-<>', '<cmd>BufferMovePrevious<CR>', {silent = true})
map('n', '<A->>', '<cmd>BufferMoveNext<CR>', {silent = true})

-- Закрыть буфер
map('n', '<A-c>', '<cmd>BufferClose<CR>', {silent = true})

-- Закрепить
map('n', '<A-p>', '<cmd>BufferPin<CR>', {silent = true})

-- Выбрать определенный буфер
map('n', '<A-s>', '<cmd>BufferPick<CR>', {silent = true})

-- }}}

-- Aerial {{{

map('n', '<leader>[', '<cmd>AerialToggle<cr>', {})

-- }}}

-- Trouble  {{{

-- Тоггл боттомбара с ошибками в коде
map('n', '<C-t>', '<cmd>TroubleToggle<cr><C-w>k', {noremap = true})

-- }}}

-- vim:ts=2:foldmethod=marker:foldlevel=0:sw=0:sts=2:noet:noci
