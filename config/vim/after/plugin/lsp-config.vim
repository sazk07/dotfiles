vim9script

def LspSetupServers(): void
  var servers: list<dict<any>> = [
    # Bash
    {
      name: 'bashls',
      filetype: 'sh',
      path: 'bash-language-server',
      args: ['start'],
    },
    # C / C++
    {
      name: 'clangd',
      filetype: ['c', 'cpp'],
      path: 'clangd',
      args: ['--background-index', '--clang-tidy'],
    },
    # CSS
    {
      name: 'cssls',
      filetype: 'css',
      path: 'vscode-css-language-server',
      args: ['--stdio'],
    },
    # Go
    {
      name: 'gopls',
      filetype: ['go', 'gomod', 'gowork', 'gotmpl'],
      path: 'gopls',
      args: ['serve'],
    },
    # HTML
    {
      name: 'html-lsp',
      filetype: 'html',
      path: 'vscode-html-language-server',
      args: ['--stdio'],
    },
    # JSON
    {
      name: 'jsonls',
      filetype: ['json'],
      path: 'vscode-json-language-server',
      args: ['--stdio'],
      initializeOptions: { 'provideFormatter': v:true },
    },
    # Lua
    {
      name: 'luals',
      filetype: 'lua',
      path: 'lua-language-server',
    },
    # Neomake
    {
      name: 'neocmake',
      filetype: 'cmake',
      path: 'neocmakelsp',
      args: ['--stdio'],
    },
    # Python
    {
      name: 'pyright',
      filetype: 'python',
      path: 'pyright',
      args: ['--stdio'],
      workspaceConfig: {
      python: {
      pythonPath: '/usr/bin/python3',
      }},
    },
    # SQL
    {
      name: 'sqlls',
      filetype: 'sql',
      path: 'sql-language-server',
      args: ['up', '--method', 'stdio'],
    },
    # Tailwindcss
    {
      name: 'tailwindcss',
      filetype: ['astro', 'ejs', 'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte'],
      path: 'tailwindcss-language-server',
      args: ['--stdio'],
    },
    # TypeScript / JavaScript
    {
      name: 'tsserver',
      filetype: ['javascript', 'typescript', 'javascriptreact', 'typescriptreact'],
      path: 'typescript-language-server',
      args: ['--stdio'],
    },
    # Vimscript
    {
      name: 'vimls',
      filetype: 'vim',
      path: 'vim-language-server',
      args: ['--stdio']
    },
    # Vue
    {
      name: 'vue_ls',
      filetype: 'vue',
      path: 'vue-language-server',
      args: ['--stdio']
    },
    # YAML
    {
      name: 'yaml-language-server',
      filetype: 'yaml',
      path: 'yaml-language-server',
      args: ['--stdio'],
      workspaceConfig: {
      yaml: {
      schemas: {
      "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json": ["**/*docker-compose*.yaml"],
      "https://json.schemastore.org/chart.json": ["**helm/values*.yaml"]
      }}},
    }
  ]
  g:LspAddServer(servers)
enddef

def DetectJsRuntime(): void
  var deno_config = findfile('deno.json', '.;')
  if empty(deno_config)
    deno_config = findfile('deno.jsonc', '.;')
  endif

  if !empty(deno_config)
    # Deno project detected
    # deno lsp provides lint + type-checking; deno fmt provides formatting.
    g:LspAddServer([{
      name: 'deno',
      filetype: ['javascript', 'typescript', 'javascriptreact', 'typescriptreact'],
      path: 'deno',
      args: ['lsp'],
      initializationOptions: {
        enable: v:true,
        lint: v:true
      }
    }])
  else
    g:LspAddServer([{
    name: 'vscode-eslint-server',
    filetype: ['javascript', 'typescript', 'javascriptreact', 'typescriptreact'],
    path: 'vscode-eslint-language-server',
    args: ['--stdio'],
    }])
  endif
  # Node/Bun: no b: override needed — global g:ale_linters/fixers are used.
enddef

augroup JsRuntimeDetect
  autocmd!
  autocmd BufRead,BufNewFile *.ts,*.tsx,*.js,*.jsx,*.mts,*.cts,*.mjs,*.cjs DetectJsRuntime()
augroup END

def LspSetupOptions(): void
  var opts: dict<any> = {
    aleSupport: true,
    completionMatcher: 'fuzzy',
    outlineOnRight: true,
    showInlayHints: true,
  }
  g:LspOptionsSet(opts)
enddef

augroup LspInit
  autocmd!
  autocmd User LspSetup LspSetupOptions()
  autocmd User LspSetup LspSetupServers()
augroup END
