vim9script

g:ale_virtualtext_cursor = 'current'
g:ale_sign_error = '>>'
g:ale_sign_warning = '--'
g:airline#extensions#ale#enabled = 1
b:ale_fixers = {'javascript': ['eslint']}
g:ale_completion_enabled = 1
