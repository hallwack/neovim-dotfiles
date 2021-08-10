local feline = require("feline")
local colors = require("linestat.colors")
local icons = require("linestat.icons")
local vi_mode_utils = require("feline.providers.vi_mode")

local vi_mode_provider = function()
    local mode_alias = {
        n = 'NORMAL',
        no = 'NORMAL',
        i = 'INSERT',
        v = 'VISUAL',
        V = 'V-LINE',
        [''] = 'V-BLOCK',
        c = 'COMMAND',
        cv = 'COMMAND',
        ce = 'COMMAND',
        R = 'REPLACE',
        Rv = 'REPLACE',
        s = 'SELECT',
        S = 'SELECT',
        [''] = 'SELECT',
        t = 'TERMINAL'
    }
    return ' ' .. mode_alias[vim.fn.mode()] .. ' '
end

local components = {
    left = {active = {}, inactive = {}},
    mid = {active = {}, inactive = {}},
    right = {active = {}, inactive = {}}
}

components.left.active[1] = {provider = '▊', hl = {fg = colors.gray_darker}}

components.left.active[2] = {
    provider = vi_mode_provider,
    hl = function()
        local val = {}
        val.fg = vi_mode_utils.get_mode_color()
        return val
    end
}

components.left.active[3] = {
    provider = 'file_info',
    hl = function()
        local val = {}
        val.fg = colors.black
        val.bg = vi_mode_utils.get_mode_color()
        return val
    end,
    left_sep = {'slant_left_2', 'block'},
    right_sep = {'block', 'slant_right_2', ' '}
}

components.left.active[4] = {
    provider = 'git_branch',
    hl = {fg = colors.orange_light, bg = colors.dsdark1},
    left_sep = {'slant_left'},
    right_sep = {'block', icons.separator.right}
}

components.right.active[1] = {
    provider = 'git_diff_added',
    hl = {fg = 'green', bg = 'black'}
}

components.right.active[2] = {
    provider = 'git_diff_changed',
    hl = {fg = 'orange', bg = 'black'}
}

components.right.active[3] = {
    provider = 'git_diff_removed',
    hl = {fg = 'red', bg = 'black'},
    right_sep = function()
        local val = {hl = {fg = 'NONE', bg = 'black'}}
        if vim.b.gitsigns_status_dict then
            val.str = ' '
        else
            val.str = ''
        end

        return val
    end
}

local vi_mode_colors = {
    NORMAL = colors.ice,
    OP = colors.ice,
    INSERT = colors.red,
    VISUAL = colors.green_dark,
    BLOCK = colors.green_dark,
    REPLACE = colors.orange_light,
    ['V-REPLACE'] = colors.orange_light,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.purple_light,
    COMMAND = colors.cyan,
    SHELL = colors.navyblue,
    TERM = colors.navyblue,
    NONE = colors.orange
}

feline.setup({
    default_bg = colors.dsdark2,
    default_fg = colors.dslight0,
    components = components,
    vi_mode_colors = vi_mode_colors
})
