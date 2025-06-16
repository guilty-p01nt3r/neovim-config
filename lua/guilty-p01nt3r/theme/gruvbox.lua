return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		dim_inactive = false,
		transparent_mode = true,
		contrast = "hard",
	},
	init = function()
		vim.o.background = "dark"
		vim.cmd('colorscheme gruvbox')
	end,
}
