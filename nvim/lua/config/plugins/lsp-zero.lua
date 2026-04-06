return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/nvim-cmp' },
            { 'L3MON4D3/LuaSnip' },
            {
                'williamboman/mason.nvim',
                build = ':MasonUpdate',
            },
            { 'williamboman/mason-lspconfig.nvim' },
        },

        config = function()
            -- UI stuff
            vim.opt.signcolumn = 'yes'

            vim.lsp.handlers['textDocument/hover'] = vim.lsp.buf.hover(
                { border = "single" }
            )

            vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.buf.signature_help(
                { border = "single" }
            )

            vim.diagnostic.config({
                float = { border = 'rounded' }
            })

            -- Capabilities
            vim.lsp.config.capabilities = vim.tbl_deep_extend(
                'force',
                vim.lsp.config.capabilities or vim.lsp.protocol.make_client_capabilities(),
                require('blink.cmp').get_lsp_capabilities()
            )

            -- Mason
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = { 'eslint', 'lua_ls', 'tailwindcss' },
                automatic_installation = true,
                automatic_enable = {
                    exclude = { "ts_ls", "clangd" }
                },
            })

            -- Tailwind
            vim.lsp.config("tailwindcss", {
                capabilities = vim.lsp.config.capabilities,
                settings = {
                    tailwindCSS = {
                        filetypes = {
                            "css", "scss", "sass", "html", "heex", "elixir",
                            "javascript", "javascriptreact",
                            "typescript", "typescriptreact", "svelte",
                        },
                    }
                }
            })

            -- TS
            vim.lsp.config("ts_ls", {
                capabilities = vim.lsp.config.capabilities,
                init_options = {
                    preferences = {
                        preferTypeOnlyAutoImports = true,
                        importModuleSpecifierPreference = 'non-relative',
                        importModuleSpecifierEnding = 'minimal',
                    },
                },
            })
            vim.lsp.enable({ "ts_ls" })

            -- Clangd
            vim.lsp.config("clangd", {
                cmd = { 'clangd', '--background-index', '--query-driver=/usr/bin/*' },
                filetypes = { 'c', 'cpp', 'cxx', 'cc' },
            })
            vim.lsp.enable({ "clangd" })

            -- Pyright
            vim.lsp.config("pyright", {
                filetypes = { "python" },
            })

            -- Keymaps
            vim.api.nvim_create_autocmd('LspAttach', {
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
                end,
            })

            -- workaround to ingore rust_analyzer error of cancelled request
            for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
                local default = vim.lsp.handlers[method]
                vim.lsp.handlers[method] = function(err, result, context, config)
                    if err and err.code == -32802 then return end
                    return default(err, result, context, config)
                end
            end
        end,
    }
}
