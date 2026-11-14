return {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
        local npairs = require('nvim-autopairs')

        local Rule = require('nvim-autopairs.rule')

        npairs.setup({
            -- tree-sitter to skip pairing inside comments/strings
            check_ts = true,
            -- matches jiangmiao/auto-pairs <C-h> paired deletion
            map_c_h = true,
            fast_wrap = {
                -- rebound from <M-e>
                map = '<C-e>',
            },
        })

        npairs.add_rules({
            Rule('<!--', '-->', { 'html ' }),
            Rule('|', '|'),
            Rule('<', '>'),
            Rule('```', '```'),
            Rule('"""', '"""'),
            Rule("'''", "'''"),
        })

        -- Recreate <M-p> toggle shortcut from jiangmiao/auto-pairs
        vim.keymap.set({ 'i', 'n' }, '<M-p>', function()
            npairs.toggle()
            vim.notify('nvim-autopairs toggled')
        end, { desc = 'Toggle nvim-autopairs' })
    end,
}
