local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<S-k>", ":m .-2<CR>==", opts)
keymap("v", "<S-j>", ":m .+1<CR>==", opts)

-- keep the yank when pasting over selection
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<S-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<S-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<S-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<S-l>", "<C-\\><C-N><C-w>l", term_opts)

-- yank inside string
keymap("n", "<leader>`", "+yi`", opts)
keymap("n", '<leader>"', '"+yi"', opts)
keymap("n", "<leader>'", "\"+yi'", opts)

-- COPY/Paste from clipboard
keymap("n", "<leader>p", '"+p', opts)
keymap("n", "<leader>y", '"+y', opts)

if vim.fn.exists("g:vscode") ~= 0 then
	return
end

-- source neovim files
keymap("n", "<leader>sv", ":luafile $MYVIMRC<CR>", opts)
