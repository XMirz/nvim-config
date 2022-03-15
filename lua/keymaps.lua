local opts = { noremap = true, silent = true}

local termOpts =  {silent = true}

  local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.localmapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("","<C-b>", ":Lexplore<CR>", opts)
keymap("i","<C-b>", "<ESC>:Lexplore 25<CR>", opts)

-- Move text
keymap("", "<A-Up>", ":m .-2<CR>==", opts)
keymap("", "<A-Down>", ":m .+1<CR>==", opts)

-- Resize windo
keymap("", "<C-Up>", ":resize +2<CR>", opts)
keymap("", "<C-Down>", ":resize -2<CR>", opts)
keymap("", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("", "<C-Right>", ":vertical resize +2<CR>", opts)


-- Buffer navigation
keymap("","<S-Right>", ":bnext<CR>", opts)
keymap("","<S-Left>", ":bprevious<CR>", opts)

-- Visual Modes
-- Indentation
keymap("v",">", ">gv", opts)
keymap("v","<", "<gv", opts)

-- Paste most intended yank
keymap("v", "p", '"_dP', opts)


-- Visual Block
-- Move text
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)


