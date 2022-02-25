-- Plugins


vim.cmd "packadd packer.nvim"

require("packer").startup(function()
    use "wbthomason/packer.nvim"

    -- lsp and treesitter
    use "neovim/nvim-lspconfig"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "github/copilot.vim"
    use "onsails/lspkind-nvim"
    use "ray-x/lsp_signature.nvim"
    -- cmp
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
    use 'golang/vscode-go'
    -- themes & visuals
    use "kyazdani42/nvim-web-devicons"
    use "hoob3rt/lualine.nvim"
    use "navarasu/onedark.nvim"
    use "folke/trouble.nvim"
    use "folke/lsp-colors.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "kyazdani42/nvim-tree.lua"
    use "lewis6991/gitsigns.nvim"
    --use "akinsho/nvim-bufferline.lua" -- disable tabs for now
    -- telescope
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    -- optimization
    use "lewis6991/impatient.nvim"
    use "nathom/filetype.nvim"
    use "dstein64/vim-startuptime"
    -- misc
    use "windwp/nvim-autopairs"
    use "tpope/vim-sleuth"
    use 'mfussenegger/nvim-jdtls'
end)

-- Plugin-specific settings
require("plugins.lsp")
require("plugins.cmp")
require("plugins.misc")
require("plugins.jdtls")

