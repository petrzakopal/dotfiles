-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


use {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

-- used for rose-pine colorscheme
--	use({ 'rose-pine/neovim', as = 'rose-pine', config = function()
--		vim.cmd('colorscheme rose-pine')
--	end
--	})
use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.api.nvim_command, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}


use ({"olimorris/onedarkpro.nvim", config = function()
	vim.cmd('colorscheme onedark_dark')
end
})


use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}

 use {
    'windwp/nvim-ts-autotag',
    opt = true,
    ft = 'typescriptreact',
    requires = {{'nvim-treesitter/nvim-treesitter'}},
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



use('theprimeagen/harpoon')

  use 'rktjmp/lush.nvim'


  use "~/.config/nvim/zakopal_theme"
  end)



