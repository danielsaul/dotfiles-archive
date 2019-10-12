"Fzf

" Ctrl-space: project files
command ProjFiles execute 'Files' ProjectRootGuess()
nnoremap <C-space> :ProjFiles<cr>

" Ctrl-b: buffers
nnoremap <C-b> :Buffers<cr>

" No status bar in fzf window
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


command! -bang -nargs=* FindRG
  \ call fzf#vim#grep('rg --line-number --column --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" --colors "line:fg:0xCB,0x89,0xDE" --colors "match:fg:0xFE,0x40,0x80" --colors "path:fg:0x5E,0xC8,0xDC" '.shellescape(<q-args>),
  \ 1,
  \ <bang>0)

" \ and Ctrl-f: open find in project
nnoremap \ :Find<SPACE>
nnoremap <C-f> :ProjectRootExe Find<SPACE>

" Set colours in fzf window
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


let $FZF_DEFAULT_OPTS='--layout=reverse --margin 1,3 --border'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  " let height = &lines - 20
  let height = 20
  " let width = float2nr(&columns - (&columns * 2 / 10))
  let width = 70
  let col = float2nr((&columns - width) / 2)
  let row = float2nr((&lines - height) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  let win = nvim_open_win(buf, v:true, opts)
  call setwinvar(win, '&number', 0)
  call setwinvar(win, '&relativenumber', 0)
  call setwinvar(win, '&signcolumn', 'no')
endfunction

autocmd! FileType fzf
autocmd  FileType fzf setlocal nonumber

