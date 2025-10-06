vim9script

if exists("g:loaded_lsp")
    set omnifunc=g:LspOmniFunc

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

    nnoremap E :LspDiag current<cr>
    nnoremap K :LspHover<cr>

    inoremap <c-x><c-o> <c-\><c-o>:call lsp#completion#LspComplete(v:true)<cr>


    g:LspOptionsSet({
        diagSignErrorText: 'E',
        diagSignHintText: 'H',
        diagSignInfoText: 'I',
        diagSignWarningText: 'W',
        completionMatcher: 'fuzzy',
        showSignature: false,
    })

    g:LspAddServer([{
        name: 'pyright',
        filetype: ['python'],
        path: 'pyright-langserver',
        args: ['--stdio'],
        features: {
            documentFormatting: false
        },
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
        name: 'gopls',
        filetype: ['go'],
        path: 'gopls',
        args: [],
        features: {
            documentFormatting: false
        },
        workspaceConfig: {
            gopls: {
                gofumpt: true
            },
        }
    }])

    g:LspAddServer([{
        name: 'typescript-language-server',
        filetype: ['typescript', 'javascript'],
        path: 'typescript-language-server',
        args: ['--stdio'],
        features: {
            documentFormatting: false,
        },
    }])
endif
