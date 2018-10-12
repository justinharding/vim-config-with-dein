
" Plugin Settings
"---------------------------------------------------------

if dein#tap('denite.nvim')
  nnoremap <silent><LocalLeader>r :<C-u>Denite -resume -refresh<CR>
  nnoremap <silent><LocalLeader>f :<C-u>Denite file_rec<CR>
  nnoremap <silent><LocalLeader>b :<C-u>Denite buffer file_old -default-action=switch<CR>
  nnoremap <silent><LocalLeader>d :<C-u>Denite directory_rec -default-action=cd<CR>
  nnoremap <silent><LocalLeader>v :<C-u>Denite register -buffer-name=register<CR>
  xnoremap <silent><LocalLeader>v :<C-u>Denite register -buffer-name=register -default-action=replace<CR>
  nnoremap <silent><LocalLeader>l :<C-u>Denite location_list -buffer-name=list<CR>
  nnoremap <silent><LocalLeader>q :<C-u>Denite quickfix -buffer-name=list<CR>
  nnoremap <silent><LocalLeader>n :<C-u>Denite dein<CR>
  nnoremap <silent><LocalLeader>g :<C-u>Denite grep<CR>
  nnoremap <silent><LocalLeader>j :<C-u>Denite jump change file_point<CR>
  nnoremap <silent><LocalLeader>o :<C-u>Denite outline<CR>
  nnoremap <silent><LocalLeader>s :<C-u>Denite session -buffer-name=list<CR>
  nnoremap <silent><expr> <LocalLeader>t &filetype == 'help' ? "g\<C-]>" :
        \ ":\<C-u>DeniteCursorWord -buffer-name=tag
        \  tag:include\<CR>"
  nnoremap <silent><expr> <LocalLeader>p  &filetype == 'help' ?
        \ ":\<C-u>pop\<CR>" : ":\<C-u>Denite -mode=normal jump\<CR>"
  nnoremap <silent><LocalLeader>h :<C-u>Denite help<CR>
  nnoremap <silent><LocalLeader>m :<C-u>Denite mpc -buffer-name=mpc<CR>
  nnoremap <silent><LocalLeader>/ :<C-u>Denite line<CR>
  nnoremap <silent><LocalLeader>* :<C-u>DeniteCursorWord line<CR>
  nnoremap <silent><LocalLeader>z :<C-u>Denite z<CR>
  nnoremap <silent><LocalLeader>; :<C-u>Denite command command_history<CR>

  " chemzqm/denite-git
  nnoremap <silent> <Leader>gl :<C-u>Denite gitlog:all<CR>
  nnoremap <silent> <Leader>gs :<C-u>Denite gitstatus<CR>
  nnoremap <silent> <Leader>gc :<C-u>Denite gitbranch<CR>

  " Open Denite with word under cursor or selection
  nnoremap <silent> <Leader>gf :DeniteCursorWord file_rec<CR>
  nnoremap <silent> <Leader>gg :DeniteCursorWord grep<CR>
  vnoremap <silent> <Leader>gg
        \ :<C-u>call <SID>get_selection('/')<CR>
        \ :execute 'Denite grep:::'.@/<CR><CR>

  function! s:get_selection(cmdtype)
    let temp = @s
    normal! gv"sy
    let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
    let @s = temp
  endfunction "}}}
endif

if dein#tap('nerdtree')
  let g:NERDTreeMapOpenSplit = 'sv'
  let g:NERDTreeMapOpenVSplit = 'sg'
  let g:NERDTreeMapOpenInTab = 'st'
  let g:NERDTreeMapOpenInTabSilent = 'sT'
  let g:NERDTreeMapUpdirKeepOpen = '<BS>'
  let g:NERDTreeMapOpenRecursively = 't'
  let g:NERDTreeMapCloseChildren = 'T'
  let g:NERDTreeMapToggleHidden = '.'

  nnoremap <silent> <LocalLeader>e :<C-u>NERDTreeToggle<CR>
  nnoremap <silent> <LocalLeader>a :<C-u>NERDTreeFind<CR>
endif

if dein#tap('neosnippet.vim')
	imap <expr><C-o> neosnippet#expandable_or_jumpable()
		\ ? "\<Plug>(neosnippet_expand_or_jump)" : "\<ESC>o"
	xmap <silent><C-s> <Plug>(neosnippet_register_oneshot_snippet)
	smap <silent>L     <Plug>(neosnippet_jump_or_expand)
	xmap <silent>L     <Plug>(neosnippet_expand_target)
endif

if dein#tap('vim-commentary')
	xmap <Leader>v  <Plug>Commentary
	nmap <Leader>v  <Plug>CommentaryLine
	xmap gc  <Plug>Commentary
	nmap gc  <Plug>Commentary
	omap gc  <Plug>Commentary
	nmap gcc <Plug>CommentaryLine
	nmap cgc <Plug>ChangeCommentary
	nmap gcu <Plug>Commentary<Plug>Commentary
endif

if dein#tap('vim-easymotion')
  nmap ss <Plug>(easymotion-s2)
  nmap sd <Plug>(easymotion-s)
  nmap sf <Plug>(easymotion-overwin-f)
  map  sh <Plug>(easymotion-linebackward)
  map  sl <Plug>(easymotion-lineforward)
  " map  sj <Plug>(easymotion-j)
  " map  sk <Plug>(easymotion-k)
  map  s/ <Plug>(easymotion-sn)
  omap s/ <Plug>(easymotion-tn)
  map  sn <Plug>(easymotion-next)
  map  sp <Plug>(easymotion-prev)
endif

if dein#tap('ack.vim')
  let g:ackprg = 'ag --nogroup --nocolor --column'
  nnoremap <Leader>a :Ack<Space>
endif

if dein#tap('python_match.vim')
	nmap <buffer> {{ [%
	nmap <buffer> }} ]%
endif

