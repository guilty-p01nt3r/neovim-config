return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        {
            "folke/lazydev.nvim",
            dependencies = {
                "rcarriga/nvim-dap-ui",
            },
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "luvit-meta/library", words = { "vim%.uv" } },
                    "nvim-dap-ui",
                },
            },
        },
        -- optional `vim.uv` typings
        { "Bilal2453/luvit-meta", lazy = true },
    },
    init = function()
        local lspConfigPath = require("lazy.core.config").options.root .. "/nvim-lspconfig"

        -- INFO `prepend` ensures it is loaded before the user's LSP configs, so
        -- that the user's configs override nvim-lspconfig.
        vim.opt.runtimepath:prepend(lspConfigPath)
    end,
    config = function()
        --vim.lsp.config("*", {})
        vim.lsp.enable({
            "lua_ls",
            --"phpactor",
            "intelephense",
            --"ts_ls",
            "vtsls",
            "vue_ls",
        })
    end,
}
