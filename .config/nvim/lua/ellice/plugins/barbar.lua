local setup, barbar = pcall(require, "barbar")
if not setup then
	return
end

-- enable comment
barbar.setup({
	animation = true,
	tabpages = true,
	clickable = true,
	icons = {
		filetype = { enabled = true },
		modified = { button = "●" },
		button = "󰅚",
		separator = { left = "▎" },
		inactive = { left = "▎" },
	},
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "NvimTree" then
			require("bufferline.api").set_offset(30, "FileTree")
		end
	end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "*",
	callback = function()
		if vim.fn.expand("<afile>"):match("NvimTree") then
			require("bufferline.api").set_offset(0)
		end
	end,
})
