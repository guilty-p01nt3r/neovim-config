return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local opts = {
			options = {
				icons_enabled = true,
				--theme = 'gruvbox-material',
				--theme = 'gruvbox_dark',
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = {
					"mode",
					{
						--require("noice").api.statusline.mode.get,
						--cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_b = {
					"branch",
					"diff",
					{
						"diagnostics",
						diagnostics_color = {
							-- Same values as the general color option can be used here.
							error = "LualineDiagnosticsError",
							warn = "LualineDiagnosticsWarn",
							info = "LualineDiagnosticsInfo",
							hint = "LualineDiagnosticsHint",
						},
					},
				},
				lualine_c = { "filename" },
				lualine_x = {
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		}
		local lualine = require("lualine")
		lualine.setup(opts)
		vim.api.nvim_create_autocmd("RecordingEnter", {
			callback = function()
			lualine.refresh({ place = { "statusline" } })
			end,
		})

		-- The register does not clean up immediately after
		-- recording stops, so we wait a bit (50ms) before refreshing.
		vim.api.nvim_create_autocmd("RecordingLeave", {
			callback = function()
				local timer = vim.loop.new_timer()
				timer:start(
					50,
					0,
					vim.schedule_wrap(function()
						lualine.refresh({ place = { "statusline" } })
					end)
				)
			end,
		})
	end,
}
