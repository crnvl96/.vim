vim9script

if exists("g:loaded_lsp")
    set omnifunc=g:LspOmniFunc
    set complete+=o

    au BufWritePre * :LspFormat

    nnoremap ]d :LspDiag next<cr>
    nnoremap [d :LspDiag prev<cr>

    nnoremap ga :LspCodeAction<cr>
    nnoremap gD :LspGotoDeclaration<cr>
    nnoremap gd :LspGotoDefinition<cr>
    nnoremap gi :LspGotoImpl<cr>
    nnoremap gy :LspGotoTypeDef<cr>
    nnoremap gn :LspRename<cr>
    nnoremap gr :LspShowReferences<cr>
    nnoremap ge :LspDiag show<cr>
    nnoremap gs :LspDocumentSymbol<cr>

    nnoremap H :LspFormat<cr>
    nnoremap E :LspDiag current<cr>
    nnoremap K :LspHover<cr>

    inoremap <c-k> :LspShowSignature<cr>

    g:LspOptionsSet({
        diagSignErrorText: 'E',
        diagSignHintText: 'H',
        diagSignInfoText: 'I',
        diagSignWarningText: 'W',
    })

    g:LspAddServer([{
        name: 'pyright',
        filetype: ['python'],
        path: 'pyright-langserver',
        args: ['--stdio'],
        workspaceConfig: {
            pyright: {
                disableOrganizeImports: true, # Using Ruff's import organizer
            },
            python: {
                analysis: {
                    ignore: ['*'], # Ignore all files for analysis to exclusively use Ruff for linting
                    autoSearchPaths: true,
                    useLibraryCodeForTypes: true,
                    diagnosticMode: 'openFilesOnly',
                },
            },
        }
    }])

    g:LspAddServer([{
        name: 'ruff',
        filetype: ['python'],
        path: 'ruff',
        args: ['server'],
        initializationOptions: {
            settings: {
                logLevel: 'debug',
                lint: { enable: true },
                format: { backend: 'uv' },
            },
        },
        capabilities: {
            general: { positionEncodings: ['utf-16'] },
        },
    }])

    g:LspAddServer([{
        name: 'gopls',
        filetype: ['go'],
        path: 'gopls',
        args: [],
        workspaceConfig: {
            gopls: {
                gofumpt: true
            },
        }
    }])

    g:LspAddServer([{
        name: 'tsgo',
        filetype: ['typescript'],
        path: 'tsgo',
        args: ['--lsp', '--stdio'],
        features: {
            documentFormatting: false,
        },
    }])

    g:LspAddServer([{
        name: 'efm-langserver',
        filetype: [
            'lua',
            'typescript',
            'markdown',
            'json',
            'jsonc',
            'yaml'
        ],
        path: 'efm-langserver',
        args: [],
        initializationOptions: {
            documentFormatting: true,
        },
        workspaceConfig: {
            languages: {
                lua: [{
                    formatCommand: "stylua --color Never --stdin-filepath '${INPUT}' -",
                    formatStdin: true
                }],
                markdown: [{
                    formatCommand: "prettier --parser markdown --stdin-filepath '${INPUT}'",
                    formatStdin: true
                }],
                json: [{
                    formatCommand: "prettier --parser json --stdin-filepath '${INPUT}'",
                    formatStdin: true
                }],
                jsonc: [{
                    formatCommand: "prettier --parser json --stdin-filepath '${INPUT}'",
                    formatStdin: true
                }],
                yaml: [{
                    formatCommand: "prettier --parser yaml --stdin-filepath '${INPUT}'",
                    formatStdin: true
                }],
            },
        }
    }])
endif
