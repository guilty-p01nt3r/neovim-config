return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	lazy = true,
	event = { "InsertEnter" },
	opts = {
		suggestion = {
			enable = true,
			auto_trigger = true,
			keymap = {
				accept = "<C-a>",
				accept_word = false,
				accept_line = false,
        next = "<C-f>",
				prev = "<C-d>",
				dismiss = "<C-X>",
			},
		},
	},
}
