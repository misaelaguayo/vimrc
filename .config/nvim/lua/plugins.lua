return {
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        ---@module 'roslyn.config',
        ---@type RoslynNvimConfig,
        opts = {
            exe = {"Microsoft.CodeAnalysis.LanguageServer"}
        }
    },
    "github/copilot.vim",
    { "OXY2DEV/markview.nvim", lazy = false },
    {
        "misaelaguayo/markdown.nvim",
        dev = true,
        opts = {
        },
    },
    { "williamboman/mason.nvim", config = function() require("mason").setup() end },
    { "folke/neoconf.nvim",      config = function() require("neoconf").setup() end },
    {
        "folke/neodev.nvim",
        opts = {},
        config = function()
            require("neodev").setup()
        end
    },
    "williamboman/mason-lspconfig.nvim",
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
                view = { width = 50, },
            })
        end
    },
    {
        "julienvincent/hunk.nvim",
        cmd = { "DiffEditor" },
        config = function()
            require("hunk").setup({
                dependencies = {
                    "MunifTanjim/nui.nvim",
                }
            })
        end,
    },
    "MunifTanjim/nui.nvim",
    "neovim/nvim-lspconfig",
    { "oknozor/illumination",     build = { "cd ~/.illumination", "./install.sh" } },
    "mfussenegger/nvim-dap",
    "milisims/nvim-luaref",
    "folke/which-key.nvim",
    "folke/trouble.nvim",
    { "ellisonleao/gruvbox.nvim", priority = 1000 },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    "ms-jpq/coq_nvim",
    "ms-jpq/coq.artifacts",
    {
        "junegunn/fzf",
        dev = true
    },
    "junegunn/fzf.vim",
    "tpope/vim-fugitive",
    { "lewis6991/gitsigns.nvim",    config = function() require("gitsigns").setup() end },
    { "xiyaowong/transparent.nvim", config = function() require("transparent").setup() end },
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
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("bufferline").setup {}
        end,
    },
    { "numToStr/Comment.nvim", config = function() require('Comment').setup() end },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end,
    }
}
