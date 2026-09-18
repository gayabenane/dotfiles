return {
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    config = function(_, opts)
      local ls = require("luasnip")
      ls.setup(opts)

      local s = ls.snippet
      local i = ls.insert_node
      local fmt = require("luasnip.extras.fmt").fmt
      local t = ls.text_node

      ls.add_snippets("all", {
        s("name", { t({
          "Gaya Benane.",
        }) }),
      })
      ls.add_snippets("all", {
        s("frsig", { t({
          "",
          "Cordialement",
          "Gaya Benane.",
        }) }),
      })

      ls.add_snippets("all", {
        s("ensig", { t({
          "",
          "Best Regards",
          "Gaya Benane.",
        }) }),
      })
      local function read_file(path)
        local file = io.open(path, "r")
        if not file then
          return nil
        end
        local content = file:read("*a")
        file:close()

        local lines = {}

        for line in (content .. "\n"):gmatch("(.-)\n") do
          line = line:gsub("\r", "")
          table.insert(lines, line)
        end
        return lines
      end

      local template_path = vim.fn.expand("~/.config/nvim/templates/csv_pipe.py")
      local pipeline_code = read_file(template_path)

      if pipeline_code then
        ls.add_snippets("python", {
          s("csv_pipe", {
            t(pipeline_code),
          }),
        })
      else
        vim.notify("LuaSnip: template file not found at " .. template_path, vim.log.levels.WARN)
      end
    end,
  },
}
