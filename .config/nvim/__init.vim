"
" .vimrc/init.vim
"



" Plugins

call plug#begin('~/.vim/plugged')

" treesitter & lsp
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig',  { 'do': ':TSUpdate' }
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'

" themes
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" rest
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()



" General
syntax on
let mapleader=" "
set encoding=utf-8
set wildmode=longest,list,full
set noerrorbells
set splitbelow splitright
set number
set nowrap
set showcmd " show currently inputed letters in normal mode
set incsearch " improved search mode (alias ic)
set ignorecase " same as set ic, ignores case on search except if an uppercase letter is passed
set nohlsearch " remove search highlighting
set smartcase " search ignores case if everything is lowercase
set noswapfile " disable swapfiles (looking for replacement)

" Tabs and indenting
set tabstop=4 softtabstop=4 " tab and space indent width
set shiftwidth=4 " indent on newline
set expandtab " convert tabs to spaces
set autoindent " apparently, smartindent is a no-no
filetype plugin indent on

" Indenting exception for js/ts
autocmd Filetype javascript,typescript setlocal
    \ tabstop=2 softtabstop=2
    \ shiftwidth=2



" Setup the language servers

lua << EOF
    require'lspconfig'.gopls.setup{}
EOF



" Compe settings

lua << EOF
    require'compe'.setup {
      enabled = true;
      autocomplete = true;
      debug = false;
      min_length = 1;
      preselect = 'enable';
      throttle_time = 80;
      source_timeout = 200;
      incomplete_delay = 400;
      max_abbr_width = 100;
      max_kind_width = 100;
      max_menu_width = 100;
      documentation = true;

      source = {
        path = true;
        nvim_lsp = true;
      };
    }

    local t = function(str)
      return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_back_space = function()
        local col = vim.fn.col('.') - 1
        if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            return true
        else
            return false
        end
    end

    -- Use (s-)tab to:
    --- move to prev/next item in completion menuone
    --- jump to prev/next snippet's placeholder
    _G.tab_complete = function()
      if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
      elseif check_back_space() then
        return t "<Tab>"
      else
        return vim.fn['compe#complete']()
      end
    end
    _G.s_tab_complete = function()
      if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
      else
        return t "<S-Tab>"
      end
    end

    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF



lua << EOF
    local saga = require 'lspsaga'

    saga.init_lsp_saga()
EOF



" Plugin settings

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
let g:netrw_preview = 1
let g:netrw_list_hide= '.git'

" vim-go
let g:go_fmt_autosave = 1
let g:go_fmt_command = 'gopls' " the default, other option are gofmt and goimports

let g:go_rename_command = 'gopls'
let g:go_gopls_staticcheck = 1


let g:go_metalinter_command = 'golangci-lint'
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['gosimple', 'staticcheck', 'typecheck', 'unused', 'varcheck']
let g:go_metalinter_autosave_enabled = ['gosimple', 'staticcheck', 'typecheck', 'unused', 'varcheck']

let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
"let g:go_highlight_function_parameters = 1
let g:go_highlight_operators = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_build_constraints = 1



" Coloring and syntax highlighting
set colorcolumn=100
colorscheme onedark
highlight Normal ctermbg=NONE guibg=NONE " remove background color to match terminal's
hi Comment ctermfg=cyan



" Autocommands

fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
endfun

"autocmd BufWritePre * call StripTrailingWhitespace()

autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)



" Custom binds

noremap <C-S> :w<CR>
noremap <leader>s !clear && shellcheck %<CR>
noremap <leader>h :wincmd h<CR>
noremap <leader>j :wincmd j<CR>
noremap <leader>k :wincmd k<CR>
noremap <leader>l :wincmd l<CR>
noremap <leader>e :Lexplore<CR>
noremap <leader>t :filetype detect<CR> " refresh file type
nnoremap <C-\> :vs<CR>:term<CR><S-a>
vnoremap <C-c> "+y<CR>
tnoremap <ESC> <C-\><C-n>


" Plugin binds

" telescope
nnoremap <C-p> :Telescope find_files<CR>

" lsp config
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" compe config
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" vim-go
noremap <leader>g :GoDecls<CR>
noremap <leader><s-g> :GoDeclsDir<CR>



" refresh config
if !exists(":Ref") " check if ref exists, make it refresh the buffer's .vimrc
    command Ref source ~/.config/nvim/init.vim
endif


" Temporary cheat sheet
" :args *.type - load all files as buffers
" :argdo :normal gg - execute combination in all buffers
" bd - close all buffers and leave empty one

