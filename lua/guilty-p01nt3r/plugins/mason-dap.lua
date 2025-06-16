return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
  },
  config = function()
    local mason_dap = require("mason-nvim-dap")
    local lspconfig = require("lspconfig")
    local php_adapter = require("guilty-p01nt3r.plugins.dap-adapter.php")

    mason_dap.setup({
      handlers = {
        function(config)
          mason_dap.default_setup(config)
        end,
        php = function(config)
          php_adapter.setup(config, mason_dap, lspconfig)
        end,
      },
    })
  end,
}
