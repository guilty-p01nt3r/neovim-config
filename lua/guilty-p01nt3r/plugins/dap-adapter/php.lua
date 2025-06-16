local M = {}

M.setup = function(config, mason_dap, lspconfig)
  local function isEmpty(s)
    return s == nil or s == ""
  end

  local default_local_root_path = ".git"
  local default_server_root = "/var/www/html/"

  local local_root_path = os.getenv("LOCAL_SOURCE_PATH")
  local server_root = os.getenv("SERVER_SOURCE_ROOT")

  local_root_path = ((not isEmpty(local_root_path)) and local_root_path) or default_local_root_path
  server_root = ((not isEmpty(server_root)) and server_root) or default_server_root

  local local_root = lspconfig.util.root_pattern(local_root_path)

  config.configurations = {
    {
      type = "php",
      request = "launch",
      name = "Listen for Xdebug (neovim DAP)",
      port = 9001,
      localSourceRoot = local_root(vim.fn.getcwd()),
      serverSourceRoot = server_root,
    },
  }
  mason_dap.default_setup(config)

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- TODO: move somewhere else
      local opts = { buffer = ev.buf, silent = true }
      -- local opts = { buffer = bufnr, remap = false }
      local telescope = require("telescope.builtin")

      vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
      end, opts)
      vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
      end, opts)
      vim.keymap.set("n", "<leader>vws", function()
        vim.lsp.buf.workspace_symbol()
      end, opts)
      vim.keymap.set("n", "<leader>vd", function()
        vim.diagnostic.open_float({ scope = "line" })
      end, opts)

      vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_next()
      end, opts)
      vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_prev()
      end, opts)
      vim.keymap.set("n", "<leader>vca", function()
        vim.lsp.buf.code_action()
      end, opts)
      vim.keymap.set("n", "<leader>vrr", function()
        vim.lsp.buf.references()
      end, opts)
      vim.keymap.set("n", "<leader>vrn", function()
        vim.lsp.buf.rename()
      end, opts)
      vim.keymap.set("n", "<C-h>", function()
        vim.lsp.buf.signature_help()
      end, opts)

      vim.keymap.set("n", "<leader>vru", function()
        telescope.lsp_references()
      end, opts)
      vim.keymap.set("n", "<leader>vrm", function()
        telescope.lsp_document_symbols({ symbols = "method" })
      end, opts)
      vim.keymap.set("n", "<leader>vrf", function()
        telescope.lsp_document_symbols({ symbols = "function" })
      end, opts)
      vim.keymap.set("n", "<leader>vrp", function()
        telescope.lsp_document_symbols({ symbols = "property" })
      end, opts)
    end,
  })
end

return M
