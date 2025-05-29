local builtin = require('telescope.builtin')

-- Search for files without preview
vim.keymap.set('n', '<leader>pf', function()
  builtin.find_files({ previewer = false })
end, {})

-- Search for buffers without preview
vim.keymap.set('n', '<leader>bf', function()
  builtin.buffers({ previewer = false })
end, {})

-- Search with grep and no preview
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({
    search = vim.fn.input("Grep > "),
    previewer = false
  })
end)
-- grep and find text in project
--require('telescope').load_extension('fzf')
