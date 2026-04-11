set number
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
" wrap long lines at word boundaries
set linebreak
" disable creation of swap file
set noswapfile
" undo dir
set undodir=$HOME/.vim/undodir
set undofile
set ignorecase
set smartcase
" incremental search
set incsearch
" for git gutter
set signcolumn=yes
" add @ to list of valid filename
set isfname+=@-@
" write swap file and update CursorHold events every 50 ms
set updatetime=50
" highlight column
set colorcolumn=80
" allow % to jump between < and > tags
set mps+=<:>
" redraw only when we need to
set lazyredraw
" encoding settings
set encoding=utf-8
" line ending format preference
set fileformats=unix,dos
" enable true color
set termguicolors
" theme
set background=dark
colorscheme catppuccin
" display partial commands in bottom right
set showcmd
set cursorline
set mouse=a
" Set different cursor shapes for different modes
let &t_SI = "\e[6 q"  " Insert mode: vertical bar (thin cursor)
let &t_EI = "\e[2 q"  " Normal mode: block cursor
" add a program to runtime path
set rtp+=/usr/bin/fzf

" ========================
" Highlight multi-line yank (Vim 9.2, pure Vimscript)
augroup YankHighlight
    autocmd!
    autocmd TextYankPost * call s:highlight_yank_multiline()
augroup END

function! s:highlight_yank_multiline() abort
    if !exists('*matchaddpos')
        return
    endif

    let l:start = getpos("'[")
    let l:end   = getpos("']")

    let l:sline = l:start[1]
    let l:scol  = l:start[2]
    let l:eline = l:end[1]
    let l:ecol  = l:end[2]

    let l:positions = []

    " Single-line yank
    if l:sline == l:eline
        call add(l:positions, [l:sline, l:scol, l:ecol - l:scol + 1])
    else
        " First line (from scol → end)
        call add(l:positions, [l:sline, l:scol, col('$') - l:scol])

        " Middle full lines
        for l:lnum in range(l:sline + 1, l:eline - 1)
            call add(l:positions, [l:lnum])
        endfor

        " Last line (start → ecol)
        call add(l:positions, [l:eline, 1, l:ecol])
    endif

    let l:id = matchaddpos('IncSearch', l:positions, 10)
    redraw
    sleep 300m
    call matchdelete(l:id)
endfunction

" ========================
" Remove trailing whitespace on save
augroup TrimWhitespace
    autocmd!
    autocmd BufWritePre * silent! %s/\s\+$//e
augroup END

" ========================
" Disable automatic commenting on new lines
augroup NoAutoComment
    autocmd!
    autocmd BufAdd * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" ========================
" Disable line length marker for specific filetypes
augroup setLineLength
    autocmd!
    autocmd FileType text,markdown,html,xhtml setlocal colorcolumn=0
augroup END

" ========================
" Terminal settings:
command! Term botright term
augroup TerminalSettings
" Open a Terminal on the right tab
    autocmd!
    " Enter insert mode and adjust settings when opening terminal
    autocmd BufEnter * if &buftype == 'terminal' | setlocal listchar= nonumber norelativenumber nocursorline | startinsert | endif
    " Exit insert mode when leaving terminal buffer
    autocmd BufLeave * if &buftype == 'terminal' | stopinsert | endif
augroup END

" ========================
" AutoFormat on save
" Toggle autoformat on save

function! FormatEnable() abort
  " Remove any existing format autocmds to avoid duplicates
  augroup AutoFormat
    autocmd!
    autocmd BufWritePre *
          \ if expand('<afile>:p') !~# '/node_modules/'
          \ | Autoformat
          \ | endif
  augroup END

  let g:autoformat_enabled = 1
  echo "Autoformat enabled globally (excluding node_modules/)"
endfunction

function! FormatDisable(bang) abort
  if a:bang
    " Bang provided: disable for current buffer only
    let b:autoformat_enabled = 0
    augroup AutoFormatBuffer
      autocmd!
      autocmd BufWritePre <buffer>
            \ if !get(b:, 'autoformat_enabled', 1) | | endif
    augroup END
    " Override the global autocmd for this buffer
    autocmd! AutoFormat BufWritePre <buffer>
    echo "Autoformat disabled for current buffer"
  else
    " No bang: disable globally
    augroup AutoFormat
      autocmd!
    augroup END
    let g:autoformat_enabled = 0
    echo "Autoformat disabled globally"
  endif
endfunction

command! FormatEnable  call FormatEnable()
command! -bang FormatDisable call FormatDisable(<bang>0)
