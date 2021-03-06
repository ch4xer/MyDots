local edit_plugins = require('plugins.edit')
local interface_plugins = require('plugins.interface')
local sideview_plugins = require('plugins.sideview')
local theme_plugins = require('plugins.theme')
local lsp_plugins = require('plugins.lsp')


vim.cmd('packadd packer.nvim')
require('packer').startup(
    function()
        for _, plugin in pairs(interface_plugins.plugins) do use(plugin) end
        for _, plugin in pairs(theme_plugins.plugins) do use(plugin) end
        for _, plugin in pairs(lsp_plugins.plugins) do use(plugin) end
        for _, plugin in pairs(edit_plugins.plugins) do use(plugin) end
        for _, plugin in pairs(sideview_plugins.plugins) do use(plugin) end
    end
)

interface_plugins.load()
theme_plugins.load()
lsp_plugins.load()
edit_plugins.load()
sideview_plugins.load()
