-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local cmp = require'cmp'

cmp.setup({

  completion = {
    --completeopt = 'menu,menuone,noinsert',
  },

  snippet = {
  },

  formatting = {
      format = function(entry, vim_item)
        -- fancy icons and a name of kind
        vim_item.kind = require("lspkind").presets.default[vim_item.kind]

        -- set a name for each source
        vim_item.menu = ({
          buffer = "[Buff]",
          nvim_lsp = "[LSP]",
        })[entry.source.name]
        return vim_item
      end,
  },

  sources = {
			{name = 'nvim_lsp' },
			{name = 'PH' },
			{name = 'BUF', keyword_length=1 }
    },

  experimental = {
      ghost_text = true,
  },

})

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  mapping = {
    ['<C-Space>']   = cmp.mapping.complete(),
    ['<C-e>']       = cmp.mapping.close(),
    ['<C-u>']       = cmp.mapping.scroll_docs(-4),
    ['<C-d>']       = cmp.mapping.scroll_docs(4),
    ['<CR>']        = cmp.mapping.confirm({
          behavior  = cmp.ConfirmBehavior.Replace,
          select    = false,
    }),

   ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif has_words_before() then
                  cmp.complete()
                else
                  fallback()
                end
              end, { "i", "s" }
    ),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                else
                  fallback()
                end
              end, { "i", "s" }
    ),

  }
})
