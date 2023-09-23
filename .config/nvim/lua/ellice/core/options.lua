-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable relative numbers
vim.o.relativenumber = true

-- Tabs
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Enable break indent
vim.o.breakindent = true
vim.o.autoindent = true

-- Enable line wrapping
vim.opt.wrap = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd("colorscheme catppuccin-macchiato")
-- vim.cmd("colorscheme oceanic_material")
-- vim.cmd("colorscheme onedark")

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

-- Backspace
vim.o.backspace = "indent,eol,start"

-- split windows
vim.o.splitright = true -- split vertical window to the right
vim.o.splitbelow = true -- split horizontal window to the bottom

vim.opt.iskeyword:append("-") -- consider string-string as whole word

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
