" Global Mappings "{{{
" Use spacebar as leader and ; as secondary-leader
" Required before loading plugins!
let g:mapleader="\<Space>"
" let g:mapleader=";"
" let mapleader=";"
" let g:maplocalleader=';'
let maplocalleader=','

set switchbuf=useopen

" }}}

" Ensure cache directory "{{{
if ! isdirectory(expand($VARPATH))
        " Create missing dirs i.e. cache/{undo,backup}
        call mkdir(expand('$VARPATH/undo'), 'p')
        call mkdir(expand('$VARPATH/backup'))
endif

" Ensure custom spelling directory
if ! isdirectory(expand('$VIMPATH/spell'))
        call mkdir(expand('$VIMPATH/spell'))
endif

" }}}
" Load vault settings "{{{
if filereadable(expand('$VIMPATH/.vault.vim'))
        execute 'source' expand('$VIMPATH/.vault.vim')
endif

" }}}
" Setup dein {{{
if &runtimepath !~# '/dein.vim'
        let s:dein_dir = expand('$VARPATH/dein').'/repos/github.com/Shougo/dein.vim'
        if ! isdirectory(s:dein_dir)
                execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
        endif

        execute 'set runtimepath+='.substitute(
                \ fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

let g:loaded_matchit = 1
