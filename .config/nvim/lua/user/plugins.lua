local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}
)

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here

  ---------------------
  -- Package Manager --
  ---------------------
  use 'wbthomason/packer.nvim' -- Have packer manage itself

  ----------------------
  -- Required plugins --
  ----------------------
  use('nvim-lua/plenary.nvim')

  -----------------
  -- Keymappings --
  -----------------
  use {
     "folke/which-key.nvim",
     config = function()
       require("user.plugins.whichkey").setup()
     end,
  }

  -------------------
  -- File Explorer --
  -------------------

  use {
   "kyazdani42/nvim-tree.lua",
   requires = {
     "kyazdani42/nvim-web-devicons",
   },
   cmd = { "NvimTreeToggle", "NvimTreeClose" },
   config = function()
     require("user.plugins.nvim-tree")
   end,
  }

  ----------------------------------------
  -- Theme, Icons, Statusbar, Bufferbar --
  ----------------------------------------

  use({
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup()
    end,
  })
  use({
    {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        require('user.plugins.lualine')
      end,
    },
    {
      'j-hui/fidget.nvim',
      after = 'lualine.nvim',
      config = function()
        require('fidget').setup()
      end,
    }
  })

  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim

  ------------------
  -- Colorschemes --
  ------------------
  
  use "RRethy/nvim-base16"
  use "nxvu699134/vn-night.nvim"
  use "titanzero/zephyrium"


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
