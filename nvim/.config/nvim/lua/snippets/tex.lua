local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

local snippets = {

  -- The TColorBox Master Snippet
  s(
    "tcb",
    c(1, {

      -- OPTION 1: The Modern Theorem/Definition Box
      -- Requires \tcbuselibrary{skins} in your preamble
      fmt(
        [[
      \begin{tcolorbox}[
          enhanced,
          drop fuzzy shadow,
          colback=<>!5!white,
          colframe=<>!75!black,
          fonttitle=\bfseries,
          title={<>},
          arc=2mm,
          boxrule=0.5mm,
          <>
      ]
          <>
      \end{tcolorbox}
    ]],
        {
          i(1, "blue"), -- Background color base
          rep(1), -- Automatically mirror the color for the frame
          i(2, "Box Title"), -- Title
          i(3, "breakable,"), -- Extra options (e.g., breakable across pages)
          i(0, "% Content here..."),
        },
        { delimiters = "<>" }
      ),

      -- OPTION 2: The Minimal Left-Bar (Great for warnings or notes)
      fmt(
        [[
      \begin{tcolorbox}[
          blanker,
          borderline west={3pt}{0pt}{<>},
          colback=<>!5!white,
          left=1ex,
          right=1ex,
          top=1ex,
          bottom=1ex,
      ]
          <>
      \end{tcolorbox}
    ]],
        {
          i(1, "red"), -- Left bar color
          rep(1), -- Background tint color
          i(0, "% Note content here..."),
        },
        { delimiters = "<>" }
      ),

      -- OPTION 3: The "Kitchen Sink" (All major customizations exposed)
      fmt(
        [[
      \begin{tcolorbox}[
          enhanced,
          breakable,
          title={<>},
          colback={<>},
          colframe={<>},
          coltitle={<>},
          coltext={<>},
          boxrule={<>},
          arc={<>},
          outer arc={<>},
          top={<>},
          bottom={<>},
          left={<>},
          right={<>},
          boxsep={<>},
          shadow={<>},
          attach boxed title to top left={yshift=-2mm, xshift=5mm},
          boxed title style={colback=<>}
      ]
          <>
      \end{tcolorbox}
    ]],
        {
          i(1, "Custom Title"),
          i(2, "white"), -- colback
          i(3, "black"), -- colframe
          i(4, "white"), -- coltitle
          i(5, "black"), -- coltext
          i(6, "0.5mm"), -- boxrule
          i(7, "3mm"), -- arc
          i(8, "3mm"), -- outer arc
          i(9, "2mm"), -- top padding
          i(10, "2mm"), -- bottom padding
          i(11, "2mm"), -- left padding
          i(12, "2mm"), -- right padding
          i(13, "1mm"), -- boxsep
          i(14, "{2mm}{-1mm}{0mm}{black!50}"), -- shadow: xshift, yshift, blur, color
          i(15, "black"), -- boxed title background
          i(0, "% Highly customized content..."),
        },
        { delimiters = "<>" }
      ),
    })
  ),
}

return snippets
