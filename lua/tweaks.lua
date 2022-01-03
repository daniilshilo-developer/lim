-- Прозрачный фон
vim.cmd[[
"au ColorScheme * hi Normal ctermbg=none guibg=none
"au NonText * hi Normal ctermbg=none guibg=none
"au ColorScheme * hi! Normal ctermbg=NONE
"au vimenter * hi Normal ctermbg=none
"au vimenter * hi EndOfBuffer ctermbg=none
]]

-- Убираем комментарии на новой строке
vim.cmd[[au BufEnter * set fo-=cro]]

-- Делаем комментарии курсивом
vim.cmd[[highlight Comment cterm=italic]]

-- Автосохранение для markdown
vim.cmd[[autocmd TextChanged,TextChangedI *.md silent write]]

-- Убираем статус бар
vim.cmd[[
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>
]]
