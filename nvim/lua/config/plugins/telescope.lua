return {
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.1',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      -- Safe load (prevents crash if build fails)
      pcall(telescope.load_extension, 'fzf')

      vim.keymap.set('n', '<leader>f', function()
        builtin.find_files({ previewer = false })
      end)

      vim.keymap.set('n', '<leader>bf', function()
        builtin.buffers({ previewer = false })
      end)

      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({
          search = vim.fn.input("Grep > "),
          previewer = false
        })
      end)
    end,
  },
}
