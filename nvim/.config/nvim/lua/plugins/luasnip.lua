-- ~/.config/nvim/lua/plugins/luasnip.lua
return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {
        {
          "<C-e>",
          function()
            local ls = require("luasnip")
            if ls.choice_active() then
              ls.change_choice(1)
            end
          end,
          mode = { "i", "s" }, -- Works in Insert and Select mode
          desc = "Cycle LuaSnip Choice",
        },
      }
    end,
    config = function(_, opts)
      local ls = require("luasnip")

      -- 1. Apply your custom options
      ls.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
      })

      -- 2. Load your organized custom Lua snippets
      -- Using vim.fn.stdpath("config") is safer than hardcoding "~/.config/nvim"
      require("luasnip.loaders.from_lua").lazy_load({
        paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
      })

      -- 3. Load predefined snippets (see below)
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
