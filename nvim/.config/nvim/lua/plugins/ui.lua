return {
  -- 🎨 Theme plugin (gruvbox colors)
  { "ellisonleao/gruvbox.nvim" },
  -- 🧠 Tell LazyVim to use gruvbox as the main colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight", --"gruvbox",
    },
  },
  -- 📊 Statusline (lualine)
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",

    -- ➕ extend existing config
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return "😄"
        end,
      })
    end,
  },
}
