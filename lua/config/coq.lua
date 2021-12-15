vim.g.coq_settings = {
	auto_start = 'shut-up',
	clients = {
		tabnine = {
			enabled = true
		}
	},
	keymap = {
		pre_select = true,
		jump_to_mark = "<c-,>"
	},
	match = {
		max_results = 11
	},
	display = {
		ghost_text = {
			enabled = true
		}
	}
}
