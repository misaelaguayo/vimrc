vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"

vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.background = 'dark'
vim.opt.number = true
vim.opt.diffopt:append {'vertical'}
vim.opt.fixeol = false

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.laststatus = 2

vim.keymap.set('n', '<CR>', ':noh<CR><CR>', { noremap = true })
vim.keymap.set('n', '<C-f>', ':Files<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>f', ':Rg<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>w', ':set wrap!<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>c', ':cclose<CR>', { noremap = true })

-- buffers
vim.keymap.set('n', '<Leader>b', ':Buffers<CR>', { noremap = true })
vim.keymap.set('n', '<space>bd', ':bdelete<CR>', { noremap = true })
vim.keymap.set('n', '<space>bn', ':bnext<CR>', { noremap = true })
vim.keymap.set('n', '<space>bp', ':bprevious<CR>', { noremap = true })
vim.keymap.set('n', '<space>bb', ':BufferLineCloseOthers<CR>', { noremap = true })

-- disable netrw at the very
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- debugging
vim.keymap.set('n', '<space>c', ':lua require"dap".continue()<CR>', { noremap = true })
vim.keymap.set('n', '<space>t', ':lua require"dap".toggle_breakpoint()<CR>', { noremap = true })

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
    -- "github/copilot.vim",
    {
        "misaelaguayo/markdown.nvim",
        dev=true,
        lazy=false,
        -- opts={
        --     markdown_preview_path = "/Users/misaelaguayo/Projects/markdown-preview-haskell/.stack-work/dist/aarch64-osx/ghc-9.4.7/build/markdown-preview-haskell-exe/markdown-preview-haskell-exe"
        --     },
        -- dependencies={
        --     "nvim-lua/plenary.nvim",
        --     "MunifTanjim/nui.nvim",
        --     "m00qek/baleia.nvim",
        --     "princejoogie/chafa.nvim"}
    },
    { "williamboman/mason.nvim", config = function() require("mason").setup() end },
    {"folke/neoconf.nvim", config = function() require("neoconf").setup() end},
    { "folke/neodev.nvim", opts = {}, config = function() require("neodev").setup() end },
    "williamboman/mason-lspconfig.nvim",
    {"nvim-tree/nvim-tree.lua", config = function() require("nvim-tree").setup({
        view = { width = 50, },
        })
        end
    },
    {
      "julienvincent/hunk.nvim",
      cmd = { "DiffEditor" },
      config = function()
        require("hunk").setup({
            dependencies={
                "MunifTanjim/nui.nvim",
            }
        })
      end,
    },
    "MunifTanjim/nui.nvim",
    "neovim/nvim-lspconfig",
    {"oknozor/illumination", build = {"cd ~/.illumination","./install.sh"} },
    "mfussenegger/nvim-dap",
    "milisims/nvim-luaref",
    "folke/which-key.nvim",
    "folke/trouble.nvim",
    -- { 'projekt0n/github-nvim-theme', name = 'github-theme' },
    { "ellisonleao/gruvbox.nvim", priority = 1000 },
    -- {
    --   "folke/tokyonight.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   opts = {},
    -- },
    -- { "sainnhe/sonokai", priority = 1000 },
    {
    'nvim-lualine/lualine.nvim',
    -- config = function() require('lualine').setup({options = {theme = 'tokyonight'}}) end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    "ms-jpq/coq_nvim",
    "ms-jpq/coq.artifacts",
    -- { "junegunn/fzf", run = "./install --all", tag="0.52.1" },
    { "junegunn/fzf", run = "./install --all"},
    "junegunn/fzf.vim",
    "tpope/vim-fugitive",
    {"lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end},
    {"xiyaowong/transparent.nvim", config = function() require("transparent").setup() end},
    "SirVer/ultisnips",
    "honza/vim-snippets",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "sindrets/diffview.nvim",
    "quangnguyen30192/cmp-nvim-ultisnips",
    {
        "akinsho/bufferline.nvim",
        version="*",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("bufferline").setup{}
        end,
    },
    {"numToStr/Comment.nvim", config = function () require('Comment').setup() end },
    {
        "princejoogie/chafa.nvim",
        dependencies = {"nvim-lua/plenary.nvim", "m00qek/baleia.nvim"},
        config = function()
            require("chafa").setup({
                render = {
                    min_padding = 0,
                    show_label = false,
                },
                events = {
                    update_on_nvim_resize = true,
                },
            })
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end,
    },
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    dev = {
        path="~/Projects"
    },
})

local dap = require('dap')

dap.adapters.coreclr = {
  type = 'executable',
  command = 'netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

dap.adapters.lldb = {
  type = 'executable',
  command = 'lldb-vscode',
  name = "lldb"
}

dap.configurations.rust = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/' .. '')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        initCommands = {},
        runInTerminal = false
    }
}

local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
    }, {})
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name)  -- default handler (optional)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
        }
    end,
}

-- nvim tree keybindings
vim.keymap.set('n', '<space>e', ':NvimTreeFindFileToggle<CR>')

-- nvim dap keybindings
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)


-- transparent keybindings
-- vim.keymap.set('n', '<space>t', ':TransparentToggle<CR>')

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- gitsigns keybindings
vim.keymap.set('n', '<space>gj', ':Gitsigns next_hunk<CR>')
vim.keymap.set('n', '<space>gp', ':Gitsigns preview_hunk<CR>')
vim.keymap.set('n', '<space>gk', ':Gitsigns prev_hunk<CR>')
vim.keymap.set('n', '<space>gr', ':Gitsigns reset_hunk<CR>')
vim.keymap.set('n', '<space>gR', ':Gitsigns reset_buffer<CR>')

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

-- vim.cmd [[colorscheme github_light]]
-- vim.cmd [[colorscheme github_dark]]
vim.cmd [[colorscheme gruvbox]]
-- vim.cmd [[colorscheme tokyonight]]
-- vim.cmd [[colorscheme sonokai]]
