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

	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	},

	-- More LSP configuration
	{ "glepnir/lspsaga.nvim", branch = "main" }, -- enhanced lsp uis
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
	"pantharshit00/vim-prisma", -- Prisma specific syntax highlighting
	{ "NvChad/nvim-colorizer.lua", opts = {
		user_default_options = {
			tailwind = true,
		},
	} },

	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
		},
		opts = function(_, opts)
			opts.formatting = {
				format = require("tailwindcss-colorizer-cmp").formatter,
			}
		end,
	},
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths

	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = {
			"windwp/nvim-ts-autotag", -- auto close tags
			"nvim-treesitter/nvim-treesitter-textobjects", -- Additional text objects via treesitter
		},
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},

	-- Terminal
	{
		"akinsho/toggleterm.nvim",
	},

	-- vs-code like icons
	"nvim-tree/nvim-web-devicons",

	-- file explorer
	"nvim-tree/nvim-tree.lua",

	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"lewis6991/gitsigns.nvim",

	-- Debugging
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",

	-- Colorschemes
	"navarasu/onedark.nvim", -- Theme inspired by Atom
	-- "olimorris/onedarkpro.nvim",
	"EdenEast/nightfox.nvim",
	"glepnir/oceanic-material",
	{ "catppuccin/nvim", as = "catppuccin" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	"nvim-lualine/lualine.nvim", -- Fancier statusline
	"romgrk/barbar.nvim", -- Bufferline
	"lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
	"numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	"szw/vim-maximizer", -- maximizes and restores current window
	"karb94/neoscroll.nvim", -- smooth scrolling for window movement commands

	-- essential plugins
	"tpope/vim-surround", -- add, delete, change surroundings
	"inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	-- start page
	"goolord/alpha-nvim",

	-- Fuzzy Finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
	},
	{ "nvim-telescope/telescope-file-browser.nvim" },

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },

	-- Rust specific
	"simrat39/rust-tools.nvim",
}, {})
