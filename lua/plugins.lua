-- Перекачиваем плагины после сохранения конфигурации Packer'а
vim.cmd[[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Добавляем пакет Packer'а
vim.cmd[[packadd packer.nvim]]

-- Инициализируем Packer
return require('packer').startup(function(use)

-- Packer собственно {{{

	-- Packer будет обновлять сам себя
	use {
		'wbthomason/packer.nvim',
	}

-- }}}

-- Файловый менеджер {{{

	-- Файловый менеджер
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		config = function()
			require'nvim-tree'.setup{
				view = {
					width = 50,
					height = 30,
					hide_root_folder = false,
					side = 'right',
					auto_resize = true,
					mappings = {
						custom_only = false,
						list = {}
					},
					number = false,
					relativenumber = false,
					signcolumn = "yes"
				},
			}
		end,
	}

-- }}}

-- Поиск {{{

	-- Универсальное меню для поиска
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

-- }}}

-- Темы и синтаксис {{{

	-- Подсветка синтаксиса
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('config/treesitter')
		end
	}

	-- Цветовая схема
	use 'sainnhe/gruvbox-material'
	use 'tanvirtin/monokai.nvim'
	use 'navarasu/onedark.nvim'

-- }}}

-- Комментарии {{{

	-- Комментарии
	use {
		'b3nj5m1n/kommentary',
		config = function()
			require('kommentary.config').configure_language("typescript", {
				single_line_comment_string = "//",
				multi_line_comment_strings = {"/*", "*/"}
			})
		end
	}

-- }}}

-- LSP {{{

use {
	'neoclide/coc.nvim',
	branch = 'release',
	config = function()
		vim.cmd[[

		function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
		endfunction

		" Use tab for trigger completion with characters ahead and navigate.
		" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
		" other plugin before putting this into your config.
		inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
		inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

		" Use <c-space> to trigger completion.
		if has('nvim')
			inoremap <silent><expr> <c-space> coc#refresh()
		else
			inoremap <silent><expr> <c-@> coc#refresh()
		endif

		" Make <CR> auto-select the first completion item and notify coc.nvim to
		" format on enter, <cr> could be remapped by other vim plugin
		inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
		\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

		" Use `[g` and `]g` to navigate diagnostics
		" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
		nmap <silent> [g <Plug>(coc-diagnostic-prev)
		nmap <silent> ]g <Plug>(coc-diagnostic-next)

		" GoTo code navigation.
		nmap <silent> gd <Plug>(coc-definition)
		nmap <silent> gy <Plug>(coc-type-definition)
		nmap <silent> gi <Plug>(coc-implementation)
		nmap <silent> gr <Plug>(coc-references)

		" Use K to show documentation in preview window.
		nnoremap <silent> K :call <SID>show_documentation()<CR>

			function! s:show_documentation()
			
			if (index(['vim','help'], &filetype) >= 0)
				execute 'h '.expand('<cword>')
			elseif (coc#rpc#ready())
				call CocActionAsync('doHover')
			else
				execute '!' . &keywordprg . " " . expand('<cword>')

			endif

			endfunction

			" Highlight the symbol and its references when holding the cursor.
			autocmd CursorHold * silent call CocActionAsync('highlight')

			" Symbol renaming.
			nmap <leader>rn <Plug>(coc-rename)

			" Formatting selected code.
			xmap <leader>f  <Plug>(coc-format-selected)
			nmap <leader>f  <Plug>(coc-format-selected)

			augroup mygroup
			autocmd!
			" Setup formatexpr specified filetype(s).
			autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
			" Update signature help on jump placeholder.
			autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
			augroup end

			" Applying codeAction to the selected region.
			" Example: `<leader>aap` for current paragraph
			xmap <leader>a  <Plug>(coc-codeaction-selected)
			nmap <leader>a  <Plug>(coc-codeaction-selected)

			" Remap keys for applying codeAction to the current buffer.
			nmap <leader>ac  <Plug>(coc-codeaction)
			" Apply AutoFix to problem on the current line.
			nmap <leader>qf  <Plug>(coc-fix-current)

			" Run the Code Lens action on the current line.
			nmap <leader>cl  <Plug>(coc-codelens-action)

			" Map function and class text objects
			" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
			xmap if <Plug>(coc-funcobj-i)
			omap if <Plug>(coc-funcobj-i)
			xmap af <Plug>(coc-funcobj-a)
			omap af <Plug>(coc-funcobj-a)
			xmap ic <Plug>(coc-classobj-i)
			omap ic <Plug>(coc-classobj-i)
			xmap ac <Plug>(coc-classobj-a)
			omap ac <Plug>(coc-classobj-a)

			" Add `:Format` command to format current buffer.
			command! -nargs=0 Format :call CocAction('format')

			" Add `:Fold` command to fold current buffer.
			command! -nargs=? Fold :call     CocAction('fold', <f-args>)

			" Add `:OR` command for organize imports of the current buffer.
			command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

			" Search workspace symbols.
			nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

			" Show all diagnostics.
			nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
			]]
		end
	}

-- }}}

-- Табы и статус {{{

	-- Статус-бар
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function()
			require('config/lualine') 
		end
	}

	-- Табы
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('bufferline').setup()
		end
	}

-- }}}

-- Git {{{

	use {
		'tanvirtin/vgit.nvim',
		event = 'BufWinEnter',
		requires = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			require('vgit').setup()
		end,
	}

-- }}}

-- Прочее {{{

	-- Плавный скролл
	use {
		'karb94/neoscroll.nvim',
		config = function()
			require('config/neoscroll')
		end
	}

	-- Автодополнение скобок
	use {
		'windwp/nvim-autopairs',
		config = function()
			require('config/autopairs')
		end
	}

-- }}}
end)

-- vim:ts=2:foldmethod=marker:foldlevel=0:sw=0:sts=2:noet:noci
