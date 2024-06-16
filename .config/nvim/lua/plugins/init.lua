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
  {
    "neovim/nvim-lspconfig",
    --config = {},
    --opts = {
    --  inlay_hints = {
    --    enabled = true,
    --  },
    --},
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  "github/copilot.vim",
  "onsails/lspkind-nvim",
  { "ray-x/lsp_signature.nvim", event = "VeryLazy", opts = {}, config = function(_, opts) require'lsp_signature'.setup(opts) end },
  -- cmp
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  -- themes & visuals
  "hoob3rt/lualine.nvim",
  "folke/trouble.nvim",
  "folke/lsp-colors.nvim",
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
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
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here
    end
  },
})

-- Plugin-specific settings
require("plugins.lsp")
require("plugins.cmp")
require("plugins.misc")

