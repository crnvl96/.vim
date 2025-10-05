vim9script

if exists("g:loaded_lsp")
    set omnifunc=g:LspOmniFunc
    set cpt+=o

    au BufWritePre * :LspFormat

    nnoremap ]d :LspDiag next<cr>
    nnoremap [d :LspDiag prev<cr>

    nnoremap ga :LspCodeAction<cr>
    nnoremap gD :LspGotoDeclaration<cr>
    nnoremap gd :LspGotoDefinition<cr>
    nnoremap gi :LspGotoImpl<cr>
    nnoremap gy :LspGotoTypeDef<cr>
    nnoremap gr :LspPeekReferences<cr>
    nnoremap gn :LspRename<cr>
    nnoremap gr :LspShowReferences<cr>
    nnoremap gs :LspSymbolSearch<cr>

    nnoremap H :LspFormat<cr>
    nnoremap E :LspDiag current<cr>
    nnoremap S :LspDiag show<cr>
    nnoremap K :LspHover<cr>

    inoremap <c-k> :LspDocumentSymbol<cr>
    inoremap <c-l> :LspShowSignature<cr>

    g:LspOptionsSet({
        autoComplete: true,
        filterCompletionDuplicates: true,
        completionMatcher: 'fuzzy',
        usePopupInCodeAction: true,
        showInlayHints: true,
        showDiagOnStatusLine: false,
        showDiagWithVirtualText: true,
        diagVirtualTextAlign: 'after',
        autoPopulateDiags: true,
        popupBorder: true,
        popupHighlight: 'Normal',
        popupBorderHighlight: 'Normal',
    })

    g:LspAddServer([{
        name: 'ruff',
        filetype: ['python'],
        path: 'ruff',
        args: ['server'],
        workspaceConfig: {
            init_options: {
                settings: {
                    logLevel: 'debug',
                    fixAll: true,
                    organizeImports: true,
                    lint: { enable: true },
                    format: { backend: 'uv' },
                },
            },
            capabilities: {
                general: { positionEncodings: ['utf-16'] },
            },
        }
    },
    {
        name: 'pyright',
        filetype: ['python'],
        path: 'pyright-langserver',
        args: ['--stdio'],
        workspaceConfig: {
            settings: {
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
            },
        }
    },
    {
        name: 'gopls',
        filetype: ['go'],
        path: 'gopls',
        workspaceConfig: {
            settings: {
                gopls: {
                    gofumpt: true
                }
            },
        }
    }])
endif
