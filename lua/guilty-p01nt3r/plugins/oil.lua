-- Declare a global function to retrieve the current directory
--
function _G.get_oil_winbar()
	local dir = require("oil").get_current_dir()
	if dir then
		return vim.fn.fnamemodify(dir, ":~")
	else
		-- If there is no current directory (e.g. over ssh), just show the buffer name
		return vim.api.nvim_buf_get_name(0)
	end
end

return {
	"stevearc/oil.nvim",
	lazy = false,
	-- Optional dependencies
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	keys = {
		{ "<leader>nr", "<cmd>Oil --float<cr>", desc = "Open Oil floating window" },
	},

	---@module 'oil'
	opts = {
		delete_to_trash = true,
		float = {
			preview_split = "right",
		},
		keymaps = {
			["<C-p>"] = {
        desc = "Open preview window",
				callback = function()
					local oil = require("oil")
					oil.open_preview({ vertical = true, split = "botright" })
				end,
			},
      ["<C-y>"] = {
        desc = "Copy entry filename with full path to clipboard",
        callback = function()
          local actions = require("oil.actions")
          actions.yank_entry.callback()
          vim.notify("Copied to clipboard: " .. vim.fn.getreg('"'), vim.log.levels.INFO)
        end,
      },

		},
	},
}
