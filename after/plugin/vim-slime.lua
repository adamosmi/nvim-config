vim.g.slime_target = 'tmux'
vim.g.slime_default_config = {
    socket_name = 'default',
    target_pane = '{last}'
}
vim.g.slime_bracketed_paste = 1
vim.g.slime_dont_ask_default = 1
vim.g.slime_preserve_curpos = 0

-- map space, enter to vim-slime, preserves the original keymap
vim.cmd('map <leader><CR> <C-c><C-c>')

