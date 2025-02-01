local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- search for files with fuzzy finder
vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- search for buffers

vim.keymap.set('n', '<leader>ps', function()
                            builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- grep and find text in project
--require('telescope').load_extension('fzf')
