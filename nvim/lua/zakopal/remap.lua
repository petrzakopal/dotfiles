vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Default tabs in neovim
-- New tab
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnew)
-- Next tab
vim.keymap.set("n", "<leader>tN", vim.cmd.tabnext)
-- Previous tab
vim.keymap.set("n", "<leader>tP", vim.cmd.tabprevious)
-- Close a tab
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose)

-- Prettier remap from :Prettier
--vim.keymap.set("n", "<leader>pr", vim.cmd.PrettierAsync)


-- LSP Zero format
-- vim.keymap.set("n", "<leader>p", vim.cmd.LspZeroFormat)



--Basic buffer navigation without harpoon
-- Next and Previous Buffers
--vim.keymap.set("n", "<C-J>", vim.cmd.bnext)
--vim.keymap.set("n", "<C-K>", vim.cmd.bprev)
-- Unload buffer
--vim.keymap.set("n", "<leader>bd", vim.cmd.bd)
