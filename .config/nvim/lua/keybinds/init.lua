-- Keybinds


-- Helper function
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- General
map("", "<C-S>", ":w<CR>")
map("", "<C-c>", '\"+y<CR>') -- it doesnt work with <C-S-c> for whatever reason
map("", "<leader>s", "!clear && shellcheck %<CR>")
map("", "<leader>t", ":filetype detect<CR>")

-- Directional
map("", "<leader>h", ":wincmd h<CR>", {nowait = true})
map("", "<leader>j", ":wincmd j<CR>")
map("", "<leader>k", ":wincmd k<CR>")
map("", "<leader>l", ":wincmd l<CR>")

-- Mode specific
map("n", "<C-\\>", ":vs<CR>:term<CR><S-a>")
map("t", "<ESC>", "<C-\\><C-n>")


-- Plugin binds

-- telescope
map("", "<C-p>", ":Telescope find_files<CR>", {silent = true})

-- trouble
map("", "<C-b>", ":TroubleToggle<CR>", {silent = true})

-- lsp
map("", "gr",        "<cmd>lua vim.lsp.buf.references()<CR>",       {silent = true})
map("", "gd",        "<cmd>lua vim.lsp.buf.definition()<CR>",       {silent = true})
map("", "gD",        "<cmd>lua vim.lsp.buf.declaration()<CR>",      {silent = true})
map("", "gi",        "<cmd>lua vim.lsp.buf.implementation()<CR>",   {silent = true})
map("", "gl",        "<cmd>lua vim.lsp.buf.code_action()<CR>",      {silent = true})
map("", "gc",        "<cmd>lua vim.lsp.buf.code_action()<CR>",      {silent = true})
map("", "gt",        "<cmd>lua vim.lsp.buf.type_definition()<CR>",  {silent = true})
map("", "<S-k>",     "<cmd>lua vim.lsp.buf.hover()<CR>",            {silent = true})
map("", "<C-k>",     "<cmd>lua vim.lsp.buf.signature_help()<CR>",   {silent = true})
map("", "<C-n>",     "<cmd>lua vim.diagnostic.goto_next()<CR>",     {silent = true})
map("", "<C-l>",     "<cmd>lua vim.diagnostic.goto_prev()<CR>",     {silent = true})
map("", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>",           {silent = true})
map("", "<F2>",      "<cmd>lua vim.lsp.buf.rename()<CR>",           {silent = true})
map("", "<C-A-l>",   "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",           {silent = true})

-- nvim tree
map("n", "<leader>e", ":NvimTreeToggle<CR>",   {silent = true})
map("n", "<leader>n", ":NvimTreeFindFile<CR>", {silent = true})
map("n", "<leader>s", ":NvimTreeRefresh<CR>",  {silent = true}) -- keybind might change

