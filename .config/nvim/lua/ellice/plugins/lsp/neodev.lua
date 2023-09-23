-- import neodev plugin safely
local neodev_status, neodev = pcall(require, 'neodev')
if not neodev_status then
  return
end

-- Setup neovim lua configuration
neodev.setup()