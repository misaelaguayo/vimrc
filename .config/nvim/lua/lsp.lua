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
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
        }
    end,

    ["omnisharp"] = function()
        require("lspconfig").omnisharp.setup {
            capabilities = capabilities,
            -- on_attach = function(_, bufnr)
            --     vim.api.nvim_create_autocmd("BufWritePost", {
            --         group = augroup,
            --         buffer = bufnr,
            --         callback = function()
            --             vim.cmd("!dotnet csharpier .")
            --         end,
            --     })
            -- end
        }
    end,

    ["ts_ls"] = function()
        require("lspconfig").ts_ls.setup {
            capabilities = capabilities,
            on_attach = function(_, bufnr)
                vim.api.nvim_create_autocmd("BufWritePost", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        -- vim.cmd("!yarn format")
                    end,
                })
            end
        }
    end,

    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        }
    end,
}
