require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "bash", "javascript", "typescript", "html", "css", "csv", "json" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  -- Add the textobjects configuration here
  textobjects = {
      select = {
          enable = true,
          lookahead = true,
          keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              -- Add more keymaps as needed
          },
      },
      swap = {
          enable = true,
          swap_next = {
              ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
              ["<leader>A"] = "@parameter.inner",
          },
      },
      move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
              ["]m"] = "@function.outer",
              -- Add more keymaps as needed
          },
          goto_next_end = {
              ["]M"] = "@function.outer",
              -- Add more keymaps as needed
          },
      },
      lsp_interop = {
          enable = true,
          border = 'none',
          peek_definition_code = {
              ["<leader>df"] = "@function.outer",
              -- Add more keymaps as needed
          },
      },
  },
}