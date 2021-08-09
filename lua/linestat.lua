local galaxyline = require("galaxyline")
local vcs = require("galaxyline.provider_vcs")
local fileinfo = require("galaxyline.provider_fileinfo")
local colors = require("linestat.colors")
local icons = require("linestat.icons")
local section = galaxyline.section

local buffer_not_empty = function ()
    if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
        return true
    end

    return false
end

section.left[1] = {
    FirstElem = {
        provider = function() return "   " end,
        highlight = {colors.tan, colors.tan}
    }
}

section.left[2] = {
    ViMode = {
        provider = function()
            local alias = {
                n = {text = ' NORMAL ', color = colors.ice},
                i = {text = ' INSERT ', color = colors.green_dark},
                c = {text = ' COMMAND ', color = colors.orange},
                v = {text = ' VISUAL ', color = colors.teal},
                V = {text = ' VISUAL LINE ', color = colors.turqoise},
                [''] = {text = ' VISUAL BLOCK ', color = colors.navyblue},
                R = {text = ' REPLACE ', color = colors.red}
            }

            local current_mode = alias[vim.fn.mode()]

            if current_mode == nil then
                return " Terminal "
            else
                vim.cmd(string.format("hi GalaxyViMode guibg=%s",
                                      current_mode.color))
                return "    " .. current_mode.text
            end
        end,
        highlight = {colors.dsdark1, colors.dslight0, "bold"}
    }
}

section.left[3] = {
    some_icon = {
        separator = " ",
        separator_highlight = {colors.cyan, colors.dsdark0},
    }
}

section.left[4] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        highlight = {colors.ice, colors.dslight0}
    }
}
