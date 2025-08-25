return {
    "github/copilot.vim",
    {
      "nvim-neotest/neotest",
      dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter"
      }
    },
    "nsidorenco/neotest-vstest",
    {
        "misaelaguayo/markdown.nvim",
        dev = true,
        opts = {
        },
    },
    { "williamboman/mason.nvim", config = function() require("mason").setup({
        -- registries = {
        --     "github:mason-org/mason-registry",
        --     "github:CrashDummyy/mason-registry",
        -- },
    }) end },
    { "williamboman/mason-lspconfig.nvim"},
    {
      "luckasRanarison/tailwind-tools.nvim",
      name = "tailwind-tools",
      build = ":UpdateRemotePlugins",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim", -- optional
        "neovim/nvim-lspconfig", -- optional
      },
      opts = {} -- your configuration
    },
    {
        "folke/neodev.nvim",
        opts = {},
        config = function()
            require("neodev").setup()
        end
    },
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
    { "folke/trouble.nvim", opts = {}, cmd = "Trouble" },
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
