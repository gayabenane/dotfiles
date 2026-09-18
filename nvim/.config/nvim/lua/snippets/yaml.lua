local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local function get_filename()
  return vim.fn.expand("%:t:r")
end

local snippets = {
  s(
    "invoice",
    fmt(
      [[
# ---
# DRAFT: {}
# ---
invoice_id: "{}"
issue_date_: "{}"
delivery_date_: "{}"

client:
  name: "{}"
  siret: "{}"  # Must be exactly 14 digits
  address: "{}"
  country: "FR"

items:
  - description: "{}"
    quantity: {}
    unit_price: {}  # Must be >= 0
  ]],
      {
        -- 1. Invoice ID (typed once, mirrored automatically below)
        f(get_filename),
        f(get_filename),

        -- 2. Auto-fill today's date for issue and delivery
        f(function()
          return os.date("%d-%m-%Y")
        end),
        f(function()
          return os.date("%d-%m-%Y")
        end),

        -- 3. Client Details
        i(1, "CLIENT NAME"),
        i(2, "00000000000000"),
        i(3, "Addresse"),

        -- 4. Dropdown choice for your standard services
        c(4, {
          t("Data analysis and numerical modeling"),
          t("Scientific consulting"),
          t("Software engineering services"),
          i(nil, "Custom description..."), -- Allows you to type something else if needed
        }),

        -- 5. Billing logic
        i(5, "5.0"),
        i(6, "500.0"),
      }
    )
  ),
}

return snippets
