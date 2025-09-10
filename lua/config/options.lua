-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Workaround for Neovim v0.12.0-dev treesitter conceal issue
-- Disable conceallevel globally to prevent the C-call boundary error
vim.opt.conceallevel = 0

-- Optional: If you want to re-enable conceal for specific filetypes later
-- you can do so in after/ftplugin/*.lua files
