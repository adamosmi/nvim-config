local cmp = require('cmp')

-- Add autocompletion
-- autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"sql", "mysql", "plsql"},
    callback = function()
        cmp.setup.buffer {
            sources = {
                { name = 'vim-dadbod-completion' }
            }
        }
    end,
})
