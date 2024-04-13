-- define autogroup for auto formatting
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
-- local null_ls = require("null-ls")

-- define non-lsp mason sources
require("mason").setup()
require("mason-null-ls").setup({
	ensure_installed = {
		-- Opt to list sources here, when available in mason.
		-- python
        -- 'mypy',
        -- 'black',
		'ruff',
	},
	automatic_installation = false,
	handlers = {},
})
-- null_ls.setup({
-- 	sources = {
-- 		-- Anything not supported by mason.
-- 		null_ls.builtins.diagnostics.ruff,
-- 	},
-- 	-- auto-formatting
-- 	on_attach = function(client, bufnr)
-- 		if client.supports_method("textDocument/formatting") then
-- 			vim.api.nvim_clear_autocmds({
-- 				group = augroup,
-- 				buffer = bufnr,
-- 			})
--
-- 			vim.api.nvim_create_autocmd("BufWritePre", {
-- 				group = augroup,
-- 				buffer = bufnr,
-- 				callback = function()
-- 					vim.lsp.buf.format({ bufnr = bufnr })
-- 				end,
-- 			})
-- 		end
-- 	end
--
-- })
