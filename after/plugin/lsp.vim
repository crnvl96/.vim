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
        autoComplete: true,
        filterCompletionDuplicates: true,
        completionMatcher: 'fuzzy',
        usePopupInCodeAction: true,
        showDiagOnStatusLine: false,
        showDiagWithVirtualText: true,
        diagVirtualTextAlign: 'after',
        autoPopulateDiags: true,
        popupHighlight: 'Pmenu',
    })

    g:LspAddServer([
        {
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
        },
        {
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
        },
        {
            name: 'gopls',
            filetype: ['go'],
            path: 'gopls',
            args: [],
            workspaceConfig: {
                gopls: {
                    gofumpt: true
                },
            }
        },
        {
            name: 'vscode-eslint-language-server',
            filetype: ['typescript'],
            path: 'vscode-eslint-language-server',
            args: ['--stdio'],
            features: {
                documentFormatting: false,
                diagnostics: true
            },
            workspaceConfig: {
                validate: 'on',
                packageManager: null,
                useESLintClass: false,
                experimental: { useFlatConfig: false },
                codeActionOnSave: { enable: false, mode: 'all' },
                format: false,
                quiet: false,
                onIgnoredFiles: 'off',
                options: {},
                rulesCustomizations: {},
                run: 'onType',
                problems: { shortenToSingleLine: false },
                nodePath: '',
                workingDirectory: { mode: 'location' },
                codeAction: {
                    disableRuleComment: { enable: true, location: 'separateLine' },
                    showDocumentation: { enable: true },
                },
            },
        },
        {
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
                diagnostics: false
            },
            features: {
                documentFormatting: true,
                diagnostics: false
            },
            workspaceConfig: {
                languages: {
                    lua: [{
                        formatCommand: "stylua --color Never --stdin-filepath '${INPUT}' -",
                        formatStdin: true
                    }],
                    typescript: [{
                        formatCommand: "prettier --stdin-filepath '${INPUT}'",
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
        },
    ])
endif
