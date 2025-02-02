require("tokyonight").setup({
    transparent = true,
    styles = {
        -- Disable background for all syntax elements
        comments = { bg = "NONE" },
        keywords = { bg = "NONE" },
        functions = { bg = "NONE", bold = true },
        variables = { bg = "NONE" },
        strings = { bg = "NONE" },
        numbers = { bg = "NONE" },
        constants = { bg = "NONE" },
        operators = { bg = "NONE" },
        types = { bg = "NONE" },
        sidebars = "transparent",
        floats = "transparent",
    },
    on_highlights = function(hl, colors)
        -- Remove background from ALL highlight groups
       -- for group, settings in pairs(hl) do
       --     if type(settings) == "table" then
       --         settings.bg = "NONE"
       --     end
       -- end

        hl.Comment = { bg = "NONE", fg = colors.comment }
        hl.Keyword = { bg = "NONE", fg = colors.keyword }
        hl.Function = { bg = "NONE", fg = colors.func, bold = true }
        hl.Variable = { bg = "NONE", fg = colors.fg }
        hl.String = { bg = "NONE", fg = colors.string }
        hl.Number = { bg = "NONE", fg = colors.number }
        hl.Boolean = { bg = "NONE", fg = colors.orange }
        hl.Operator = { bg = "NONE", fg = colors.blue5 }

        -- TypeScript/JavaScript specific
        hl.TSKeyword = { bg = "NONE", fg = colors.keyword }
        hl.TSKeywordFunction = { bg = "NONE", fg = colors.keyword, bold = true }
        hl.TSKeywordReturn = { bg = "NONE", fg = colors.keyword }
        hl.TSKeywordOperator = { bg = "NONE", fg = colors.keyword }
        hl.TSConstant = { bg = "NONE", fg = colors.purple }
        hl.TSVariable = { bg = "NONE", fg = colors.fg }
        hl.TSParameter = { bg = "NONE", fg = colors.red }
        hl.TSConstructor = { bg = "NONE", fg = colors.blue1 }
        hl.TSType = { bg = "NONE", fg = colors.blue1 }
        hl.TSConditional = { bg = "NONE", fg = colors.keyword }
        hl.TSRepeat = { bg = "NONE", fg = colors.keyword }
        hl.TSLabel = { bg = "NONE", fg = colors.keyword }
        
        -- TreeSitter specific groups
        hl["@keyword"] = { bg = "NONE", fg = colors.keyword }
        hl["@keyword.function"] = { bg = "NONE", fg = colors.keyword, bold = true }
        hl["@keyword.return"] = { bg = "NONE", fg = colors.keyword }
        hl["@keyword.operator"] = { bg = "NONE", fg = colors.keyword }
        hl["@constant"] = { bg = "NONE", fg = colors.purple }
        hl["@constant.builtin"] = { bg = "NONE", fg = colors.purple }
        hl["@variable"] = { bg = "NONE", fg = colors.fg }
        hl["@constructor"] = { bg = "NONE", fg = colors.blue1 }
        hl["@type"] = { bg = "NONE", fg = colors.blue1 }
        
        -- Keep selection highlights only
        hl.Visual = { bg = colors.bg_visual }
        hl.Search = { bg = colors.bg_search, fg = colors.fg }
        hl.IncSearch = { bg = colors.orange, fg = colors.black }

        hl.TelescopeSelection = { bg = colors.bg_visual, fg = colors.fg }
        hl.TelescopeSelectionCaret = { bg = colors.bg_visual, fg = colors.blue }
        hl.TelescopeMultiSelection = { bg = colors.bg_visual, fg = colors.fg }
        hl.TelescopeNormal = { bg = "NONE", fg = colors.fg }
        hl.TelescopeBorder = { bg = "NONE", fg = colors.blue0 }
        hl.TelescopePromptBorder = { bg = "NONE", fg = colors.blue0 }
        hl.TelescopeResultsBorder = { bg = "NONE", fg = colors.blue0 }
        hl.TelescopePreviewBorder = { bg = "NONE", fg = colors.blue0 }
        hl.TelescopeMatching = { bg = "NONE", fg = colors.teal }
        hl.TelescopePromptPrefix = { bg = "NONE", fg = colors.blue }
    end,
})

vim.cmd("colorscheme tokyonight-night")
 
