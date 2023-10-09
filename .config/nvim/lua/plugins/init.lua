-- Plugins


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- lsp and treesitter
  "neovim/nvim-lspconfig",
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  "github/copilot.vim",
  "onsails/lspkind-nvim",
  "ray-x/lsp_signature.nvim",
  -- cmp
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "golang/vscode-go",
  -- themes & visuals
  "hoob3rt/lualine.nvim",
  "navarasu/onedark.nvim",
  "folke/trouble.nvim",
  "folke/lsp-colors.nvim",
  "lukas-reineke/indent-blankline.nvim",
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  "lewis6991/gitsigns.nvim",
  "akinsho/bufferline.nvim",
  {
     "m4xshen/hardtime.nvim",
     dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
     opts = {},
     cond = false,
  },
  -- telescope
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  -- optimization
  -- "nathom/filetype.nvim"
  "dstein64/vim-startuptime",
  -- misc
  "windwp/nvim-autopairs",
  "tpope/vim-sleuth",
  {"akinsho/flutter-tools.nvim", dependencies = { "nvim-lua/plenary.nvim" }},
})

-- Plugin-specific settings
require("plugins.lsp")
require("plugins.cmp")
require("plugins.misc")

