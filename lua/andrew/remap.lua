-- Set space as the leader key
vim.g.mapleader = " "

-- Open file explorer with space + pv
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected lines down in visual mode with J
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Move selected lines up in visual mode with K
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines without moving the cursor in normal mode with J
vim.keymap.set("n", "J", "mzJ`z")

-- Center screen after page-down in normal mode with Ctrl+d
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Center screen after page-up in normal mode with Ctrl+u
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center screen after searching and moving to next occurrence with n
vim.keymap.set("n", "n", "nzzzv")

-- Center screen after searching and moving to previous occurrence with N
vim.keymap.set("n", "N", "Nzzzv")

-- -- Start collaborative Vim session with space + vwm
-- vim.keymap.set("n", "<leader>vwm", function()
--     require("vim-with-me").StartVimWithMe()
-- end)

-- -- Stop collaborative Vim session with space + svwm
-- vim.keymap.set("n", "<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)

-- Paste over without yanking in visual mode with space + p
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to clipboard in normal and visual mode with space + y
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- Yank entire line to clipboard in normal mode with space + Y
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Paste from the system clipboard in normal mode with space + P
vim.keymap.set("n", "<leader>P", '"+p')

-- Delete without yanking in normal and visual mode with space + d
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Map Ctrl+c to escape in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable Ex mode with Q in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- Open tmux sessionizer with Ctrl+f in normal mode
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format buffer using LSP with space + f in normal mode
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Go to next error or warning with Ctrl+k in normal mode
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

-- Go to previous error or warning with Ctrl+j in normal mode
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Go to next location list item with space + k in normal mode
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

-- Go to previous location list item with space + j in normal mode
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Start search and replace for word under cursor with space + s in normal mode
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]])

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

-- Make the current file executable with space + x in normal mode
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- -- Open packer.lua config file with space + vpp in normal mode
-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");

-- -- Execute 'make_it_rain' command from CellularAutomaton with space + mr in normal mode
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Source the current buffer with double space in normal mode
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Go to the next usage of word
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
