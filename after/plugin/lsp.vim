vim9script

# ----------------------------------------------------------------------
# LSP

if exists("g:loaded_lsp")
    # ----------------------------------------------------------------------
    # Completion

    set omnifunc=g:LspOmniFunc
    set cpt+=o

    # ----------------------------------------------------------------------
    # Formatting

    au BufWritePre * :LspFormat

    # ----------------------------------------------------------------------
    # Keymaps

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

    # ----------------------------------------------------------------------
    # Setup

    g:LspOptionsSet({
        autoComplete: true,
        filterCompletionDuplicates: true,
        completionMatcher: 'fuzzy',
        usePopupInCodeAction: true,
        showInlayHints: true,
        showDiagOnStatusLine: true,
        showDiagWithVirtualText: true,
        diagVirtualTextAlign: 'after',
        autoPopulateDiags: true,
        popupBorder: false,
        popupHighlight: 'Pum',
        popupBorderHighlight: 'Normal',
    })

    # ----------------------------------------------------------------------
    # Python

    if executable('ruff')
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
        }])
    endif

    if executable('pyright')
        g:LspAddServer([{
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
        }])
    endif

    # ----------------------------------------------------------------------
    # Go

    if executable('gopls')
        g:LspAddServer([{
            name: 'gopls',
            filetype: ['go'],
            path: 'gopls',
            workspaceConfig: {
                settings: {
                    gopls: {
                        gofumpt: true,
                        staticcheck: true,
                        semanticTokens: true,
                        codelenses: {
                            gc_details: true,
                            generate: true,
                            run_govulncheck: true,
                            test: true,
                            tidy: true,
                            upgrade_dependency: true,
                        },
                        analyses: {
                            nilness: true,
                            unusedparams: true,
                            unusedvariable: true,
                            unusedwrite: true,
                            useany: true,
                            ST1000: false, # Incorrect or missing package comment
                        },
                        directoryFilters: ['-.git', '-node_modules']
                    }
                },
            }
        }])
    endif
endif
