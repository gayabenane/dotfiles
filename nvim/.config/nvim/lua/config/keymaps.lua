-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- 🐍 Run Python file (NO debugging)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.keymap.set("n", "<F5>", function()
      local file = vim.fn.expand("%:p")
      vim.cmd("w")
      vim.cmd("split | terminal uv run " .. file)
    end, { buffer = true, desc = "Run Python file with uv" })
  end,
})
