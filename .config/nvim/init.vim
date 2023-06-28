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
        "ellisonleao/gruvbox.nvim",
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
        priority = 1000,
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

    -- nvim tree keybindings
    vim.keymap.set('n', '<C-e>', ':NvimTreeToggle<CR>')

    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
    -- vim.keymap.set('n', '<space>gj', gitsigns.next_hunk)
    -- vim.keymap.set('n', '<space>gk', gitsigns.prev_hunk)
    -- vim.keymap.set('n', '<space>gp', gitsigns.preview_hunk_inline)
    -- vim.keymap.set('n', '<space>gl', gitsigns.blame_line)
    -- vim.keymap.set('n', '<space>gr', gitsigns.reset_hunk)
    -- vim.keymap.set('n', '<space>gR', gitsigns.reset_buffer)

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

EOF

set background=dark
colorscheme gruvbox
