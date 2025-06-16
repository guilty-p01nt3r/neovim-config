vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- enable filetype plugin
vim.opt.filetype = "on"

--vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.completeopt = "menuone,noselect"

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.lsp.set_log_level("off")

vim.opt.undofile = true
vim.opt.swapfile = false

-- force the clipboard to use OSC 52
vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = require("vim.ui.clipboard.osc52").paste("+"),
		["*"] = require("vim.ui.clipboard.osc52").paste("*"),
	},
}
vim.diagnostic.config({
	-- Show as virtual text
	-- virtual_text = true,

	-- Show as hover buffer
	-- virtual_lines = true,

	-- virtual_lines = {
	-- 	-- Only show virtual line diagnostics for the current cursor line
	-- 	current_line = true,
	-- },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "😡",
			[vim.diagnostic.severity.WARN] = "😥",
			[vim.diagnostic.severity.HINT] = "🧐",
			[vim.diagnostic.severity.INFO] = "🤔",
		},
		-- Red on the entire line
		-- linehl = {
		-- 	[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
		-- },
		numhl = {
			[vim.diagnostic.severity.WARN] = 'WarningMsg',
		},
	},
})

-- ENV
--vim.env.ANTHROPIC_API_KEY = ""
