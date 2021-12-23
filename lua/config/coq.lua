vim.g.coq_settings = {
	auto_start = 'shut-up',
	clients = {
		tabnine = {
			enabled = false
		}
	},
	keymap = {
		pre_select = true,
		jump_to_mark = "<c-,>"
	},
	match = {
		max_results = 10
	},
	display = {
		ghost_text = {
			enabled = true
		},
		--icons = {
		--	mapping = "Class": "" -- "Namespace"= "", "Enum"= "陼", "Interface"= "臭", "Struct"= "", "Function"= "", "Constant"= " "}
		--}
	}
}
