local function enableBladeParser()
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.blade = {
		install_info = {
			url = "https://github.com/EmranMR/tree-sitter-blade",
			files = { "src/parser.c" },
			branch = "main",
		},
		filetype = "blade",
	}
	vim.filetype.add({
		pattern = {
			[".*%.blade%.php"] = "blade",
		},
	})

	local treesiter = require("nvim-treesitter.configs")
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.blade = {
		install_info = {
			url = "https://github.com/EmranMR/tree-sitter-blade",
			files = { "src/parser.c" },
			branch = "main",
		},
		filetype = "blade",
	}

	vim.filetype.add({
		pattern = {
			[".*%.blade%.php"] = "blade",
		},
	})
	local bladeGrp
	vim.api.nvim_create_augroup("BladeFiltypeRelated", { clear = true })
	vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
		pattern = "*.blade.php",
		group = bladeGrp,
		callback = function()
			vim.opt.filetype = "blade"
		end,
	})
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local ts = require("nvim-treesitter.configs")
			ts.setup({
				ensure_installed = {
					"blade",
					"c",
          "css",
					"go",
					"html",
					"javascript",
					"lua",
					"php",
					"php_only",
					"query",
					"vim",
					"vimdoc",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				autotag = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<leader>v",
						node_incremental = "<leader>v",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})

			-- Custom Parsers
			--enableBladeParser()
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

			-- Blade
			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = { "src/parser.c" },
					branch = "main",
				},
				filetype = "blade",
			}
			vim.filetype.add({
				pattern = {
					[".*%.blade%.php"] = "blade",
				},
			})

			local treesiter = require("nvim-treesitter.configs")
			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = { "src/parser.c" },
					branch = "main",
				},
				filetype = "blade",
			}

			vim.filetype.add({
				pattern = {
					[".*%.blade%.php"] = "blade",
				},
			})
			local bladeGrp
			vim.api.nvim_create_augroup("BladeFiltypeRelated", { clear = true })
			vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
				pattern = "*.blade.php",
				group = bladeGrp,
				callback = function()
					vim.opt.filetype = "blade"
				end,
			})
		end,
	},
	"nvim-treesitter/nvim-treesitter-context",
}
