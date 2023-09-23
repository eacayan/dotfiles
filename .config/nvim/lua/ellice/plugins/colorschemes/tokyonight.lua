local setup, tokyonight = pcall(require, "tokyonight")
if not setup then
	return
end

tokyonight.setup({
	style = "storm",
})

vim.cmd("colorscheme tokyonight-storm")
