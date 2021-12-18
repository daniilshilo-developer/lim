-- Плагины
require('plugins')

-- Горячие клавиши
require('keybindings')

-- Мои твики
require('tweaks')

-- Конфигурация цветовой схемы
vim.opt.syntax = 'enable'
vim.opt.background = 'dark'
vim.cmd('colorscheme gruvbox-material')

-- Кодировка
vim.opt.encoding = 'utf-8'

-- Конфигурация табов
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = false
vim.opt.copyindent = true

-- Подчёркиваем линию, на которой находится курсор
vim.opt.cursorline = true

-- Делаем так, чтобы поведение Backspace было ожидаемым
vim.opt.backspace = 'indent,eol,start'

-- Переключение между буфферами без сохранения
vim.o.hidden = true

-- Вложенность
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevel = 99

-- Высота статуса
vim.opt.cmdheight = 1

-- Фикс для скролла
vim.opt.scrolloff = 5

-- Поиск
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.cursorline = true

-- Перерисовка терминала
vim.opt.ttyfast = true
vim.opt.lazyredraw = true

-- Правильное разделение окон
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Не показываем пробельные знаки
vim.opt.list = false
vim.opt.listchars = [[tab:¦\ ,space:·,precedes:«,extends:»]]

-- Избавляемся от бэкапов
vim.opt.backup = false
vim.opt.swapfile = false

-- Используется системный буфер обмена
vim.opt.clipboard = 'unnamedplus'

-- Не добавляем новую линию в конце
vim.opt.fixendofline = false

-- Говорим Neovim, чтобы он нам помогал завершать фразы (автодополнение)
vim.opt.completeopt = { 'menuone', 'noinsert' }


