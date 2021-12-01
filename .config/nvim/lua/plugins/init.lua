-- Plugins


vim.cmd "packadd paq-nvim"
local paq = require("paq-nvim").paq

-- paq manages itself 
paq {"savq/paq-nvim", opt = true}

-- lsp and treesitter
paq {"neovim/nvim-lspconfig"}
paq {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
paq {"glepnir/lspsaga.nvim"}
paq {"github/copilot.vim"}
paq {"onsails/lspkind-nvim"}
-- cmp
paq {"hrsh7th/cmp-nvim-lsp"}
paq {"hrsh7th/cmp-buffer"}
paq {"hrsh7th/cmp-path"}
paq {"hrsh7th/cmp-cmdline"}
paq {"hrsh7th/nvim-cmp"}
paq {"hrsh7th/cmp-vsnip"}
paq {"hrsh7th/vim-vsnip"}
paq {'golang/vscode-go'}
-- themes & visuals
paq {"kyazdani42/nvim-web-devicons"}
paq {"hoob3rt/lualine.nvim"}
paq {"navarasu/onedark.nvim"}
paq {"folke/trouble.nvim"}
paq {"folke/lsp-colors.nvim"}
paq {"nvim-lua/plenary.nvim"}
paq {"lukas-reineke/indent-blankline.nvim"}
paq {"kyazdani42/nvim-tree.lua"}
paq {"lewis6991/gitsigns.nvim"}
--paq {"akinsho/nvim-bufferline.lua"} -- disable tabs for now
-- telescope
paq {"nvim-lua/popup.nvim"}
paq {"nvim-lua/plenary.nvim"}
paq {"nvim-telescope/telescope.nvim"}
-- optimisation
paq {"lewis6991/impatient.nvim"}
paq {"nathom/filetype.nvim"}
paq {"dstein64/vim-startuptime"}
-- misc
paq {"windwp/nvim-autopairs"}
paq {"tpope/vim-sleuth"}
--paq {"fatih/vim-go"} -- You served me well, I"ll never forget you

-- Plugin-specific settings
require("plugins.misc")
require("plugins.cmp")
require("plugins.lsp")

