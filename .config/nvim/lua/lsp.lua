local dap = require('dap')

dap.adapters.coreclr = {
    type = 'executable',
    command = '/Users/misael/.nix-profile/bin/netcoredbg',
    args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug' .. '/', 'file')
        end,
    },
}

dap.adapters.lldb = {
    type = 'executable',
    command = '/Users/misael/.nix-profile/bin/lldb-dap',
    name = 'lldb',
}

dap.configurations.rust = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug' .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        args = {},
    }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup{
    automatic_enable = {
        exclude = {
            "lua_ls",
        }
    }
}

require("lspconfig").lua_ls.setup {
    cmd = { "lua-language-server" },
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
}
