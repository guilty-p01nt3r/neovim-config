return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  --dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
      ['<C-h>'] = { 'show', 'show_documentation', 'hide_documentation' },
    },
    signature = {
      enabled = true,
      trigger = {
        -- enabled = false, -- if I uncomment this, the keymap won't work anymore
        show_on_trigger_character = false,
        show_on_insert_on_trigger_character = false,
      },
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      -- trigger = {
      --   show_on_keyword = false,
      --   show_on_trigger_character = false,
      -- },
      documentation = {
        auto_show = true
      }
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
      kind_icons = {
        text = function(ctx)
          local icon = ctx.kind_icon
          if vim.tbl_contains({ "Path" }, ctx.source_name) then
            local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
            if dev_icon then
              icon = dev_icon
            end
          else
            icon = require("lspkind").symbolic(ctx.kind, {
              mode = "symbol",
            })
          end

          return icon .. ctx.icon_gap
        end,

        -- Optionally, use the highlight groups from nvim-web-devicons
        -- You can also add the same function for `kind.highlight` if you want to
        -- keep the highlight groups in sync with the icons.
        highlight = function(ctx)
          local hl = ctx.kind_hl
          if vim.tbl_contains({ "Path" }, ctx.source_name) then
            local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
            if dev_icon then
              hl = dev_hl
            end
          end
          return hl
        end,
      }
    },

  },
  opts_extend = { "sources.default" }
}
