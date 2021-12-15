require('nvim-autopairs').setup({
	enable_check_bracket_line = true,
	disable_filetype = { "TelescopePrompt" , "vim" },
	enable_afterquote = false,
	enable_moveright = true

})

-- If you want insert `(` after select function or method item
local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')


npairs.add_rules {

	Rule(' ', ' ')
	:with_pair(function (opts)
		local pair = opts.line:sub(opts.col - 1, opts.col)
		return vim.tbl_contains({ '()', '[]', '{}' }, pair)
	end),
	Rule('( ', ' )')
	:with_pair(function() return false end)
	:with_move(function(opts)
		return opts.prev_char:match('.%)') ~= nil
	end)
	:use_key(')'),
	Rule('{ ', ' }')
	:with_pair(function() return false end)
	:with_move(function(opts)
		return opts.prev_char:match('.%}') ~= nil
	end)
	:use_key('}'),
	Rule('[ ', ' ]')
	:with_pair(function() return false end)
	:with_move(function(opts)
		return opts.prev_char:match('.%]') ~= nil
	end)
	:use_key(']'),
	Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript' })
	:use_regex(true)
	:set_end_pair_length(2),
}
