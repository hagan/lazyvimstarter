return {
  -- Add the nvim-treesitter plugin
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        -- Specify the languages to ensure installed
        ensure_installed = {
          "lua", "python", "javascript", "html", "css", "bash", "yaml", "json"
        },
      highlight = { enable = true }, -- Enable syntax highlighting
      incremental_selection = { enable = true }, -- Enable incremental selection
      textobjects = { enable = true }, -- Enable text objects
    },
  },
}
