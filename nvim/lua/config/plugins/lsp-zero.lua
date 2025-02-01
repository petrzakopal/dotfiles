    return{ {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
    },
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
        { 'L3MON4D3/LuaSnip' },     -- Required
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.api.nvim_command, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    }

