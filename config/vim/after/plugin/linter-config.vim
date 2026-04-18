vim9script

g:ale_virtualtext_cursor = 'current'
g:ale_sign_error = 'E'
g:ale_sign_warning = 'W'
g:airline#extensions#ale#enabled = 1
g:ale_completion_enabled = 1
g:ale_linters_explicit = 1

def GetProjectType(): string
    if !empty(findfile('deno.json', '.;')) || !empty(findfile('deno.jsonc', '.;'))
        return 'deno'
    endif
    return 'node'
enddef

def SetAleLinters(): void
    var projectType = GetProjectType()
    if projectType == 'deno'
        g:ale_fixers = {
            'javascript': ['deno'],
            'typescript': ['deno'],
            'python': ['black', 'ruff', 'mypy']
        }
    else
        g:ale_fixers = {
            'javascript': ['eslint'],
            'typescript': ['eslint'],
            'python': ['black', 'ruff', 'mypy']
        }
    endif
enddef

SetAleLinters()
