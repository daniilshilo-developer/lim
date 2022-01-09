-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/dsd/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/dsd/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/dsd/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/dsd/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/dsd/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bufferline.nvim"] = {
    config = { "\27LJ\1\0028\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["coc.nvim"] = {
    config = { "\27LJ\1\2·\30\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0—\30\n\t\tfunction! s:check_back_space() abort\n\t\tlet col = col('.') - 1\n\t\treturn !col || getline('.')[col - 1]  =~# '\\s'\n\t\tendfunction\n\n\t\t\" Use tab for trigger completion with characters ahead and navigate.\n\t\t\" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by\n\t\t\" other plugin before putting this into your config.\n\t\tinoremap <silent><expr> <TAB>\n\t\t\\ pumvisible() ? \"\\<C-n>\" :\n\t\t\\ <SID>check_back_space() ? \"\\<TAB>\" :\n\t\t\\ coc#refresh()\n\t\tinoremap <expr><S-TAB> pumvisible() ? \"\\<C-p>\" : \"\\<C-h>\"\n\n\t\t\" Use <c-space> to trigger completion.\n\t\tif has('nvim')\n\t\t\tinoremap <silent><expr> <c-space> coc#refresh()\n\t\telse\n\t\t\tinoremap <silent><expr> <c-@> coc#refresh()\n\t\tendif\n\n\t\t\" Make <CR> auto-select the first completion item and notify coc.nvim to\n\t\t\" format on enter, <cr> could be remapped by other vim plugin\n\t\tinoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()\n\t\t\\: \"\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>\"\n\n\t\t\" Use `[g` and `]g` to navigate diagnostics\n\t\t\" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.\n\t\tnmap <silent> [g <Plug>(coc-diagnostic-prev)\n\t\tnmap <silent> ]g <Plug>(coc-diagnostic-next)\n\n\t\t\" GoTo code navigation.\n\t\tnmap <silent> gd <Plug>(coc-definition)\n\t\tnmap <silent> gy <Plug>(coc-type-definition)\n\t\tnmap <silent> gi <Plug>(coc-implementation)\n\t\tnmap <silent> gr <Plug>(coc-references)\n\n\t\t\" Use K to show documentation in preview window.\n\t\tnnoremap <silent> K :call <SID>show_documentation()<CR>\n\n\t\t\tfunction! s:show_documentation()\n\t\t\t\n\t\t\tif (index(['vim','help'], &filetype) >= 0)\n\t\t\t\texecute 'h '.expand('<cword>')\n\t\t\telseif (coc#rpc#ready())\n\t\t\t\tcall CocActionAsync('doHover')\n\t\t\telse\n\t\t\t\texecute '!' . &keywordprg . \" \" . expand('<cword>')\n\n\t\t\tendif\n\n\t\t\tendfunction\n\n\t\t\t\" Highlight the symbol and its references when holding the cursor.\n\t\t\tautocmd CursorHold * silent call CocActionAsync('highlight')\n\n\t\t\t\" Symbol renaming.\n\t\t\tnmap <leader>rn <Plug>(coc-rename)\n\n\t\t\t\" Formatting selected code.\n\t\t\txmap <leader>f  <Plug>(coc-format-selected)\n\t\t\tnmap <leader>f  <Plug>(coc-format-selected)\n\n\t\t\taugroup mygroup\n\t\t\tautocmd!\n\t\t\t\" Setup formatexpr specified filetype(s).\n\t\t\tautocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')\n\t\t\t\" Update signature help on jump placeholder.\n\t\t\tautocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')\n\t\t\taugroup end\n\n\t\t\t\" Applying codeAction to the selected region.\n\t\t\t\" Example: `<leader>aap` for current paragraph\n\t\t\txmap <leader>a  <Plug>(coc-codeaction-selected)\n\t\t\tnmap <leader>a  <Plug>(coc-codeaction-selected)\n\n\t\t\t\" Remap keys for applying codeAction to the current buffer.\n\t\t\tnmap <leader>ac  <Plug>(coc-codeaction)\n\t\t\t\" Apply AutoFix to problem on the current line.\n\t\t\tnmap <leader>qf  <Plug>(coc-fix-current)\n\n\t\t\t\" Run the Code Lens action on the current line.\n\t\t\tnmap <leader>cl  <Plug>(coc-codelens-action)\n\n\t\t\t\" Map function and class text objects\n\t\t\t\" NOTE: Requires 'textDocument.documentSymbol' support from the language server.\n\t\t\txmap if <Plug>(coc-funcobj-i)\n\t\t\tomap if <Plug>(coc-funcobj-i)\n\t\t\txmap af <Plug>(coc-funcobj-a)\n\t\t\tomap af <Plug>(coc-funcobj-a)\n\t\t\txmap ic <Plug>(coc-classobj-i)\n\t\t\tomap ic <Plug>(coc-classobj-i)\n\t\t\txmap ac <Plug>(coc-classobj-a)\n\t\t\tomap ac <Plug>(coc-classobj-a)\n\n\t\t\t\" Add `:Format` command to format current buffer.\n\t\t\tcommand! -nargs=0 Format :call CocAction('format')\n\n\t\t\t\" Add `:Fold` command to fold current buffer.\n\t\t\tcommand! -nargs=? Fold :call     CocAction('fold', <f-args>)\n\n\t\t\t\" Add `:OR` command for organize imports of the current buffer.\n\t\t\tcommand! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')\n\n\t\t\t\" Search workspace symbols.\n\t\t\tnnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>\n\n\t\t\t\" Show all diagnostics.\n\t\t\tnnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>\n\t\t\t\bcmd\bvim\0" },
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  kommentary = {
    config = { "\27LJ\1\2­\1\0\0\4\0\a\0\n4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0003\2\4\0003\3\5\0:\3\6\2>\0\3\1G\0\1\0\31multi_line_comment_strings\1\3\0\0\a/*\a*/\1\0\1\31single_line_comment_string\a//\15typescript\23configure_language\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19config/lualine\frequire\0" },
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["monokai.nvim"] = {
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/monokai.nvim",
    url = "https://github.com/tanvirtin/monokai.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config/neoscroll\frequire\0" },
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config/autopairs\frequire\0" },
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2Þ\1\0\0\5\0\t\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\a\0003\2\3\0003\3\4\0002\4\0\0:\4\5\3:\3\6\2:\2\b\1>\0\2\1G\0\1\0\tview\1\0\0\rmappings\tlist\1\0\1\16custom_only\1\1\0\b\tside\nright\21hide_root_folder\1\16auto_resize\2\vheight\3\30\19relativenumber\1\vnumber\1\15signcolumn\byes\nwidth\0032\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22config/treesitter\frequire\0" },
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vgit.nvim"] = {
    config = { "\27LJ\1\0022\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\tvgit\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/opt/vgit.nvim",
    url = "https://github.com/tanvirtin/vgit.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\1\2­\1\0\0\4\0\a\0\n4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0003\2\4\0003\3\5\0:\3\6\2>\0\3\1G\0\1\0\31multi_line_comment_strings\1\3\0\0\a/*\a*/\1\0\1\31single_line_comment_string\a//\15typescript\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22config/treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19config/lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2Þ\1\0\0\5\0\t\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\a\0003\2\3\0003\3\4\0002\4\0\0:\4\5\3:\3\6\2:\2\b\1>\0\2\1G\0\1\0\tview\1\0\0\rmappings\tlist\1\0\1\16custom_only\1\1\0\b\tside\nright\21hide_root_folder\1\16auto_resize\2\vheight\3\30\19relativenumber\1\vnumber\1\15signcolumn\byes\nwidth\0032\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config/neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\1\0028\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config/autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring("\27LJ\1\2·\30\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0—\30\n\t\tfunction! s:check_back_space() abort\n\t\tlet col = col('.') - 1\n\t\treturn !col || getline('.')[col - 1]  =~# '\\s'\n\t\tendfunction\n\n\t\t\" Use tab for trigger completion with characters ahead and navigate.\n\t\t\" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by\n\t\t\" other plugin before putting this into your config.\n\t\tinoremap <silent><expr> <TAB>\n\t\t\\ pumvisible() ? \"\\<C-n>\" :\n\t\t\\ <SID>check_back_space() ? \"\\<TAB>\" :\n\t\t\\ coc#refresh()\n\t\tinoremap <expr><S-TAB> pumvisible() ? \"\\<C-p>\" : \"\\<C-h>\"\n\n\t\t\" Use <c-space> to trigger completion.\n\t\tif has('nvim')\n\t\t\tinoremap <silent><expr> <c-space> coc#refresh()\n\t\telse\n\t\t\tinoremap <silent><expr> <c-@> coc#refresh()\n\t\tendif\n\n\t\t\" Make <CR> auto-select the first completion item and notify coc.nvim to\n\t\t\" format on enter, <cr> could be remapped by other vim plugin\n\t\tinoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()\n\t\t\\: \"\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>\"\n\n\t\t\" Use `[g` and `]g` to navigate diagnostics\n\t\t\" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.\n\t\tnmap <silent> [g <Plug>(coc-diagnostic-prev)\n\t\tnmap <silent> ]g <Plug>(coc-diagnostic-next)\n\n\t\t\" GoTo code navigation.\n\t\tnmap <silent> gd <Plug>(coc-definition)\n\t\tnmap <silent> gy <Plug>(coc-type-definition)\n\t\tnmap <silent> gi <Plug>(coc-implementation)\n\t\tnmap <silent> gr <Plug>(coc-references)\n\n\t\t\" Use K to show documentation in preview window.\n\t\tnnoremap <silent> K :call <SID>show_documentation()<CR>\n\n\t\t\tfunction! s:show_documentation()\n\t\t\t\n\t\t\tif (index(['vim','help'], &filetype) >= 0)\n\t\t\t\texecute 'h '.expand('<cword>')\n\t\t\telseif (coc#rpc#ready())\n\t\t\t\tcall CocActionAsync('doHover')\n\t\t\telse\n\t\t\t\texecute '!' . &keywordprg . \" \" . expand('<cword>')\n\n\t\t\tendif\n\n\t\t\tendfunction\n\n\t\t\t\" Highlight the symbol and its references when holding the cursor.\n\t\t\tautocmd CursorHold * silent call CocActionAsync('highlight')\n\n\t\t\t\" Symbol renaming.\n\t\t\tnmap <leader>rn <Plug>(coc-rename)\n\n\t\t\t\" Formatting selected code.\n\t\t\txmap <leader>f  <Plug>(coc-format-selected)\n\t\t\tnmap <leader>f  <Plug>(coc-format-selected)\n\n\t\t\taugroup mygroup\n\t\t\tautocmd!\n\t\t\t\" Setup formatexpr specified filetype(s).\n\t\t\tautocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')\n\t\t\t\" Update signature help on jump placeholder.\n\t\t\tautocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')\n\t\t\taugroup end\n\n\t\t\t\" Applying codeAction to the selected region.\n\t\t\t\" Example: `<leader>aap` for current paragraph\n\t\t\txmap <leader>a  <Plug>(coc-codeaction-selected)\n\t\t\tnmap <leader>a  <Plug>(coc-codeaction-selected)\n\n\t\t\t\" Remap keys for applying codeAction to the current buffer.\n\t\t\tnmap <leader>ac  <Plug>(coc-codeaction)\n\t\t\t\" Apply AutoFix to problem on the current line.\n\t\t\tnmap <leader>qf  <Plug>(coc-fix-current)\n\n\t\t\t\" Run the Code Lens action on the current line.\n\t\t\tnmap <leader>cl  <Plug>(coc-codelens-action)\n\n\t\t\t\" Map function and class text objects\n\t\t\t\" NOTE: Requires 'textDocument.documentSymbol' support from the language server.\n\t\t\txmap if <Plug>(coc-funcobj-i)\n\t\t\tomap if <Plug>(coc-funcobj-i)\n\t\t\txmap af <Plug>(coc-funcobj-a)\n\t\t\tomap af <Plug>(coc-funcobj-a)\n\t\t\txmap ic <Plug>(coc-classobj-i)\n\t\t\tomap ic <Plug>(coc-classobj-i)\n\t\t\txmap ac <Plug>(coc-classobj-a)\n\t\t\tomap ac <Plug>(coc-classobj-a)\n\n\t\t\t\" Add `:Format` command to format current buffer.\n\t\t\tcommand! -nargs=0 Format :call CocAction('format')\n\n\t\t\t\" Add `:Fold` command to fold current buffer.\n\t\t\tcommand! -nargs=? Fold :call     CocAction('fold', <f-args>)\n\n\t\t\t\" Add `:OR` command for organize imports of the current buffer.\n\t\t\tcommand! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')\n\n\t\t\t\" Search workspace symbols.\n\t\t\tnnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>\n\n\t\t\t\" Show all diagnostics.\n\t\t\tnnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>\n\t\t\t\bcmd\bvim\0", "config", "coc.nvim")
time([[Config for coc.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'vgit.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
