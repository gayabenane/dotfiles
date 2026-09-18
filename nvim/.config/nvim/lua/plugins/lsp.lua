if false then
  return {}
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- 🧠 LazyVim will automatically call .setup() for these
      pyright = {},
      clangd = {},

      texlab = {
        settings = {
          texlab = {
            build = {
              onSave = false,
            },
            chktex = {
              onOpenAndSave = true,
              onEdit = true,
            },
            diagnostics = {
              ignoredPatters = { "^Underfull", "^Overfull" },
            },
          },
        },
      },
    },
  },
}
