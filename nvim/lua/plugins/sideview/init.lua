local sideview_plugins = {}

sideview_plugins.plugins = {
    -- file explorer tree
    'kyazdani42/nvim-web-devicons',
    'kyazdani42/nvim-tree.lua',
    -- code structure tree view
    -- 'simrat39/symbols-outline.nvim'
}


function sideview_plugins.load()
    require'nvim-tree'.setup {
        disable_netrw        = true,
        hijack_netrw         = true,
        open_on_setup        = false,
        ignore_buffer_on_setup = false,
        ignore_ft_on_setup   = {},
        auto_reload_on_write = true,
        open_on_tab          = true,
        hijack_cursor        = false,
        update_cwd           = true,
        hijack_unnamed_buffer_when_opening = false,
        hijack_directories   = {
            enable = true,
            auto_open = true,
        },
        diagnostics = {
            enable = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            }
        },
        view = {
            width = 40,
            height = 30,
            hide_root_folder = false,
            side = 'left',
            preserve_window_proportions = true,
            mappings = {
                custom_only = false,
                list = {}
            },
            number = false,
            relativenumber = false,
            signcolumn = "yes"
        },
    }

    -- vim.cmd("autocmd VimEnter * if winwidth(0) > 100  | execute 'NvimTreeOpen' | wincmd p | else | execute 'NvimTreeClose' | endif")

    --[[ if vim.fn.winwidth(0)>100 then
        require'nvim-tree'.toggle(false,true)
    end ]]

    vim.cmd("autocmd VimResized * if winwidth(0) > 100 | execute 'NvimTreeOpen' | execute 'NvimTreeFocus' | wincmd p | else | execute 'NvimTreeClose' | endif")
    vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

end

return sideview_plugins
