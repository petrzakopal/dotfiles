return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', build = ':MasonUpdate' },
            { 'williamboman/mason-lspconfig.nvim' },
        },

        config = function()
            -- ========================
            -- UI
            -- ========================
            vim.opt.signcolumn = 'yes'

            vim.lsp.handlers['textDocument/hover'] =
                vim.lsp.buf.hover({ border = "single" })

            vim.lsp.handlers['textDocument/signatureHelp'] =
                vim.lsp.buf.signature_help({ border = "single" })

            vim.diagnostic.config({
                float = { border = 'rounded' }
            })

            -- ========================
            -- Capabilities (blink.cmp)
            -- ========================
            local capabilities = vim.tbl_deep_extend(
                'force',
                vim.lsp.protocol.make_client_capabilities(),
                require('blink.cmp').get_lsp_capabilities()
            )

            -- ========================
            -- Mason
            -- ========================
            require('mason').setup()

            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'eslint', 'tailwindcss' },
                automatic_installation = true,
            })

            -- ========================
            -- LSP Servers
            -- ========================

            -- Lua
            vim.lsp.config('lua_ls', {
                capabilities = capabilities,
            })

            -- ESLint
            vim.lsp.config('eslint', {
                capabilities = capabilities,
            })

            -- Python
            vim.lsp.config('pyright', {
                capabilities = capabilities,
                filetypes = { "python" },
            })

            -- Tailwind
            vim.lsp.config("tailwindcss", {
                capabilities = capabilities,
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

            -- TypeScript
            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
                init_options = {
                    preferences = {
                        preferTypeOnlyAutoImports = true,
                        importModuleSpecifierPreference = 'non-relative',
                        importModuleSpecifierEnding = 'minimal',
                    },
                },
            })

            -- C / C++
            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = { 'clangd', '--background-index', '--query-driver=/usr/bin/*' },
                filetypes = { 'c', 'cpp', 'cxx', 'cc' },
            })

            -- ========================
            -- Enable servers
            -- ========================
            vim.lsp.enable({
                "lua_ls",
                "eslint",
                "tailwindcss",
                "pyright",
                "ts_ls",
                "clangd",
            })

            -- ========================
            -- Keymaps
            -- ========================
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)

                    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)

                    vim.keymap.set({ 'n', 'x' }, '<F3>', function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)

                    vim.keymap.set('n', '<leader>da', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)

                    vim.keymap.set({ 'n', 'x' }, "<leader>p", function()
                        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
                    end, opts)

                    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
                end,
            })

            -- ========================
            -- rust_analyzer workaround
            -- ========================
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
