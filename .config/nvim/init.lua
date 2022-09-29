-- Vanilla Config
require('user.settings')
--require('user.autocmd')
require('user.plugins')
require('user.keymaps')

---Pretty print lua table
function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(unpack(objects))
end
