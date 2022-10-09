vim.g.bufferline = {
	animation = true,
	tabpages = true,
	clickable = true,
  icons = true,
	icon_close_tab = "",
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab_modified = '●',
}

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      require'bufferline.api'.set_offset(36, 'FileTree')
    end
  end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*',
  callback = function()
    if vim.fn.expand('<afile>'):match('NvimTree') then
      require'bufferline.api'.set_offset(0)
    end
  end
})