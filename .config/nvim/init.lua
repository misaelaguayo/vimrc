vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.background = 'dark'

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.laststatus = 2

local function map(mode, combo, action, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, combo, action, options)
end

vim.keymap.set('n', '<CR>', ':noh<CR><CR>', {noremap = true})
vim.keymap.set('n', '<Leader>b', ':Buffers<CR>', {noremap = true})
vim.keymap.set('n', '<C-f>', ':Files<CR>', {noremap = true})
vim.keymap.set('n', '<Leader>f', ':Rg', {noremap = true})

-- disable netrw at the very
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "nvim-tree/nvim-tree.lua",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "folke/which-key.nvim",
    "folke/trouble.nvim",
    "folke/neodev.nvim",
    "github/copilot.vim",
    {"ellisonleao/gruvbox.nvim", priority = 1000},
    "ms-jpq/coq_nvim",
    "ms-jpq/coq.artifacts",
    {"junegunn/fzf", run = "./install --all" },
    "junegunn/fzf.vim",
    {"tamton-aquib/duck.nvim",
        config = function()
            vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
            vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
        end
    },
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    "xiyaowong/transparent.nvim",
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
})

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
}

require("nvim-tree").setup()

require('gitsigns').setup()

require("transparent").setup()

-- nvim tree keybindings
vim.keymap.set('n', '<space>e', ':NvimTreeToggle<CR>')

-- transparent keybindings
vim.keymap.set('n', '<space>t', ':TransparentToggle<CR>')

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

vim.cmd[[colorscheme gruvbox]]
