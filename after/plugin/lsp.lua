local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers 
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls', 'pyright'},
  handlers = {
    lsp_zero.default_setup,
  },
})

-- get rid of the undefined global vim error when writing config
require('lspconfig')['lua_ls'].setup {
   settings = {
      Lua = {
         diagnostics = {
            globals = {'vim'}
         }
      }
   }
}

