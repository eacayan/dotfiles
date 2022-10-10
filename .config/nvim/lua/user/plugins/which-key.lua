local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "none", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    -- ["t"] = { "" }

    b = {
      name = "Buffer",
      c = { "<Cmd>bd!<Cr>", "Close current buffer" },
      D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    },

    P = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    f = {
      name = "Find",
      f = { "<cmd>lua require('telescope.builtin').find_files({no_ignore = false, hidden = true})<cr>", "Files" },
      b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
      h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help" },
      m = { "<cmd>lua require('telescope.builtin').marks()<cr>", "Marks" },
      o = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Old Files" },
      g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
      c = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Commands" },
      r = { "<cmd>lua require'telescope'.extensions.file_browser.file_browser({path = '%:p:h', cwd = vim.fn.expand('%:p:h'), respect_gitignore = false, hidden = true, grouped = true,previewer = false,initial_mode = 'normal', layout_config = { height = 40 }})<cr>", "File Browser" }
    },
    g = {
      name = "Git",
      g = { "<cmd>LazyGit<CR>", "LazyGit" },
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
