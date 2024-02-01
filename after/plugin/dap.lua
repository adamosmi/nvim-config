-- debugging config
-- python
-- path
local python_path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
require("dap-python").setup(python_path)
--ui
local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

-- Keybindings for DAP
local opts = { noremap = true, silent = true }

-- Start/Continue Debugging
vim.keymap.set('n', '<F5>', function() require'dap'.continue() end, opts)
-- Step Over
vim.keymap.set('n', '<F10>', function() require'dap'.step_over() end, opts)
-- Step Into
vim.keymap.set('n', '<F11>', function() require'dap'.step_into() end, opts)
-- Step Out
vim.keymap.set('n', '<S-F11>', function() require'dap'.step_out() end, opts)
-- Toggle Breakpoint
vim.keymap.set('n', '<F9>', function() require'dap'.toggle_breakpoint() end, opts)
-- Add Conditional Breakpoint
vim.keymap.set('n', '<C-F9>', function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, opts)
-- Restart Debugging
vim.keymap.set('n', '<S-F5>', function() require'dap'.restart() end, opts)
-- Stop Debugging
vim.keymap.set('n', '<F6>', function() require'dap'.disconnect(); require'dap'.close(); require'dapui'.close() end, opts)
-- Open DAP UI
vim.keymap.set('n', '<leader>t', function() require'dapui'.toggle() end, opts)




