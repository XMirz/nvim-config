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
keymap("i","<C-b>", "<ESC>:Lexplore<CR>", opts)

-- Move text
keymap("", "<A-Up>", ":m .-2<CR>==", opts)
keymap("", "<A-Down>", ":m .+1<CR>==", opts)