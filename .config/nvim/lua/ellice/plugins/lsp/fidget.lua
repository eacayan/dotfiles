-- import fidget plugin safely
local fidget_status, fidget = pcall(require, 'fidget')
if not fidget_status then
  return
end

-- Setup neovim lua configuration
fidget.setup()