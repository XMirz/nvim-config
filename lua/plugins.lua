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

  use 'vim-airline/vim-airline' -- Bottom status bar
  use 'tpope/vim-vinegar' 
  use 'tpope/vim-fugitive' -- Github things
  use 'folke/tokyonight.nvim' -- TokyoNight Themes 
  -- Automatically setup configuration after closing packer.nvim
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
