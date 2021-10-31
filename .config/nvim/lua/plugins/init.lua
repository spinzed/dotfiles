-- Plugins


vim.cmd "packadd paq-nvim"
local paq = require("paq-nvim").paq

-- paq manages itself 
paq {"savq/paq-nvim", opt = true}

-- treesitter and lsp
paq {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
paq {"neovim/nvim-lspconfig"}
paq {"hrsh7th/nvim-compe"}
paq {"glepnir/lspsaga.nvim"}
-- themes & visuals
paq {"kyazdani42/nvim-web-devicons"}
paq {"hoob3rt/lualine.nvim"}
paq {"navarasu/onedark.nvim"}
paq {"folke/trouble.nvim"}
paq {"folke/lsp-colors.nvim"}
paq {'nvim-lua/plenary.nvim'}
paq {"lukas-reineke/indent-blankline.nvim"}
paq {'kyazdani42/nvim-tree.lua'}
paq {'lewis6991/gitsigns.nvim'}
--paq {"akinsho/nvim-bufferline.lua"} -- disable tabs for now
-- telescope
paq {"nvim-lua/popup.nvim"}
paq {"nvim-lua/plenary.nvim"}
paq {"nvim-telescope/telescope.nvim"}
-- misc
paq {"windwp/nvim-autopairs"}
paq {"sophacles/vim-processing"}
--paq {"fatih/vim-go"} -- You served me well, I'll never forget you

-- Plugin-specific settings
require("plugins.misc")
require("plugins.compe")
require("plugins.lsp")

