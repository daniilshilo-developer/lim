-- Алиас для nmap
local map = vim.api.nvim_set_keymap

-- Ставим пробел как лидирующую кнопку для альтернативных клавиш
vim.g.mapleader = '<Space>'

-- Быстрый поиск файлов
map('n', '<leader>p', '<cmd>FZF<cr>', {})

-- Буферы
map('n', '<leader>q', '<cmd>Buffers<cr>', {})

-- Поиск
map('n', '<leader>f', '<cmd>Rg<cr>', {})

-- MRU
map('n', '<leader>r', '<cmd>History<cr>', {})

-- Проводник
map('n', '<space>e', '<cmd>CocCommand explorer<cr>', {})

-- Табы
map('n', '<leader>tt', '<cmd>tabnew<cr>', {})
map('n', '<leader>tw', '<cmd>tabclose<cr>', {})

-- Lightspeed
map('n', '<leader>j', '<Plug>Lightspeed_s', {noremap = true})
map('n', '<leader>k', '<Plug>Lightspeed_S', {noremap = true})
