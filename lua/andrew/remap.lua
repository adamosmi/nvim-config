-- Set space as the leader key
vim.g.mapleader = " "

-- Move selected lines down in visual mode with J
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Move selected lines up in visual mode with K
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center screen after page-down in normal mode with Ctrl+d
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Center screen after page-up in normal mode with Ctrl+u
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center screen after searching and moving to next occurrence with n
vim.keymap.set("n", "n", "nzzzv")

-- Center screen after searching and moving to previous occurrence with N
vim.keymap.set("n", "N", "Nzzzv")

-- Yank to clipboard in normal and visual mode with space + y
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- Yank entire line to clipboard in normal mode with space + Y
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Paste from the system clipboard in normal mode with space + P
vim.keymap.set("n", "<leader>p", '"+p')

-- Paste over without yanking in visual mode with space + p
vim.keymap.set("x", "<leader>P", [["_dP]])

-- Delete without yanking in normal and visual mode with space + d
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Start search and replace for word under cursor with space + s in normal mode
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]])

-- Make the current file executable with space + x in normal mode
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Start search and replace for visually selected text
function SubstituteVisualSelectionDrop()
    -- Yank the visually selected text into the search register
    vim.cmd('normal! gv"xy')

    -- Substitute command with the placeholder for the replacement text
    local cmd = ':%s/' .. vim.fn.escape(vim.fn.getreg('x'), '/') .. '//gc'
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(cmd, true, false, true), 'n', false)

    -- Move the cursor to the replacement field
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Left><Left><Left>', true, false, true), 'n', false)
end
vim.api.nvim_set_keymap('v', '<leader>sd', ':lua SubstituteVisualSelectionDrop()<CR>', { noremap = true, silent = true })

-- Start search and replace for visually selected text
function SubstituteVisualSelectionKeep()
    -- Yank the visually selected text into the search register
    vim.cmd('normal! gv"xy')

    -- Substitute command with the placeholder for the replacement text
    local cmd = ':%s/' .. vim.fn.escape(vim.fn.getreg('x'), '/') .. '/' .. vim.fn.escape(vim.fn.getreg('x'), '/') .. '/gc'
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(cmd, true, false, true), 'n', false)

    -- Move the cursor to the replacement field
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Left><Left><Left>', true, false, true), 'n', false)
end
vim.api.nvim_set_keymap('v', '<leader>s', ':lua SubstituteVisualSelectionKeep()<CR>', { noremap = true, silent = true })

-- Yank current filepath
vim.api.nvim_set_keymap('n', '<leader>yp', '<cmd>let @+=expand("%:p")<CR>', {noremap = true, silent = true})

-- Add current date in %Y_%m_%d format
vim.keymap.set("n", "<leader>t", [[<cmd>exe "normal i" . strftime('%Y_%m_%d')<CR>]]) 

-- Toggle spell checking
vim.keymap.set('n', '<leader>c', function() vim.opt.spell = not vim.opt.spell:get() end, {noremap = true, silent = true, desc = "Toggle spell checking"})
-- ]s to next misspelled word
-- [s to previous misspelled word
-- zg adds word under cursor to dictionary

