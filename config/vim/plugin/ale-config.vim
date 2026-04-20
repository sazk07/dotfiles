vim9script

# Core Behaviour
# Only run linters that are explicitly listed — no auto-detection surprises.
g:ale_linters_explicit = 1
# When to lint (balance responsiveness vs CPU):
#   'normal'  → after you stop typing and leave insert mode
#   'always'  → while typing (more responsive, heavier)
#   0         → disabled while typing
g:ale_lint_on_text_changed = 'normal'
g:ale_lint_on_insert_leave = 1
g:ale_lint_on_enter = 1
g:ale_lint_on_save = 1
g:ale_lint_delay = 300
# Keep sign column always visible to prevent layout shift on lint results.
g:ale_sign_column_always = 1

# ── Python: respect virtualenvs (pipenv / poetry) ────────────────────────────
g:ale_python_auto_pipenv = 1
g:ale_python_auto_poetry = 1

# Completion
# ALE's built-in LSP completion (no external plugin required).
g:ale_completion_enabled = 1
# auto-insert missing imports on accept
g:ale_completion_autoimport = 1
# Make ALE the omni-completion function.
set omnifunc=ale#completion#OmniFunc
# Completion menu behaviour:
#   menu      → show popup even for single match
#   menuone   → always show menu
#   noinsert  → don't auto-insert until you confirm
#   noselect  → don't auto-select first item
#   popup     → inline doc floating window (Vim 8.1.1882+ / Vim 9)
set completeopt=menu,menuone,noinsert,noselect
if has('patch-8.1.1882') || v:version >= 900
  set completeopt+=popup
endif

# UI & Signs
g:ale_sign_error = '✘'
g:ale_sign_warning = '▲'
g:ale_sign_info = '●'
g:ale_sign_style_error = '✦'
g:ale_sign_style_warning = '✦'
# Message format shown in the command line on cursor hold.
g:ale_echo_msg_format    = '[%linter%] %s [%severity%]'
g:ale_echo_msg_error_str   = 'E'
g:ale_echo_msg_warning_str = 'W'
g:ale_echo_msg_info_str    = 'I'
# Use floating popup for hover/detail if available; fall back to preview window.
if has('popupwin')
  g:ale_floating_preview          = 1
  g:ale_detail_to_floating_preview = 1
  g:ale_hover_to_floating_preview  = 1
else
  g:ale_hover_to_preview = 1
endif
# Show cursor hover automatically on cursor hold.
g:ale_hover_cursor = 1

# Virtual Text (optional)
# Set to 0 if you find it noisy.
if has('textprop')
  g:ale_virtualtext_cursor = 'current'   
endif

# Linters
# Shell — follow `source` / `.` directives across files
g:ale_sh_shellcheck_options = '-x'

# Lua — expose the `vim` global when editing Neovim/Vim config; remove if unused
g:ale_lua_luacheck_options = '--globals vim'

# SQL — sqlfluff reads a project-local .sqlfluff file first; this flag is only
# the fallback when no project config is found.
# For per-project dialect switching create a .sqlfluff at your project root:
#
#   [sqlfluff]
#   dialect = mysql        # or sqlite, postgres
#
# To override for a single buffer without a project file you can set:
#   b:ale_sql_sqlfluff_options = '--dialect sqlite'
g:ale_sql_sqlfluff_options = '--dialect postgres'

# Markdown / prose
g:ale_markdown_vale_use_global = 1

# JS/TS entries here are the Node/Bun defaults.
# Deno projects override them per-buffer — see §9.
# JS/TS (Node defaults — Deno projects override these per-buffer in §9)
g:ale_linters = {}
g:ale_linters['javascript'] = ['eslint']
g:ale_linters['javascriptreact'] = ['eslint']
g:ale_linters['typescript'] = ['tsserver', 'eslint']
g:ale_linters['typescriptreact'] = ['tsserver', 'eslint']
# Frontend frameworks
g:ale_linters['vue'] = ['vue_ls', 'eslint']
g:ale_linters['astro'] = ['astro-ls', 'eslint']
g:ale_linters['svelte'] = ['eslint']
g:ale_linters['html'] = ['vscodehtml']
g:ale_linters['css'] = ['vscodecss']
g:ale_linters['scss'] = ['vscodecss']
g:ale_linters['less'] = ['vscodecss']
# Python
g:ale_linters['python'] = ['pyright', 'ruff', 'mypy']
# Go
g:ale_linters['go'] = ['gopls']
# Lua
g:ale_linters['lua'] = ['lua_language_server']
# Shell
g:ale_linters['sh'] = ['shellcheck', 'bash-language-server']
g:ale_linters['bash'] = ['shellcheck', 'bash-language-server']
# Config / data
g:ale_linters['json'] = ['vscodejson']
g:ale_linters['jsonc'] = ['eslint']
g:ale_linters['yaml'] = ['yamlls']
g:ale_linters['sql'] = ['sqlfluff']
# Vim
g:ale_linters['vim'] = ['vimls']
# LaTeX
g:ale_linters['tex'] = ['vale']
g:ale_linters['markdown'] = ['vale']
# CMake (cmake_lint wraps the cmakelint Python tool — see §8)
g:ale_linters['cmake'] = ['cmake_lint']
# C / C++ (via clangd — useful when working with CMake projects)
g:ale_linters['c'] = ['clangd']
g:ale_linters['cpp'] = ['clangd']

