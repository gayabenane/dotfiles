return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- 🧠 LSP
        -- C/C++
        "clangd",

        -- C/C++ debugger
        "codelldb",

        -- 🐍 Python
        "pyright",

        -- 🐍 Python debugger
        "debugpy",
        --
        -- 🎨 Formatters
        "clang-format",
        "stylua",
        "shfmt",

        -- 📄 LaTeX (NOT LSP, but useful tools)
        "texlab",

        -- 🔍 Linters
        "flake8",
        "shellcheck",
        "black",
      },
    },
  },
}
