-- ~/.config/nvim/lua/config/commands.lua

-- Define where you keep your local invoice drafts
-- Adjust this path if your micro-entreprise folder is elsewhere!
local INVOICE_DIR = vim.fn.expand("~/Documents/MicroEntreprise/Invoices/")

vim.api.nvim_create_user_command("NewInvoice", function()
  -- Ensure directory exists
  if vim.fn.isdirectory(INVOICE_DIR) == 0 then
    vim.fn.mkdir(INVOICE_DIR, "p")
  end

  local year = os.date("%Y")
  local prefix = "F" .. year .. "-"

  -- Scan directory for existing invoices matching this year
  local files = vim.fn.glob(INVOICE_DIR .. prefix .. "*.yaml", false, true)

  local max_num = 0
  for _, file in ipairs(files) do
    -- Extract the 4-digit number at the end of the filename
    local num_str = string.match(file, "(%d%d%d%d)%.yaml$")
    if num_str then
      local num = tonumber(num_str)
      if num > max_num then
        max_num = num
      end
    end
  end

  -- Increment safely
  local next_num = max_num + 1
  local new_filename = string.format("%s%04d.yaml", prefix, next_num)
  local full_path = INVOICE_DIR .. new_filename

  pcall(require, "luasnip")

  -- Open the new file in a buffer
  vim.cmd("edit " .. full_path)

  -- Force Neovim to instantly recognize this as a YAML file
  vim.bo.filetype = "yaml"

  vim.cmd("write")

  vim.schedule(function()
    local ok, ls = pcall(require, "luasnip")
    if ok then
      local snips = ls.get_snippets("yaml")
      for _, snip in ipairs(snips) do
        if snip.trigger == "invoice" then
          ls.snip_expand(snip)
          vim.cmd("startinsert")
          return
        end
      end
    end
  end)

  vim.notify("Created new invoice draft: " .. new_filename, vim.log.levels.INFO)
end, { desc = "Safely generate the next invoice file" })

-- Map the command to <leader>ni (New Invoice) in Normal mode
vim.keymap.set("n", "<leader>ni", "<cmd>NewInvoice<CR>", { desc = "New Invoice Draft" })
