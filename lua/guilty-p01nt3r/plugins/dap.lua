return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup({
			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.25,
						},
						{
							id = "breakpoints",
							size = 0.25,
						},
						{
							id = "stacks",
							size = 0.25,
						},
						{
							id = "watches",
							size = 0.25,
						},
					},
					position = "left",
					size = 40,
				},
				{
					elements = {},
					position = "bottom",
					size = 10,
				},
			},
		})
		----------------
		--- MAPPINGS ---
		----------------

		vim.keymap.set("n", "<leader>db", function()
			dap.toggle_breakpoint()
		end, { desc = "DAP: Toggle breakpoint" })
		vim.keymap.set("n", "<leader>dc", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "DAP: Set breakpoint condition" })
		vim.keymap.set("n", "<leader>di", function()
			dapui.eval()
		end, { desc = "DAP: Evaluate expression" })
		vim.keymap.set("n", "<F1>", function()
			dap.continue()
		end, { desc = "DAP: Continue" })
		vim.keymap.set("n", "<leader>de", function()
			dap.set_exception_breakpoints()
		end, { desc = "DAP: Set exception breakpoints" })
		vim.keymap.set("n", "<F2>", function()
			dap.step_over()
		end, { desc = "DAP: Step over" })
		vim.keymap.set("n", "<F3>", function()
			dap.step_into()
		end, { desc = "DAP: Step into" })
		vim.keymap.set("n", "<F4>", function()
			dap.step_out()
		end, { desc = "DAP: Step out" })

		----------------
		--- ADAPTERS ---
		----------------

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}

