-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Fix for Treesitter yield across C-call boundary error in Neovim v0.12.0-dev
-- This properly handles the conceal_line decoration provider issue
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- Disable problematic treesitter highlighter features
    pcall(function()
      -- Clear any LazyVim conceal autocmds
      vim.api.nvim_clear_autocmds({
        group = "lazyvim_conceal",
      })
    end)
    
    -- Workaround for treesitter conceal issues
    local ts_highlight = vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()]
    if ts_highlight then
      pcall(function()
        -- Temporarily disable conceal for treesitter
        vim.opt_local.conceallevel = 0
      end)
    end
  end,
})

-- Additional fix: Wrap treesitter operations in safe pcall
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "*",
  callback = function()
    -- Safely handle treesitter parsing
    local ok, _ = pcall(function()
      if vim.bo.filetype ~= "" then
        vim.treesitter.start()
      end
    end)
    if not ok then
      -- Fall back to syntax highlighting if treesitter fails
      vim.cmd("syntax on")
    end
  end,
})
