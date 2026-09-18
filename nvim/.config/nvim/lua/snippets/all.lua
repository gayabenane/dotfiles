local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local uv = vim.uv or vim.loop

local snippets = {
  s(
    "header",
    fmt(
      [[
    # Date:     {}
    # Author:   {}
    # Machine:  {}
    # OS Info:    {}
    ]],
      {
        f(function()
          return os.date("%A, %d %B %Y %H:%M")
        end),
        i(1, "Gaya Benane"),
        -- 3. Machine Name
        f(function()
          return uv.os_gethostname()
        end),

        -- 4. OS Info
        f(function()
          local os_info = uv.os_uname()
          return os_info.sysname .. " (" .. os_info.machine .. ")"
        end),
      }
    )
  ),
}
return snippets
