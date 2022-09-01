-- misc


-- copilot
vim.b.copilot_enabled = 0

-- treesitter
require("nvim-treesitter.configs").setup{
    ensure_installed = "all",
    highlight = {enable = true}
}

-- lsp_signature
require("lsp_signature").setup({
    floating_window = true,
    handler_opts = {
        border = "none"
    },
})

-- trouble -- vscode like error showing
require("trouble").setup{}

-- lualine
require("lualine").setup{}

-- lsp-colors
require("lsp-colors").setup({
    Error = "#db4b4b",
    Warning = "#e0af68",
    Information = "#0db9d7",
    Hint = "#10B981"
})

-- gitsigns
require("gitsigns").setup{}

-- autopairs
require("nvim-autopairs").setup{}

-- This is your opts table
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")

