require("user.keymaps")
require("user.options")
require("user.comments")
require("nvim-surround").setup()
require("user.plugins")

if vim.fn.exists("g:vscode") ~= 0 then
	vim.cmd("source $HOME/.config/nvim/vscode/settings.vim")
	return
end

require("user.whichkey")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.treesitter")
require("user.autopairs")
require("user.gitsigns")
require("user.nvim-tree")
require("user.bufferline")
require("user.toggleterm")
require("user.telescope")
require("user.lualine")
require("user.alpha")
