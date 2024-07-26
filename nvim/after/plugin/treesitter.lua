require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "javascript", "latex", "typescript" ,"c", "lua", "vim", "vimdoc", "query", "verilog", "python"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,


  highlight = {
    enable = true,
  },


    -- For dealing with bad auto indent in python files
    -- Should work according to the Reddit
    indent = {
        enable = true,
        disable = {"python"}
      },

   additional_vim_regex_highlighting = false,
}
