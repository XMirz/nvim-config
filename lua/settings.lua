HOME = os.getenv("HOME")

local options = {
  -- WhiteSpace
  autoindent = true,
  smartindent = true,
  tabstop = 2,
  shiftwidth = 2,
  expandtab =  true, 

  clipboard = 'unnamedplus',
  backup = false,
  swapfile = false,

  -- Display
  number = true,
  cursorline = true,
  splitbelow = true, -- force horizontal split down to current
  splitright = true,
  showtabline = 2,
  -- Search
  ignorecase = true,
  relativenumber = false,
}
for k,v in pairs(options) do 
  vim.o[k] = v
end


