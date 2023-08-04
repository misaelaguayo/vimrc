vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.nocompatible = true

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.laststatus = 2
vim.opt.noshowmode = true

local function map(mode, combo, action, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, combo, action, options)
end

map('n', '<CR>', ':noh<CR><CR>', {noremap = true})
map('n', '<silent> <Leader>b', ':Buffers<CR>', {noremap = true})
map('n', '<silent> <C-f>', ':Files<CR>', {noremap = true})
map('n', '<silent> <Leader>f', ':Rg', {noremap = true})
