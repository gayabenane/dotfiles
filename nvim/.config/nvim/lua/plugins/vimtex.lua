return {
  "lervag/vimtex",
  lazy = false, -- Critical: lazy-loading breaks inverse search (jumping from PDF to code)
  init = function()
    -- Set your PDF viewer (Skim is the standard for macOS)
    vim.g.vimtex_view_method = "skim"

    -- Point VimTeX to the .build folder we defined in your latexmkrc
    vim.g.vimtex_compiler_latexmk = {
      build_dir = ".build",
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }

    -- Disable VimTeX's 'K' mapping so it doesn't conflict with the LSP's hover documentation
    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }

    -- Quickfix formatting
    vim.g.vimtex_quickfix_method = "zathura"

    vim.g.vimtex_quickfix_mod = 0

    vim.g.vimtex_compiler_method = "latexmk"
  end,
}
