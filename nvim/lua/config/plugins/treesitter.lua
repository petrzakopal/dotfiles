return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },

        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "html",
                    "javascript",
                    "typescript",
                    "tsx",
                    "css",
                    "json",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "c",
                    "python",
                    "verilog",
                    "latex",
                },
                -- Run this if not automatically installed
                -- :TSInstall html javascript typescript tsx css json
                additional_vim_regex_highlighting = false,
                auto_install = true,

                highlight = {
                    enable = true,
                },

                indent = {
                    enable = true,
                    disable = { "python", "c" },
                },
            })
        end,
    },
}
