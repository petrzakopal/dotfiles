require("tokyonight").setup({
    styles = {
   },
    on_highlights = function(hl, colors)
        hl.comment = { bg = "NONE", fg = colors.comment }
        hl.perlComment = { bg = "NONE", fg = colors.comment }
        hl.Comment = { bg = "NONE", fg = colors.comment }
    end,
})
