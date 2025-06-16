return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-symbols.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    }
},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			-- pickers = {
			-- 	find_files = {
      -- 		will still show the inside of `.git/` as it's not `.gitignore`d.
			-- 		-- `hidden = true` 
			-- 		find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
			-- 	},
			-- },
		})

		telescope.load_extension("fzf") -- need to 'gb' on the Lazy's fzf entry
		--telescope.load_extension("noice")

		vim.keymap.set(
			"n", "<leader>fa",
			":Telescope find_files no_ignore=true hidden=true glob=!**/.git/* <CR>",
			{ desc = "Fuzzy find files in cwd" }
		)
    vim.keymap.set("n", "<leader>ff", builtin.find_files,
    { desc = "Fuzzy find files in cwd" }
    )
		vim.keymap.set(
			"n", "<leader>fp",
			function()
				builtin.find_files({ previewer = false })
			end,
			({ desc = "Fuzzy find files in cwd" })
		)
		vim.keymap.set("n", "<leader>fg", builtin.live_grep,
      { desc = "Fuzzy find string in cwd" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers,
      { desc = "Fuzzy find among open buffers" })
		vim.keymap.set("n", "<leader>fc", builtin.grep_string,
      { desc = "Find string under cursor in cwd" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags,
      { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>",
      { desc = "Find todos" })
		vim.keymap.set("n", "<leader>fe",
      function ()
        builtin.symbols{ sources = {
          - 'emoji',
           'gitmoji'
          }
        }
      end,
      { desc = "Find emoji" })

    -- @FIX: support 0.11 'winborder'
    -- https://github.com/nvim-telescope/telescope.nvim/issues/3436
    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopeFindPre",
      callback = function()
        vim.opt_local.winborder = "none"
        vim.api.nvim_create_autocmd("WinLeave", {
          once = true,
          callback = function()
            vim.opt_local.winborder = "rounded"
          end,
        })
      end,
    })
	end,
}
