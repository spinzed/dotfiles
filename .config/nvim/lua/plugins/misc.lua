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

-- bufferline
--require("bufferline").setup{} -- disabled for now

-- gitsigns
require("gitsigns").setup{}

-- autopairs
require("nvim-autopairs").setup{}

