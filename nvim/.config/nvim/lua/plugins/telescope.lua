if false then
  return {}
end

return {
  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      "xiyaowong/telescope-emoji.nvim",
    },

    keys = {

      {
        -- 🔍 Custom keybinding
        "<leader>fp",

        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,

        desc = "Find Plugin File",
      },
      {
        "<leader>ee",
        "<cmd>Telescope emoji<cr>",
        desc = "Search Emojis Motherfuckers!!!!! YAAAAaaaaaaaaaaaaah",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal", -- layout style
        layout_config = { prompt_position = "top" }, -- search bar on top
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },

    config = function(_, opts)
      local telescope = require("telescope")

      telescope.setup(opts)

      telescope.load_extension("emoji")
    end,
  },
}
