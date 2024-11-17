--local mark = require("harpoon.mark")
--local ui = require("harpoon.ui")
--
--
--vim.keymap.set("n", "<leader>a", mark.add_file)
----vim.keymap.set("n", "<C-e>",ui.toggle_quick_menu)
--vim.keymap.set("n", "<leader>e",ui.toggle_quick_menu)
--vim.keymap.set("n", "<C-J>",function() ui.nav_next() end)
--vim.keymap.set("n", "<C-K>",function () ui.nav_prev() end)

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<C-J>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-K>", function() harpoon:list():next() end)

-- if telescope should be used as UI for harpoon
-- basic telescope configuration
--local conf = require("telescope.config").values
--local function toggle_telescope(harpoon_files)
--    local file_paths = {}
--    for _, item in ipairs(harpoon_files.items) do
--        table.insert(file_paths, item.value)
--    end
--
--    require("telescope.pickers").new({}, {
--        prompt_title = "Harpoon",
--        finder = require("telescope.finders").new_table({
--            results = file_paths,
--        }),
--        previewer = conf.file_previewer({}),
--        sorter = conf.generic_sorter({}),
--    }):find()
--end
--
--vim.keymap.set("n", "<leader>e", function() toggle_telescope(harpoon:list()) end,
--    { desc = "Open harpoon window" })
