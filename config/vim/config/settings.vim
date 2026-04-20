vim9script

set number
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
# wrap long lines at word boundaries
set linebreak
# disable creation of swap file
set noswapfile
# undo dir
set undodir=$HOME/.vim/undodir
set undofile
set ignorecase
set smartcase
# incremental search
set incsearch
# for git gutter
set signcolumn=yes
# add @ to list of valid filename
set isfname+=@-@
# write swap file and update CursorHold events every 50 ms
set updatetime=50
# highlight column
set colorcolumn=80
# allow % to jump between < and > tags
set mps+=<:>
# redraw only when we need to
set lazyredraw
# encoding settings
set encoding=utf-8
# line ending format preference
set fileformats=unix,dos
# enable true color
set termguicolors
# theme
set background=dark
colorscheme catppuccin
# display partial commands in bottom right
set showcmd
set cursorline
set mouse=a
# Set different cursor shapes for different modes
&t_SI = "\e[6 q"  # Insert mode: vertical bar (thin cursor)
&t_EI = "\e[2 q"  # Normal mode: block cursor
# add a program to runtime path
set rtp+=/usr/bin/fzf

# ========================
# Highlight multi-line yank (Vim 9.2, pure Vimscript)
def HighlightYankMultiline(): void
    if !exists('*matchaddpos')
        return
    endif
    var start = getpos("'[")
    var end   = getpos("']")
    var sline = start[1]
    var scol  = start[2]
    var eline = end[1]
    var ecol  = end[2]
    var positions = []
    # Single-line yank
    if sline == eline
        positions->add([sline, scol, ecol - scol + 1])
    else
        # First line (from scol → end)
        positions->add([sline, scol, col('$') - scol])
        # Middle full lines
        for lnum in range(sline + 1, eline - 1)
            positions->add([lnum])
        endfor
        # Last line (start → ecol)
        positions->add([eline, 1, ecol])
    endif
    var id = matchaddpos('IncSearch', positions, 10)
    redraw
    sleep 300m
    matchdelete(id)
enddef

augroup YankHighlight
    autocmd!
    autocmd TextYankPost * HighlightYankMultiline()
augroup END

# ========================
# Remove trailing whitespace on save
augroup TrimWhitespace
    autocmd!
    autocmd BufWritePre * silent! %s/\s\+$//e
augroup END

# ========================
# Disable automatic commenting on new lines
augroup NoAutoComment
    autocmd!
    autocmd BufAdd * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

# ========================
# Disable line length marker for specific filetypes
augroup setLineLength
    autocmd!
    autocmd FileType text,markdown,html,xhtml setlocal colorcolumn=0
augroup END

# ========================
# Terminal settings:
command! Term botright term
augroup TerminalSettings
    # Open a Terminal on the right tab
    autocmd!
    # Enter insert mode and adjust settings when opening terminal
    autocmd BufEnter * if &buftype == 'terminal' | setlocal listchar= nonumber norelativenumber nocursorline | startinsert | endif
    # Exit insert mode when leaving terminal buffer
    autocmd BufLeave * if &buftype == 'terminal' | stopinsert | endif
augroup END

# ========================
# AutoFormat on save
# Toggle autoformat on save

def FormatEnable(): void
    # Remove any existing format autocmds to avoid duplicates
    augroup ALEFix
        autocmd!
        autocmd BufWritePre * if expand('<afile>:p') !~# '/node_modules/' | ALEFix | endif
    augroup END
    g:ale_fix_on_save = 1
    echo "Autoformat enabled globally (excluding node_modules/)"
enddef

def FormatDisable(bang: bool): void
    if bang
        # Bang provided: disable for current buffer only
        b:ale_fix_on_save = 0
        # Override the global autocmd for this buffer
        autocmd! ALEFix BufWritePre <buffer>
        echo "Autoformat disabled for current buffer"
    else
        # No bang: disable globally
        augroup ALEFix
            autocmd!
        augroup END
        g:ale_fix_on_save = 0
        echo "Autoformat disabled globally"
    endif
enddef

command! FormatEnable  FormatEnable()
command! -bang FormatDisable FormatDisable(<bang>0)

# indentLine plugin setting
g:indentLine_enabled = 0
