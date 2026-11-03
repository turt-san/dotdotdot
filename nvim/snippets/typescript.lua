local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require('luasnip.extras.fmt').fmt

-- c(2, {
--     t(''),
--     i(nil, 'params'),
-- })

return {
    s(
        'anon',
        fmt([[({}) => {{{}{}}}]], {
            c(2, {
                t(''),
                i(nil, 'params'),
            }),
            i(1),
            i(0),
        })
    ),
    s(
        'cl',
        fmt([[() {{}}{}]], {
            i(0),
        })
    ),
    s(
        'sql',
        fmt([[/* sql */ {}]], {
            i(0),
        })
    ),
}
