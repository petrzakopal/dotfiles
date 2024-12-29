-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- used for rose-pine colorscheme
    --	use({ 'rose-pine/neovim', as = 'rose-pine', config = function()
    --		vim.cmd('colorscheme rose-pine')
    --	end
    --	})
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.api.nvim_command, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }


    use({
        "olimorris/onedarkpro.nvim",
        config = function()
            vim.cmd('colorscheme onedark_dark')
        end
    })


    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }


    use {
        "ThePrimeagen/vim-be-good",
    }


    --use {
    --	"echasnovski/mini.statusline",
    --    config = function ()
    --        require("mini.statusline").setup({
    --            use_icons = true
    --        })
    --    end
    --}
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }


    use {
        'windwp/nvim-ts-autotag',
        opt = true,
        ft = 'typescriptreact',
        requires = { { 'nvim-treesitter/nvim-treesitter' } },
        config = function() require('nvim-ts-autotag').setup() end,
    }


    -- use {
    -- 'prettier/vim-prettier',
    --run = 'yarn install',
    --ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'html'}
    --}

    --use {
    --    'sbdchd/neoformat'
    --}



    use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    use 'rktjmp/lush.nvim'

    -- not netrw support
    --use('ryanoasis/vim-devicons')
    -- for vim-devicons support
    --use('preservim/nerdtree')

    use("nvim-tree/nvim-web-devicons")
    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    })

    use "~/.config/nvim/zakopal_theme"
    --    use "f-person/git-blame.nvim"
    use { "diegoulloao/neofusion.nvim" }

    --   use {"lukas-reineke/indent-blankline.nvim"}
    --
    use { "saghen/blink.cmp", tag = "v0.8.2"}
end)
