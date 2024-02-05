local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers 
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls', -- lua
        'pyright', -- python
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

-- lsp setup
-- lua
-- get rid of the undefined global vim error when writing config
require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'}
            }
        }
    }
})

-- python
require('lspconfig').pyright.setup({
    -- Callback function for when the language server attaches to a buffer
    on_attach = on_attach,
    settings = {
        pyright = {
            -- Enables automatic import completions, suggesting import statements for unrecognized symbols
            autoImportCompletion = true,
        },
        python = {
            analysis = {
                -- Automatically adds common search paths (like "src") for module resolution
                autoSearchPaths = true,
                -- Limits analysis and error reporting to only files that are currently open
                diagnosticMode = "openFilesOnly",
                -- Allows analysis of library code for type information in the absence of type stubs
                useLibraryCodeForTypes = true,
                -- Sets the type checking mode to 'off', disabling static type checking
                typeCheckingMode = "off"
            }
        }
    }
})
