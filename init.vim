set hlsearch
set nocompatible
set ignorecase
filetype plugin indent on
syntax on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab

set laststatus=2
set noshowmode

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>


lua << EOF

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

    local function my_on_attach(bufnr)
        api.config.mappings.default_on_attach(bufnr)
    end

    -- empty setup using defaults
    require("nvim-tree").setup()

EOF
