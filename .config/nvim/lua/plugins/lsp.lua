-- lsp


local lsp = require("lspconfig")

-- Go's language server
lsp.gopls.setup{
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            }   
        },
        staticcheck = true,
    }
}

-- Helper function to run goimports on save. Not part of lsp
function OrgImports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end

-- Using lua tell vimscript to call the lua function with timeout of 1000 ms
vim.api.nvim_command("autocmd BufWritePre *.go lua OrgImports(1000)")
vim.api.nvim_command("autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)")

-- Python language server
lsp.pyright.setup{}

-- TS language server. Works w/ JS & React too
lsp.tsserver.setup{}

-- C/Cpp language server. This is clang LS, but should work pretty well with gcc
lsp.clangd.setup{}

-- Java language server
lsp.jdtls.setup {
    cmd = { 'jdtls' },
    root_dir = function(fname)
        return require'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
    end
}
--lsp.jdtls.setup{}

