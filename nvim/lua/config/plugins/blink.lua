return { {
    "saghen/blink.cmp",
    --tag = "v1.3.1",
    version = '1.*',

    opts = {
        fuzzy = {
            --implementation = "prefer_rust_with_warning",
            implementation = "prefer_rust_with_warning",
        },
        cmdline = {
            keymap = { preset = 'inherit' },
            completion = { menu = { auto_show = true } },
        },
    }
} }
