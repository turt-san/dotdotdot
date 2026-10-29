local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

return {
    s(
        "anon",
        fmt([[({}) => {{{}}}]], {
            i(0),
            c(1, {
                t(""),
                i(nil, "params"),
            }),
        })
    ),
    s(
        "cl",
        fmt([[() {{}}{}]], {
            i(0),
        })
    ),
}
