require("user.keymaps")

if vim.fn.exists("g:vscode") ~= 0 then
    vim.cmd('source $HOME/.config/nvim/vscode/settings.vim')
  return
end

require("user.whichkey")
require("user.options")
require("user.colorscheme")
require("user.plugins")
require("user.cmp")
require("user.lsp")
require("user.treesitter")
require("user.autopairs")
require("user.comments")
require("user.gitsigns")
require("user.nvim-tree")
require("user.bufferline")
require("user.toggleterm")
require("user.telescope")
require("user.lualine")
require("user.indentline")
require("user.alpha")
