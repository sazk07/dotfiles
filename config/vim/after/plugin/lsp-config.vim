vim9script

def LspSetupServers(): void
  var servers: list<dict<any>> = [
    # Bash
    {
      name: 'bashls',
      filetype: 'sh',
      path: '$HOME/.local/share/nvim/mason/bin/bash-language-server',
      args: ['start'],
    },
    # C / C++
    {
      name: 'clangd',
      filetype: ['c', 'cpp'],
      path: '/usr/bin/clangd',
      args: ['--background-index', '--clang-tidy'],
    },
    # CSS
    {
      name: 'cssls',
      filetype: 'css',
      path: '$HOME/.local/share/nvim/mason/bin/vscode-css-language-server',
      args: ['--stdio'],
    },
    # Emmet
    {
      name: 'emmet_ls',
      filetype: ['css', 'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue'],
      path: '$HOME/.local/share/nvim/mason/bin/emmet-ls',
      args: ['--stdio'],
    },
    # ESlint
    {
      name: 'vscode-eslint-server',
      filetype: ['javascript', 'typescript', 'javascriptreact', 'typescriptreact'],
      path: '$HOME/.local/share/nvim/mason/bin/vscode-eslint-language-server',
      args: ['--stdio'],
    },
    # Go
    {
      name: 'gopls',
      filetype: ['go', 'gomod', 'gowork', 'gotmpl'],
      path: '$HOME/.local/share/nvim/mason/bin/gopls',
      args: ['serve'],
    },
    # HTML
    {
      name: 'html-lsp',
      filetype: 'html',
      path: '$HOME/.local/share/nvim/mason/bin/vscode-html-language-server',
      args: ['--stdio'],
    },
    # JSON
    {
      name: 'jsonls',
      filetype: ['json'],
      path: '$HOME/.local/share/nvim/mason/bin/vscode-json-language-server',
      args: ['--stdio'],
      initializeOptions: { 'provideFormatter': v:true },
    },
    # Lua
    {
      name: 'luals',
      filetype: 'lua',
      path: '$HOME/.local/share/nvim/mason/bin/lua-language-server',
    },
    # Neomake
    {
      name: 'neocmake',
      filetype: 'cmake',
      path: '$HOME/.local/share/nvim/mason/bin/neocmakelsp',
      args: ['--stdio'],
    },
    # Python
    {
      name: 'pyright',
      filetype: 'python',
      path: '$HOME/.local/share/nvim/mason/bin/pyright',
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
      path: '$HOME/.local/share/nvim/mason/bin/sql-language-server',
      args: ['up', '--method', 'stdio'],
    },
    # Tailwindcss
    {
      name: 'tailwindcss',
      filetype: ['astro', 'ejs', 'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte'],
      path: '$HOME/.local/share/nvim/mason/bin/tailwindcss-language-server',
      args: ['--stdio'],
    },
    # TypeScript / JavaScript
    {
      name: 'tsserver',
      filetype: ['javascript', 'typescript', 'javascriptreact', 'typescriptreact'],
      path: '$HOME/.local/share/nvim/mason/bin/typescript-language-server',
      args: ['--stdio'],
    },
    # Vimscript
    {
      name: 'vimls',
      filetype: 'vim',
      path: '$HOME/.local/share/nvim/mason/bin/vim-language-server',
      args: ['--stdio']
    },
    # YAML
    {
      name: 'yaml-language-server',
      filetype: 'yaml',
      path: '$HOME/.local/share/nvim/mason/bin/yaml-language-server',
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


def LspSetupOptions(): void
  var opts: dict<any> = {
    aleSupport: v:true,
    completionMatcher: 'fuzzy',
    outlineOnRight: v:true,
    showInlayHints: v:true,
  }
  g:LspOptionsSet(opts)
enddef


def SetupKeymaps(): void
  # Navigation
  nnoremap <silent> gd         <Cmd>LspGotoDefinition<CR>
  nnoremap <silent> gD         <Cmd>LspGotoDeclaration<CR>
  nnoremap <silent> gi         <Cmd>LspGotoImpl<CR>
  nnoremap <silent> gy         <Cmd>LspGotoTypeDef<CR>
  nnoremap <silent> <leader>vrr         <Cmd>LspShowReferences<CR>
  # Hover / Signature
  nnoremap <silent> K          <Cmd>LspHover<CR>
  inoremap <silent> <C-h>      <Cmd>LspShowSignature<CR>
  # Diagnostics
  nnoremap <silent> [d         <Cmd>LspDiagPrev<CR>
  nnoremap <silent> ]d         <Cmd>LspDiagNext<CR>
  nnoremap <silent> <leader>q  <Cmd>LspDiagShow<CR>
  nnoremap <silent> <leader>vd  <Cmd>LspDiagHere<CR>
  # Refactoring
  nnoremap <silent> <leader>vrn <Cmd>LspRename<CR>
  nnoremap <silent> <leader>vca <Cmd>LspCodeAction<CR>
  vnoremap <silent> <leader>vca <Cmd>LspCodeAction<CR>
  # Formatting
  # nnoremap <silent> <leader>f  <Cmd>LspFormat<CR>
  # vnoremap <silent> <leader>f  <Cmd>LspFormat<CR>
  # Outline / Symbols
  nnoremap <silent> <leader>vso  <Cmd>LspOutline<CR>
  nnoremap <silent> <leader>vws  <Cmd>LspSymbolSearch<CR>
  # Workspace dir
  nnoremap <silent> <leader>vwa <Cmd>LspWorkspaceAddFolder<CR>
  nnoremap <silent> <leader>vwr <Cmd>LspWorkspaceRemoveFolder %:p:h<CR>
  nnoremap <silent> <leader>vwl <Cmd>LspWorkspaceListFolders %:p:h<CR>
enddef

augroup LspInit
  autocmd!
  autocmd User LspSetup LspSetupOptions()
  autocmd User LspSetup LspSetupServers()
  autocmd User LspSetup SetupKeymaps()
augroup END
