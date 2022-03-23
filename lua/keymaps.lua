local opts = { noremap = true, silent = true }

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

-- Navigate window
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)


-- NvimTree
keymap("","<Leader>e", "<ESC>:NvimTreeToggle<CR>", opts)
keymap("i","<Leader>e", "<ESC>:NvimTreeToggle<CR>", opts)

-- window
keymap("", "<Leader>cc", "<ESC>:q<CR>", opts)
keymap("i", "<Leader>cc", "<ESC>:q<CR>", opts)


-- Resize window
keymap("", "<C-A-Up>", ":resize +2<CR>", opts)
keymap("", "<C-A-Down>", ":resize -2<CR>", opts)
keymap("", "<C-A-Left>", ":vertical resize -2<CR>", opts)
keymap("", "<C-A-Right>", ":vertical resize +2<CR>", opts)


-- Buffer navigation
keymap("","<S-Right>", ":bnext<CR>", opts)
keymap("","<S-Left>", ":bprevious<CR>", opts)

-- Indentation
keymap("v",">", ">gv", opts)
keymap("v","<", "<gv", opts)

-- Paste most intended yank
keymap("v", "p", '"_dP', opts)


-- Move text
keymap("", "<A-Up>", "<ESC>:m .-2<CR>==", opts)
keymap("", "<A-Down>", ":<ESC>:m .+1<CR>==", opts)
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)

-- Copy text
keymap("", "<A-S-Down>", ":copy .<CR>", opts)
keymap("x", "<A-S-Down>", ":copy '><CR>", opts)
keymap("i", "<A-S-Down>", "<ESC>:copy .<CR>", opts)


-- Telescope
keymap("", "<Leader>f", "<ESC>:Telescope find_files<CR>", opts)
keymap("i", "<Leader>f", "<ESC>:Telescope find_files<CR>", opts)


-- Git related
keymap("", "<Leader>gs", "<ESC>:Git status<CR>", opts)
keymap("", "<Leader>gd", "<ESC>:Git diff<CR>", opts)


-- Comment
keymap("n", "<C-_>", "<CMD>lua require(\"Comment.api\").toggle_current_linewise_op()<CR>", opts)
keymap("i", "<C-_>", "<CMD>lua require(\"Comment.api\").toggle_current_linewise_op()<CR>", opts)
keymap("v", "<C-_>", "<ESC><CMD>lua require(\"Comment.api\").locked.toggle_linewise_op(vim.fn.visualmode())<CR>", opts)
