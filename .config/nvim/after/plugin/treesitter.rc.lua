local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "astro",
    "dockerfile",
    "tsx",
    "javascript",
    "typescript",
    "toml",
    "php",
    "json",
    "yaml",
    "css",
    "html",
    "lua",
    "go",
    "graphql"
  },
  autotag = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }