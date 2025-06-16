-- Hyperlink
vim.keymap.set('n', 'gx', ':execute "!xdg-open " . shellescape("<cWORD>")<CR>')

-- Copy to clipboard and pasting
vim.keymap.set('v', '<leader>p', '"_dP')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')


-- Moving
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })


-- Replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- Fix
vim.keymap.set("n", "Q", "<nop>", { noremap = true, silent = true })


vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    -- local opts = { buffer = bufnr, remap = false }
    local telescope = require("telescope.builtin")

    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts)

    vim.keymap.set('n', 'K', function()
      vim.lsp.buf.hover({ title = " hover " })
    end, { desc = 'Hover Documentation' })

    vim.keymap.set("n", "<leader>vws", function()
      vim.lsp.buf.workspace_symbol()
    end, opts)

    -- ]d jumps to the next diagnostic in the buffer. ]d-default
    -- [d jumps to the previous diagnostic in the buffer. [d-default
    -- ]D jumps to the last diagnostic in the buffer. ]D-default
    -- [D jumps to the first diagnostic in the buffer. [D-default
    -- <C-w>d shows diagnostic at cursor in a floating window. CTRL-W_d-default
    vim.keymap.set("n", "<leader>vd", function()
      vim.diagnostic.open_float({ scope = "line" })
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
    -- Using blink for signature help
    -- vim.keymap.set("n", "<C-K>", function()
    --   vim.lsp.buf.signature_help()
    -- end, opts)
    --
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
