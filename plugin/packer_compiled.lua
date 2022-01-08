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
  ["aerial.nvim"] = {
    config = { "\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18config/aerial\frequire\0" },
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\1\0028\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  kommentary = {
    config = { "\27LJ\1\2�\1\0\0\4\0\a\0\n4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0003\2\4\0003\3\5\0:\3\6\2>\0\3\1G\0\1\0\31multi_line_comment_strings\1\3\0\0\a/*\a*/\1\0\1\31single_line_comment_string\a//\15typescript\23configure_language\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\1\2�\3\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\15symbol_map\1\0\25\tText\b\rFunction\b\rOperator\b\nColor\b\nClass\bﴯ\vModule\b\rConstant\b\rProperty\bﰠ\vMethod\b\15EnumMember\b\tUnit\b塞\14Interface\b\vStruct\bפּ\rVariable\b\fSnippet\b\vFolder\b\nEvent\b\nField\bﰠ\18TypeParameter\5\tFile\b\nValue\b\16Constructor\b\tEnum\b\fKeyword\b\14Reference\b\1\0\1\14with_text\1\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
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
  ["nvim-cmp"] = {
    config = { '\27LJ\1\2;\0\1\3\0\4\0\0064\1\0\0007\1\1\0017\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\20vsnip#anonymous\afn\bvim�\4\1\0\b\0$\0?4\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\2\3\0003\3\b\0003\4\6\0007\5\4\0013\6\5\0>\5\2\2:\5\a\4:\4\t\0033\4\v\0001\5\n\0:\5\f\4:\4\r\0033\4\17\0007\5\14\0007\6\14\0007\6\15\6>\6\1\0023\a\16\0>\5\3\2:\5\18\0047\5\19\0007\5\20\5:\5\21\0047\5\14\0007\5\22\0053\6\23\0>\5\2\2:\5\24\0047\5\14\0003\6\26\0007\a\14\0007\a\25\a>\a\1\2:\a\27\0067\a\14\0007\a\28\a>\a\1\2:\a\29\6>\5\2\2:\5\30\4:\4\14\0037\4\19\0007\4\31\0042\5\4\0003\6 \0;\6\1\0053\6!\0;\6\2\0053\6"\0;\6\3\0052\6\3\0003\a#\0;\a\1\6>\4\3\2:\4\31\3>\2\2\1G\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\17cmp-nvim-lua\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\1\0\1\vselect\2\fconfirm\t<CR>\fdisable\vconfig\14<C-Space>\1\0\0\1\3\0\0\6i\6c\rcomplete\fmapping\fsnippet\vexpand\1\0\0\0\15formatting\1\0\0\vformat\1\0\0\1\0\2\rmaxwidth\0032\14with_text\1\15cmp_format\nsetup\flspkind\bcmp\frequire\0' },
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\1\2%\0\1\5\0\1\0\0062\1\0\0\16\3\0\0007\2\0\0\16\4\1\0>\2\3\1G\0\1\0\nsetupO\1\0\3\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\1\2\0001\2\3\0>\1\2\1G\0\1\0\0\20on_server_ready\23nvim-lsp-installer\frequire\0" },
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2�\1\0\0\5\0\t\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\a\0003\2\3\0003\3\4\0002\4\0\0:\4\5\3:\3\6\2:\2\b\1>\0\2\1G\0\1\0\tview\1\0\0\rmappings\tlist\1\0\1\16custom_only\1\1\0\b\tside\nright\21hide_root_folder\1\16auto_resize\2\vheight\3\30\19relativenumber\1\vnumber\1\15signcolumn\byes\nwidth\0032\nsetup\14nvim-tree\frequire\0" },
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
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/dsd/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18config/aerial\frequire\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22config/treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring('\27LJ\1\2;\0\1\3\0\4\0\0064\1\0\0007\1\1\0017\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\20vsnip#anonymous\afn\bvim�\4\1\0\b\0$\0?4\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\2\3\0003\3\b\0003\4\6\0007\5\4\0013\6\5\0>\5\2\2:\5\a\4:\4\t\0033\4\v\0001\5\n\0:\5\f\4:\4\r\0033\4\17\0007\5\14\0007\6\14\0007\6\15\6>\6\1\0023\a\16\0>\5\3\2:\5\18\0047\5\19\0007\5\20\5:\5\21\0047\5\14\0007\5\22\0053\6\23\0>\5\2\2:\5\24\0047\5\14\0003\6\26\0007\a\14\0007\a\25\a>\a\1\2:\a\27\0067\a\14\0007\a\28\a>\a\1\2:\a\29\6>\5\2\2:\5\30\4:\4\14\0037\4\19\0007\4\31\0042\5\4\0003\6 \0;\6\1\0053\6!\0;\6\2\0053\6"\0;\6\3\0052\6\3\0003\a#\0;\a\1\6>\4\3\2:\4\31\3>\2\2\1G\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\17cmp-nvim-lua\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\1\0\1\vselect\2\fconfirm\t<CR>\fdisable\vconfig\14<C-Space>\1\0\0\1\3\0\0\6i\6c\rcomplete\fmapping\fsnippet\vexpand\1\0\0\0\15formatting\1\0\0\vformat\1\0\0\1\0\2\rmaxwidth\0032\14with_text\1\15cmp_format\nsetup\flspkind\bcmp\frequire\0', "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2�\1\0\0\5\0\t\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\a\0003\2\3\0003\3\4\0002\4\0\0:\4\5\3:\3\6\2:\2\b\1>\0\2\1G\0\1\0\tview\1\0\0\rmappings\tlist\1\0\1\16custom_only\1\1\0\b\tside\nright\21hide_root_folder\1\16auto_resize\2\vheight\3\30\19relativenumber\1\vnumber\1\15signcolumn\byes\nwidth\0032\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config/neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\1\2�\3\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\15symbol_map\1\0\25\tText\b\rFunction\b\rOperator\b\nColor\b\nClass\bﴯ\vModule\b\rConstant\b\rProperty\bﰠ\vMethod\b\15EnumMember\b\tUnit\b塞\14Interface\b\vStruct\bפּ\rVariable\b\fSnippet\b\vFolder\b\nEvent\b\nField\bﰠ\18TypeParameter\5\tFile\b\nValue\b\16Constructor\b\tEnum\b\fKeyword\b\14Reference\b\1\0\1\14with_text\1\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19config/lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\1\2%\0\1\5\0\1\0\0062\1\0\0\16\3\0\0007\2\0\0\16\4\1\0>\2\3\1G\0\1\0\nsetupO\1\0\3\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\1\2\0001\2\3\0>\1\2\1G\0\1\0\0\20on_server_ready\23nvim-lsp-installer\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\1\0028\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config/autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\1\2�\1\0\0\4\0\a\0\n4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0003\2\4\0003\3\5\0:\3\6\2>\0\3\1G\0\1\0\31multi_line_comment_strings\1\3\0\0\a/*\a*/\1\0\1\31single_line_comment_string\a//\15typescript\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
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
