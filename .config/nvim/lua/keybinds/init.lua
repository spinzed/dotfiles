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
map("", "<leader>h", ":wincmd h<CR>")
map("", "<leader>j", ":wincmd j<CR>")
map("", "<leader>k", ":wincmd k<CR>")
map("", "<leader>l", ":wincmd l<CR>")

-- Mode specific
map("n", "<C-\\>", ":vs<CR>:term<CR><S-a>")
map("t", "<ESC>", "<C-\\><C-n>")


-- Plugin binds

-- telescope
map("", "<C-p>", ":Telescope find_files<CR>")

-- trouble
map("", "<C-m>", ":TroubleToggle<CR>", {silent = true})

-- lsp
map("", "gd",        "<cmd>lua vim.lsp.buf.definition()<CR>",       {silent = true})
map("", "gr",        "<cmd>lua vim.lsp.buf.references()<CR>",       {silent = true})
map("", "gD",        "<cmd>lua vim.lsp.buf.declaration()<CR>",      {silent = true})
map("", "gi",        "<cmd>lua vim.lsp.buf.implementation()<CR>",   {silent = true})
--map("", "<S-K>",     "<cmd>lua vim.lsp.buf.hover()<CR>",            {silent = true})
--map("", "<C-k>",     "<cmd>lua vim.lsp.buf.signature_help()<CR>",   {silent = true})
--map("", "<C-n>",     "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {silent = true})
--map("", "<C-l>",     "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {silent = true})
--map("", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>",           {silent = true})
--map("", "<F2>",      "<cmd>lua vim.lsp.buf.rename()<CR>",           {silent = true})
--map("", "<leader>c", "<cmd>lua vim.lsp.buf.code_action()<CR>",      {silent = true})
map("", "<leader>t", "<cmd>lua vim.lsp.buf.type_definition()<CR>",  {silent = true})

-- lspsaga
map("", "gh",        "<cmd>lua require('lspsaga.provider').lsp_finder()<CR>",                 {silent = true}) -- or :Lspsaga lsp_finder
map("", "ca",        "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",              {silent = true}) -- or :Lspsaga code_action
map("", "ca",        ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>",       {silent = true}) -- or :Lspsaga range_code_action
map("", "gs",        "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",        {silent = true}) -- or :Lspsaga signature_help
map("", "gr",        "<cmd>lua require('lspsaga.rename').rename()<CR>",                       {silent = true}) -- or :Lspsaga rename
map("", "<F2>",      "<cmd>lua require('lspsaga.rename').rename()<CR>",                       {silent = true}) -- or :Lspsaga rename
map("", "<leader>d", "<cmd>lua require('lspsaga.provider').preview_definition()<CR>",         {silent = true}) -- or :Lspsaga preview_definition
map("", "<S-K>",     "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>",              {silent = true}) -- or :Lspsaga hover_doc
map("", "<C-n>",     "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>", {silent = true}) -- or :Lspsaga diagnostic_jump_next
map("", "<C-l>",     "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>", {silent = true}) -- or :Lspsaga diagnostic_jump_previous
map("", "<C-J>",     "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",      {silent = true})
map("", "<C-K>",     "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",     {silent = true})

-- compe
map("i", "<C-Space>", "compe#complete()",              {silent = true, expr = true})
map("i", "<C-e>",     "compe#close('<C-e>')",          {silent = true, expr = true})
map("i", "<CR>",      "compe#confirm('<CR>')",         {silent = true, expr = true})
map("i", "<C-f>",     "compe#scroll({ 'delta': +4 })", {silent = true, expr = true})
map("i", "<C-d>",     "compe#scroll({ 'delta': -4 })", {silent = true, expr = true})
map("i", "<C-j>",     "v:lua.tab_complete()",          {expr = true})
map("i", "<C-k>",     "v:lua.s_tab_complete()",        {expr = true})
map("i", "<Tab>",     "v:lua.tab_complete()",          {expr = true})
map("i", "<S-Tab>",   "v:lua.s_tab_complete()",        {expr = true})
map("s", "<Tab>",     "v:lua.tab_complete()",          {expr = true})
map("s", "<S-Tab>",   "v:lua.s_tab_complete()",        {expr = true})

-- nvim tree
map("n", "<leader>e", ":NvimTreeToggle<CR>",   {silent = true})
map("n", "<leader>n", ":NvimTreeFindFile<CR>", {silent = true})
map("n", "<leader>s", ":NvimTreeRefresh<CR>",  {silent = true}) -- keybind might change

