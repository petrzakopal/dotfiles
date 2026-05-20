vim.api.nvim_create_user_command("TelescopeIgnoreOff", function()
  require("telescope").setup({
    defaults = {
      file_ignore_patterns = {},
    },
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = true,
      },
    },
  })
end, {})

vim.api.nvim_create_user_command("TelescopeIgnoreOn", function()
  require("telescope").setup({
    pickers = {
      find_files = {
        hidden = false,
        no_ignore = false,
      },
    },
  })
end, {})
