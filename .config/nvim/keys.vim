
" Space instead of :
nnoremap <space> :

" Use <C-L> to clear the highlighting of search
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Pane navigation, <Ctrl-arrow>
map <C-up> <C-w><up>
map <C-down> <C-w><down>
map <C-left> <C-w><left>
map <C-right> <C-w><right>

" Completion
inoremap <expr> <Left>     pumvisible() ? "\<C-e>" : "\<Left>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <tab>      pumvisible() ? "\<c-n>" : "\<tab>"

" inoremap <silent><expr> <BS>   "\<BS>\<c-r>=coc#refresh()\<CR>"

" inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<c-r>=coc#on_enter()\<CR>\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" inoremap <expr><tab> pumvisible() ? "\<C-y>" : "\<tab>"

" replace all of current word
nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<left><left>

"tabs
nmap <silent> <M-Left> :tabp<cr>
nmap <silent> <M-Right> :tabn<cr>

" Coc LSP keys

nmap gd             <Plug>(coc-definition)
nmap <C-LeftMouse>  <LeftMouse><Plug>(coc-definition)

nmap gs             <Plug>(coc-implementation)
nmap gt             <Plug>(coc-type-definition)
nmap gr             <Plug>(coc-references)
command Rename      :call CocActionAsync('rename')

nmap . <Plug>()
nnoremap <silent> . :call CocAction('doHover')<CR>

nnoremap <silent> <leader>f :call PrototoolFormatFix()<CR>

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
