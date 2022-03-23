local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer and restarting ..."
  vim.cmd [[packadd packer.nvim]]
end


-- Autocommand that reloads whenever plugins.lua saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Call packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Initialize Packer
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {border = "rounded" }
    end, 
  },
}

-- Plugin Here
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- often used as dependency
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  
  use 'vim-airline/vim-airline' -- Bottom status bar
  use 'tpope/vim-fugitive' -- Github things
  use 'folke/tokyonight.nvim' -- TokyoNight Themes 

  -- Completion
  use 'hrsh7th/cmp-path'  -- Main completion 
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lua' -- nvim config completion


  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- Lsp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer' -- builtin lsp wrapper
  
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters


  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'p00f/nvim-ts-rainbow' --raibow brackets
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter


  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/Telescope-media-files.nvim'

  -- Commenting
  use 'numToStr/Comment.nvim' -- Comment support
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  

  -- Nvim-tree 
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons' -- optional, for file icon
  
  -- Buffer line
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"


  -- use "lewis6991/gitsigns.nvim" -- gitsigns
  -- Automatically setup configuration after closing packer.nvim
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
