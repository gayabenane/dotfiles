return {
  -- 1. nvim-colorizer (Passive background highlighting)
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RGBA = true, -- #RGBA hex codes
        names = true, -- "Name" codes like Blue or red
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features
        css_fn = true, -- Enable all CSS functions
        mode = "background", -- Set the display mode
      },
    },
  },
  -- 2. ccc.nvim (Active UI Picker)
  {
    "uga-rosa/ccc.nvim",
    cmd = { "CccPick", "CccConvert" },
    keys = {
      { "<leader>cp", "<cmd>CccPick<CR>", desc = "Open Color Picker" },
    },
    opts = {
      -- The ccc highlighter is intentionally left off by default
      -- so it does not conflict with nvim-colorizer.
    },
  },
}
