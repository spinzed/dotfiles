-- misc


-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 20
vim.g.netrw_preview = 1
vim.g.netrw_list_hide= ".git"

-- vim-go
vim.g.go_fmt_autosave = 1
vim.g.go_fmt_command = "gopls" -- the default, other option are gofmt and goimports

vim.g.go_rename_command = "gopls" -- vim.g.go_gopls_staticcheck = v:null vim.g.go_gopls_staticcheck = 1
vim.g.go_metalinter_command = "golangci-lint"
vim.g.go_metalinter_autosave = 1
vim.g.go_metalinter_enabled = {"gosimple", "staticcheck", "typecheck", "unused", "varcheck"}
vim.g.go_metalinter_autosave_enabled = {"gosimple", "staticcheck", "typecheck", "unused", "varcheck"}

-- treesitter
require("nvim-treesitter.configs").setup{
    ensure_installed = "maintained",
    highlight = {enable = true}
}

-- lsp-saga - fancy windows for lsp things
require("lspsaga").init_lsp_saga{}

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

