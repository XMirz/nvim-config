local colorscheme = 'tokyonight'
 
local status_ok,_ = pcall(vim.cmd, 'colorscheme ' ..colorscheme)
if status_ok then
  vim.g.tokyonight_style = "night"
  vim.g.tokyonight_transparent = true
  vim.cmd[[colorscheme tokyonight]]
  return
end  

