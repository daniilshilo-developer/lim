-- Прозрачный фон
vim.cmd[[
"au ColorScheme * hi Normal ctermbg=none guibg=none
"au NonText * hi Normal ctermbg=none guibg=none
"au ColorScheme * hi! Normal ctermbg=NONE
au vimenter * hi Normal ctermbg=none
au vimenter * hi EndOfBuffer ctermbg=none
]]

-- Убираем комментарии на новой строке
vim.cmd[[au BufEnter * set fo-=cro]]

-- Делаем комментарии курсивом
vim.cmd[[highlight Comment cterm=italic]]

-- Автосохранение для markdown
vim.cmd[[autocmd TextChanged,TextChangedI *.md silent write]]
