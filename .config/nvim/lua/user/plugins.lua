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
    ------------
    -- Packer --
    ------------
    use 'wbthomason/packer.nvim'

    ----------------------------
    -- Statusline, Bufferline --
    ----------------------------
    use({
      {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      },
      {
        'j-hui/fidget.nvim',
        after = 'lualine.nvim',
        config = function()
          require('fidget').setup()
        end,
      }
    }) -- Statusline
    use 'romgrk/barbar.nvim' -- Bufferline

    ---------------
    -- Utilities --
    ---------------
    use 'nvim-lua/plenary.nvim' -- Common utilities
    use 'kyazdani42/nvim-web-devicons' -- File icons
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'terrortylor/nvim-comment'
    use 'norcalli/nvim-colorizer.lua'
    use 'folke/zen-mode.nvim'
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "rcarriga/nvim-notify" -- Notification manager  

    ----------------
    -- Completion --
    ----------------
    use 'hrsh7th/nvim-cmp' -- Completion
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP

    ---------
    -- LSP --
    ---------
    use {
      'neovim/nvim-lspconfig',
      config = function()
         require("user.plugins.lspconfig")
      end,
    } -- LSP
    use 'williamboman/mason.nvim' -- LSP Installer
    use 'williamboman/mason-lspconfig.nvim'
    use {
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        require('user.plugins.null-ls')
      end,
    } -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use {
      'glepnir/lspsaga.nvim',
      config = function ()
        require('user.plugins.lspsaga')
      end,
    } -- LSP UIs
    use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
    use 'L3MON4D3/LuaSnip'

    ----------------
    -- Treesitter --
    ----------------
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    -------------------
    -- Tree Explorer --
    -------------------
    use 'kyazdani42/nvim-tree.lua'

    ---------------
    -- Telescope --
    ---------------
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
        config = function()
            require("telescope").load_extension("lazygit")
        end,
    })
    use 'nvim-telescope/telescope-file-browser.nvim'

    --------------
    -- Terminal --
    --------------
    use 'akinsho/toggleterm.nvim'

    -----------------
    -- Keymappings --
    -----------------
    use {
      "folke/which-key.nvim",
      config = function()
         require("user.plugins.which-key").setup()
      end,
    }

    ------------------
    -- Colorschemes --
    ------------------
    use "navarasu/onedark.nvim"

    ---------
    -- Git --
    ---------
    use 'kdheepak/lazygit.nvim' -- Lazygit integration with Neovim
    use 'lewis6991/gitsigns.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require('packer').sync()
    end
end)
