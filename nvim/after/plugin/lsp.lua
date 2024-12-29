-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add borders to floating windows
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = "single" }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = "single" }
)

vim.diagnostic.config({
    float = {
        border = 'single' -- or 'solid'
    }
})

--vim.diagnostic.config({
--    virtual_text = false,
--    severity_sort = true,
--    float = {
--        style = 'minimal',
--        border = 'rounded',
--        header = '',
--        prefix = '',
--    },
--    signs = {
--        text = {
--            [vim.diagnostic.severity.ERROR] = '✘',
--            [vim.diagnostic.severity.WARN] = '▲',
--            [vim.diagnostic.severity.HINT] = '⚑',
--            [vim.diagnostic.severity.INFO] = '»',
--        },
--    },
--})
-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server

local lsp = require('lspconfig').util.default_config
lsp.capabilities = vim.tbl_deep_extend(
    'force',
    lsp.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

local lspconfig = require("lspconfig")


-- Ensure the verible binaries are installed from chipsalliance/verible GitHub
require('lspconfig').verible.setup {
}

-- Mason config with ensure installed
require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { "ts_ls", 'eslint', 'lua_ls', 'tailwindcss',
        --    'clangd',
        --    --'pylsp',
        --    "pyright",
        --    'texlab',
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
})
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


vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<leader>da', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)

        vim.keymap.set({ 'n', 'x' }, "<leader>p", function()
            vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
        end, opts)

        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end,
})

lspconfig.pyright.setup({
    on_attach = lsp.on_attach,
    filetypes = { "python" },
})



local cmp = require('cmp')


cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
    mapping = {
        -- toggle completion menu
        ['<C-e>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.abort()
            else
                cmp.complete()
            end
        end),
        -- Confirm selection (use <CR> or <Tab> to confirm)
        --['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- Confirm selection (use <CR> or <Tab> to confirm)
        --['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        -- Navigate down in the completion menu
        ['<C-n>'] = cmp.mapping.select_next_item(),
    }
})

-- workaround to ingore rust_analyzer error of cancelled request
for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end
