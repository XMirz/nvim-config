local opts = { noremap = true, silent = true }

-- local termOpts =  {silent = true}

local keymap = vim.api.nvim_set_keymap
local bufkeymap = vim.api.nvim_buf_set_keymap

vim.g.mapleader = ";"
vim.g.localmapleader = ";"

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
keymap("", "<Leader>e", "<ESC>:NvimTreeToggle<CR>", opts)
keymap("i", "<Leader>e", "<ESC>:NvimTreeToggle<CR>", opts)

-- window
keymap("", "<Leader>qq", "<ESC>:q<CR>", opts)
keymap("i", "<Leader>qq", "<ESC>:q<CR>", opts)
keymap("", "<Leader>ss", "<ESC>:w<CR>", opts)
keymap("i", "<Leader>ss", "<ESC>:w<CR>", opts)
keymap("", "<Leader>sq", "<ESC>:wq<CR>", opts)
keymap("i", "<Leader>sq", "<ESC>:wq<CR>", opts)

-- Resize window
keymap("", "<C-A-Up>", ":resize +2<CR>", opts)
keymap("", "<C-A-Down>", ":resize -2<CR>", opts)
keymap("", "<C-A-Left>", ":vertical resize -2<CR>", opts)
keymap("", "<C-A-Right>", ":vertical resize +2<CR>", opts)

-- Buffer

-- Buffer navigation
keymap("", "<S-Right>", ":bnext<CR>", opts)
keymap("", "<S-Left>", ":bprevious<CR>", opts)

-- Indentation
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

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

keymap("", "<Leader>f", ":lua vim.lsp.buf.formatting()<CR>", opts) -- Format files
keymap("i", "<Leader>f", ":lua vim.lsp.buf.formatting()<CR>", opts) -- Format files

-- Telescope
keymap("", "<Leader>p", "<ESC>:Telescope find_files<CR>", opts)
keymap("i", "<Leader>p", "<ESC>:Telescope find_files<CR>", opts)

-- Git related
keymap("", "<Leader>gs", "<ESC>:Git status<CR>", opts)
keymap("", "<Leader>gd", "<ESC>:Git diff<CR>", opts)

-- Comment
keymap("n", "<C-_>", '<CMD>lua require("Comment.api").toggle_current_linewise_op()<CR>', opts)
keymap("i", "<C-_>", '<CMD>lua require("Comment.api").toggle_current_linewise_op()<CR>', opts)
keymap("v", "<C-_>", '<ESC><CMD>lua require("Comment.api").locked.toggle_linewise_op(vim.fn.visualmode())<CR>', opts)


-- Colorscheme / Themes
keymap("n", "<Leader>tt", "<ESC>:lua toggle_transparent()<CR>", opts) -- toggle tokyonihgt transparent


-- Buffer

-- local M = {}
function _G.set_lsp_keymap()
	print("Loading bufkeymap")
	keymap("n", "<Leader>ld", "<ESC>:lua vim.lsp.buf.declaration()<CR>", opts)
	keymap("n", "<Leader>li", "<ESC>:lua vim.lsp.buf.implementation()<CR>", opts)
	keymap("n", "<Leader>lr", "<ESC>:lua vim.lsp.buf.references()<CR>", opts)
	keymap("n", "<Leader>lh", "<ESC>:lua vim.lsp.buf.hover()<CR>", opts)
	keymap("n", "<Leader>rn", "<ESC>:lua vim.lsp.buf.rename()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(
	--   bufnr,
	--   "n",
	--   "gl",
	--   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
	--   opts
	-- )
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	-- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- return M

vim.cmd("autocmd! VimEnter * lua set_lsp_keymap() ")
