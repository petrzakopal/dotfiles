local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({
        buffer = bufnr,
        --preserve_mappings = false
    })
end)


local lspconfig = require("lspconfig")

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())



-- Ensure the verible binaries are installed from chipsalliance/verible GitHub
require('lspconfig').verible.setup {
}

lsp.ensure_installed({ 'ts_ls', 'eslint', 'lua_ls', 'tailwindcss',
    'clangd',
    --'pylsp',
    "pyright",
    'texlab' })

require('lspconfig').clangd.setup {
    cmd = { 'clangd', '--background-index',
        --'--compile-commands-dir', '.',
        '--query-driver=/usr/bin/*' },
    --    init_options = {
    --        clangdFileStatus = true,
    --        clangdSemanticHighlighting = true
    --    },
    filetypes = { 'c', 'cpp', 'cxx', 'cc' },
    --   root_dir = function() vim.fn.getcwd() end,
    --   settings = {
    --       ['clangd'] = {
    --           ['compilationDatabasePath'] = 'obj_dir',
    --           ['fallbackFlags'] = {'-std=c++17'}
    --       }
    --   }
}


lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr }

    vim.keymap.set({ 'n', 'x' }, "<leader>p", function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)

    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


lspconfig.pyright.setup({
    on_attach = lsp.on_attach,
    filetypes = { "python" },
})


lsp.setup()



local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    }
})
