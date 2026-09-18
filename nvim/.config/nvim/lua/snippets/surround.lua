return {
  { "echasnovski/mini.surround", enabled = false },
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- We leave this empty to use the standard, default keybindings
    })
  end,
}
