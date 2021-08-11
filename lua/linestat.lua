local feline = require("feline")
local colors = require("linestat.colors")
local vi_mode_utils = require("feline.providers.vi_mode")
local lsp = require('feline.providers.lsp')

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
    -- .. ' '
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
        val.bg = 'bg'
        return val
    end
}

components.left.active[3] = {
    provider = 'file_info',
    hl = function()
        local val = {}
        val.fg = vi_mode_utils.get_mode_color()
        val.bg = colors.dsColumn
        return val
    end,
    left_sep = {'slant_left_2', 'block'},
    right_sep = {'slant_right'}
}

components.mid.active[1] = {
    provider = 'git_branch',
    icon = ' ',
    hl = {fg = colors.orange, style = 'bold'},
    right_sep = {' '}
}

components.mid.active[2] = {
    provider = 'git_diff_added',
    hl = {fg = colors.green_dark}
}

components.mid.active[3] = {
    provider = 'git_diff_changed',
    hl = {fg = colors.orange}
}

components.mid.active[4] = {
    provider = 'git_diff_removed',
    hl = {fg = colors.red}
}

components.right.active[1] = {
    provider = 'lsp_client_names',
    icon = "⚡️",
    hl = {fg = colors.ice},
    left_sep = {' '}
}

components.right.active[2] = {
    provider = 'diagnostic_errors',
    enabled = function() return lsp.diagnostics_exist('Error') end,
    hl = {fg = colors.red}
}

components.right.active[3] = {
    provider = 'diagnostic_warnings',
    enabled = function() return lsp.diagnostics_exist('Warning') end,
    hl = {fg = colors.yellow}
}

components.right.active[4] = {
    provider = 'diagnostic_hints',
    enabled = function() return lsp.diagnostics_exist('Hint') end,
    hl = {fg = colors.cyan}
}

components.right.active[5] = {
    provider = 'diagnostic_info',
    enabled = function() return lsp.diagnostics_exist('Information') end,
    hl = {fg = colors.navyblue}
}

components.right.active[6] = {provider = 'position', left_sep = {' '}}

components.right.active[7] = {
    provider = 'scroll_bar',
    hl = {fg = colors.turqoise, style = 'bold'}
}

local vi_mode_colors = {
    NORMAL = colors.cyan,
    OP = colors.cyan,
    INSERT = colors.red,
    VISUAL = colors.green_dark,
    BLOCK = colors.green_dark,
    REPLACE = colors.orange_light,
    ['V-REPLACE'] = colors.orange_light,
    ENTER = colors.ice,
    MORE = colors.ice,
    SELECT = colors.purple_light,
    COMMAND = colors.teal,
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
