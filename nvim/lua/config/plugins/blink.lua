return { {
    "saghen/blink.cmp",
    --tag = "v1.3.1",
    version = '1.*',


    opts = {
        keymap = { preset = 'default' },
        fuzzy = {
            --implementation = "prefer_rust_with_warning",
            implementation = "prefer_rust_with_warning",
        },
        cmdline = {
            keymap = { preset = 'inherit' },
            completion = { menu = { auto_show = true } },
        },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- Will be removed in a future release
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        signature = { enabled = true },
    }
} }
