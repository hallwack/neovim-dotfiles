local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')

local function on_attach(bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return {
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = vim.loop.cwd
    }
end

local function setup_servers()
    lspinstall.setup()
    local servers = lspinstall.installed_servers()
    table.insert(servers, "html")
    table.insert(servers, "cssls")
    table.insert(servers, "jsonls")
    table.insert(servers, "dartls")
    table.insert(servers, "tsserver")

    for _, lang in pairs(servers) do
        local config = make_config()

        if lang == "lua" then
            config.settings = {
                Lua = {
                    diagnostics = {globals = {'vim'}},
                    workspace = {
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                        }
                    },
                    telemetry = {enable = false}
                }
            }
        end

        if lang == "dartls" then
            config.settings = {
                cmd = {'dart', '~/Android/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot', '--lsp'},
                filetypes = {"dart"},
                init_options = {
                  closingLabels = true,
                  flutterOutline = true,
                  onlyAnalyzeProjectsWithOpenFiles = false,
                  outline = false,
                  suggestFromUnimportedLibraries = true
                }
            }
        end

        if lang == "html" then
            config.filetypes = {"html", "javascript.react", "jsx"}
        end

        lspconfig[lang].setup(config)
    end
end

setup_servers()

lspinstall.post_install_hook = function()
    setup_servers()
    vim.cmd("bufdo e")
end

-- replace the default lsp diagnostic symbols
function lspsymbol(name, icon)
    vim.fn.sign_define("LspDiagnosticsSign" .. name,
                       {text = icon, numhl = "LspDiagnosticsDefaul" .. name})
end

lspsymbol("Error", "")
lspsymbol("Warning", "")
lspsymbol("Information", "")
lspsymbol("Hint", "")

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {prefix = "", spacing = 0},
        signs = true,
        underline = true,
        -- set this to true if you want diagnostics to show in insert mode
        update_in_insert = false
    })
