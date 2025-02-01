
    return{ {
        'windwp/nvim-ts-autotag',
        opt = true,
        ft = 'typescriptreact',
        requires = { { 'nvim-treesitter/nvim-treesitter' } },
        config = function() require('nvim-ts-autotag').setup() end,
    }}
