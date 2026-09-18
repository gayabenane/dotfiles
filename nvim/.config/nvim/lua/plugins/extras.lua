if true then
  return {}
end

return {
  -- 🏠 Startup screen (replaces alpha dashboard)
  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- 📦 JSON support:
  -- - LSP (jsonls)
  -- - schema store (auto JSON validation)
  -- - treesitter parsers
  { import = "lazyvim.plugins.extras.lang.json" },
}
