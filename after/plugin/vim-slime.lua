vim.g.slime_target = 'tmux'
vim.g.slime_default_config = {
    socket_name = 'default',
    target_pane = '{last}'
}
vim.g.slime_bracketed_paste = 1
vim.g.slime_dont_ask_default = 1

-- Altertnative remapping: vim.cmd('xmap <leader><CR> <Plug>SlimeRegionSend')
function SlimeSendReselect()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':', true, false, true), 'n', false)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('SlimeSend', true, false, true), 'n', false)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, false, true), 'n', false)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('gv', true, false, true), 'n', false)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
end
vim.keymap.set("v", "<leader><CR>", "<cmd>lua SlimeSendReselect()<CR>")



