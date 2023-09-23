-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, 'telescope')
if not telescope_setup then
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, 'telescope.actions')
if not actions_setup then
  return
end


telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-k>'] = actions.move_selection_previous, -- move to prev result
        ['<C-j>'] = actions.move_selection_next, -- move to next result
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
    file_ignore_patterns = { '.git', 'build', 'deprecated', 'node_modules' }
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          -- your custom insert mode mappings
        },
        ['n'] = {
          -- your custom normal mode mappings
        },
      },
    },
  }
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
-- Enable telescope file browser, if installed
pcall(require('telescope').load_extension, 'file_browser')
-- Enable telescope lazygit, if installed
pcall(require('telescope').load_extension, 'lazygit')