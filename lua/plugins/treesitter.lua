return {
  -- Extra parsers on top of LazyVim's defaults.
  -- `ensure_installed` is declared `opts_extend` by LazyVim, so this list is
  -- appended to (not replacing) the built-in one. Go parsers come from the
  -- lang.go extra. Do NOT set `build` here -- LazyVim's own build function
  -- drives the nvim-treesitter `main` branch installer.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "python",
        "javascript",
        "html",
        "css",
        "bash",
        "yaml",
        "json",
      },
    },
  },
}