# Fixers / Formatters
# '*' applies to ALL filetypes before type-specific fixers run.
# Order within each list matters: fixers run left → right.
g:ale_fixers = { 
  '*': ['remove_trailing_lines', 'trim_whitespace'],
  'javascript': ['prettier', 'eslint'],
  'javascriptreact': ['prettier', 'eslint'],
  'typescript': ['prettier', 'eslint'],
  'typescriptreact': ['prettier', 'eslint'],
  'vue': ['prettier'],
  'astro': ['prettier'],
  'svelte': ['prettier'],
  'html': ['prettier'],
  'css': ['prettier'],
  'scss': ['prettier'],
  'less': ['prettier'],
  'python': ['black', 'ruff'],
  'go': ['goimports', 'gofmt'],
  'lua': ['stylua'],
  'sh': ['shfmt'],
  'bash': ['shfmt'],
  'json': ['prettier'],
  'jsonc': ['prettier'],
  'yaml': ['prettier'],
  'sql': [],
  'vim': [],
  'tex': ['latexindent'],
  'markdown': ['prettier', 'mdformat'],
  'cmake': [],
  'c': ['clang-format'],
  'cpp': ['clang-format']
}

# Per-tool Options
# ESLint
# Use project-local eslint (node_modules/.bin/eslint), not a global one.
# Prevents version mismatches across projects.
g:ale_javascript_eslint_use_global = 0

# Prettier
# Read .prettierrc / prettier.config.js from project root.
g:ale_javascript_prettier_use_local_config = 1

# Python
# ruff auto-discovers pyproject.toml / ruff.toml — no extra settings needed.
# mypy: optionally point to a config file if not using pyproject.toml
# g:ale_python_mypy_options = '--config-file /path/to/mypy.ini'
# Uncomment if you use a virtual environment and want ALE to find it:
# g:ale_python_auto_virtualenv = 1

# Go 
# golines: target line length (adjust to your preference).
g:ale_go_golines_options = '--max-len=120'
# goimports-reviser: set your module path if needed.
# g:ale_go_goimports_reviser_options = '-project-name your/module'

# LaTeX
# latexindent: -m merges continuation lines, -l loads localSettings.yaml.
g:ale_tex_latexindent_options = '-m -l'

# CMake
# cmake_lint wraps the cmakelint Python tool (pip install cmakelint).
# Optionally set lint rules:
# g:ale_cmake_cmake_lint_options = '--disabled-codes=C0301'

# Deno vs Node/Bun Detection
# Walks up from the current file looking for deno.json / deno.jsonc.
# If found → switches this buffer to Deno linters/fixers.
# If not   → the global g:ale_linters / g:ale_fixers (Node defaults) apply.
#
# b:ale_linters and b:ale_fixers override the global defaults per buffer.
def DetectJsRuntime(): void
  var deno_config = findfile('deno.json', '.;')
  if empty(deno_config)
    deno_config = findfile('deno.jsonc', '.;')
  endif

  if !empty(deno_config)
    # Deno project detected
    # deno lsp provides lint + type-checking; deno fmt provides formatting.
    b:ale_linters = {
      'typescript': ['deno'],
      'typescriptreact': ['deno'],
      'javascript': ['deno'],
      'javascriptreact': ['deno'],
    }
    b:ale_fixers = {
      'typescript': ['deno'],
      'typescriptreact': ['deno'],
      'javascript': ['deno'],
      'javascriptreact': ['deno'],
    }
  endif
  # Node/Bun: no b: override needed — global g:ale_linters/fixers are used.
enddef

augroup ALEJsRuntimeDetect
  autocmd!
  autocmd BufRead,BufNewFile *.ts,*.tsx,*.js,*.jsx,*.mts,*.cts,*.mjs,*.cjs DetectJsRuntime()
augroup END

# Filetype Detection
# Vim may not detect these out of the box without a polyglot-style plugin.
augroup ALEFiletypeDetect
  autocmd!
  autocmd BufRead,BufNewFile *.astro setfiletype astro
  autocmd BufRead,BufNewFile *.svelte setfiletype svelte
  autocmd BufRead,BufNewFile *.tsx setfiletype typescriptreact
  autocmd BufRead,BufNewFile *.jsx setfiletype javascriptreact
  autocmd BufRead,BufNewFile *.jsonc setfiletype jsonc
  # tsconfig / jsconfig are JSONC (allow comments)
  autocmd BufRead,BufNewFile tsconfig*.json setfiletype jsonc
  autocmd BufRead,BufNewFile jsconfig*.json setfiletype jsonc
augroup END

# Key Mappings
# Navigation
nnoremap <silent> gd <Plug>(ale_go_to_definition)
nnoremap <silent> gD <Plug>(ale_go_to_definition_in_vsplit)
nnoremap <silent> gy <Plug>(ale_go_to_type_definition)
nnoremap <silent> <leader>vrr <Plug>(ale_find_references)
nnoremap <silent> K <Plug>(ale_hover)
# Refactoring
nnoremap <silent> <leader>vrn <Plug>(ale_rename)
nnoremap <silent> <leader>vca <Plug>(ale_code_action)
# Diagnostics jump
nnoremap <silent> [d <Plug>(ale_previous_wrap)
nnoremap <silent> ]d <Plug>(ale_next_wrap)
nnoremap <silent> [e <Plug>(ale_previous_wrap_error)
nnoremap <silent> ]e <Plug>(ale_next_wrap_error)
nnoremap <silent> <leader>vd <Cmd>ALEDetail<CR>
# Manual actions
nnoremap <silent> <leader>fx <Cmd>ALEFix<CR>
nnoremap <silent> <leader>al <Cmd>ALEToggle<CR>
nnoremap <silent> <leader>ai <Cmd>ALEInfo<CR>
