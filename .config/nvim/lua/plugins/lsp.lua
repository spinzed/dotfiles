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
-- It doesn't work properly if the go module is not initilized properly
function goimports(timeout_ms)
    --local context = { only = { "source.organizeImports" } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else
      vim.lsp.buf.execute_command(action)
    end
end

-- Using lua tell vimscript to call the lua function with timeout of 1000 ms
vim.api.nvim_command("autocmd BufWritePre *.go lua goimports(500)")
vim.api.nvim_command("autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)")

-- Python's language server
lsp.pyright.setup{}

-- TS language server. Works w/ JS & React too
lsp.tsserver.setup{}

-- C/Cpp language server. This is clang LS, but should work pretty well with gcc
lsp.clangd.setup{}

