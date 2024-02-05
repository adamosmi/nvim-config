-- disable execute on save
vim.g.db_ui_execute_on_save = 0

-- For SQL files
vim.cmd('autocmd FileType sql nnoremap <buffer> <leader><CR> <Plug>(DBUI_ExecuteQuery)')
vim.cmd('autocmd FileType sql vnoremap <buffer> <leader><CR> <Plug>(DBUI_ExecuteQuery)')

-- For MySQL files
vim.cmd('autocmd FileType mysql nnoremap <buffer> <leader><CR> <Plug>(DBUI_ExecuteQuery)')
vim.cmd('autocmd FileType mysql vnoremap <buffer> <leader><CR> <Plug>(DBUI_ExecuteQuery)')

-- For PL/SQL files
vim.cmd('autocmd FileType plsql nnoremap <buffer> <leader><CR> <Plug>(DBUI_ExecuteQuery)')
vim.cmd('autocmd FileType plsql vnoremap <buffer> <leader><CR> <Plug>(DBUI_ExecuteQuery)')
