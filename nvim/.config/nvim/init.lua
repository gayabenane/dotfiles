-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.commands")

vim.opt.conceallevel = 2

-- a = accents, b = bold/italic, d = delimiters, m = math symbols, g = greek
vim.g.tex_conceal = "abdmg"
