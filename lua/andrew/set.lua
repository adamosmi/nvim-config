-- Disable GUI cursor style changes for consistent cursor appearance across different modes.
vim.opt.guicursor = ""

-- Enable line numbers to make navigation and referencing lines easier.
vim.opt.nu = true
-- Display line numbers relative to the current line for easier relative movement commands.
vim.opt.relativenumber = true

-- Set tabstop to 4 for alignment purposes, common standard in many coding styles.
vim.opt.tabstop = 4
-- Soft tabstop at 4 to make tabs behave as 4 spaces, ensuring consistency with tabstop setting.
vim.opt.softtabstop = 4
-- Shiftwidth of 4 ensures consistent indentation levels, matching common coding standards.
vim.opt.shiftwidth = 4
-- Convert tabs to spaces to avoid problems with tab characters in different environments.
vim.opt.expandtab = true

-- Enable smart indentation for automatic indentation adjustments, useful for coding.
vim.opt.smartindent = true

-- Disable line wrapping to avoid visual clutter with long lines.
vim.opt.wrap = false

-- Disable swapfile to avoid clutter and potential privacy issues with sensitive data in swap.
vim.opt.swapfile = false
-- Disable backups to avoid unnecessary file clutter (ensure alternative backup methods).
vim.opt.backup = false
-- Set undo directory for storing undo history, useful for persistent undo functionality.
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- Enable persistent undo for recovering previous states even after closing and reopening files.
vim.opt.undofile = true

-- Disable search highlighting to avoid screen clutter after searches.
vim.opt.hlsearch = false
-- Enable incremental search for immediate feedback while typing search patterns.
vim.opt.incsearch = true

-- Enable true color support for better color display capabilities in the terminal.
vim.opt.termguicolors = true

-- Set scrolloff to 8 for better context visibility around the cursor.
vim.opt.scrolloff = 8
-- Always show sign column to avoid shifting text when signs are displayed.
vim.opt.signcolumn = "yes"
-- Append special characters to 'isfname' for more flexible file name recognition.
vim.opt.isfname:append("@-@")

-- Reduce updatetime for faster response to events like showing the completion menu.
vim.opt.updatetime = 50

-- Set colorcolumn to 80 to provide a visual guideline for line length, promoting readability.
vim.opt.colorcolumn = "80"

