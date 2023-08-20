vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Prettier remap from :Prettier
vim.keymap.set("n", "<leader>pr", vim.cmd.Prettier)

-- Basic buffer navigation without harpoon
-- Next and Previous Buffers
--vim.keymap.set("n", "<C-J>", vim.cmd.bnext)
--vim.keymap.set("n", "<C-K>", vim.cmd.bprev)
-- Unload buffer
--vim.keymap.set("n", "<leader>bd", vim.cmd.bd)
