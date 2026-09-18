return {
  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- 😊 Adds emoji completion (type :smile etc)
      "hrsh7th/cmp-emoji",
    },
    -- config = function()
    opts = function(_, opts)
      -- Safely append the emoji source to the existing sources list
      table.insert(opts.sources, { name = "emoji" })
    end,
    --  local cmp = require("cmp")
    --  sources = cmp.config.sources({
    --    { name = "nvim_lsp" },
    --   { name = "emoji" },
    --  })
    --end,
  },
}
