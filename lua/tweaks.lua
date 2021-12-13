-- Прозрачный фон
vim.cmd[[
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
]]

-- Убираем комментарии на новой строке
vim.cmd[[au BufEnter * set fo-=cro]]

-- Делаем комментарии курсивом
vim.cmd[[highlight Comment cterm=italic]]

-- Автосохранение для markdown
vim.cmd[[autocmd TextChanged,TextChangedI *.md silent write]]
