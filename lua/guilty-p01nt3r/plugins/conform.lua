return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nmac427/guess-indent.nvim",
	},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- javascript = { "prettierd" },
				-- typescript = { "prettierd" },
				-- javascriptreact = { "prettierd" },
				-- typescriptreact = { "prettierd" },
				-- css = { "prettierd" },
				-- scss = { "prettierd" },
				-- html = { "prettierd" },
				-- json = { "prettierd" },
				-- yaml = { "prettierd" },
				-- markdown = { "prettierd" },
				--php = { lsp_format = "fallback" },
				sql = { "sleek" }, -- cargo install sleek
        blade = {"blade-formatter"},
			},
		})
		vim.keymap.set("n", "<leader>=", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout = 5000,
			})
		end, { desc = "Format code file or range (in visual mode)" })
	end,
}

