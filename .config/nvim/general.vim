set termguicolors       " True colour k thx

if has('mouse')
    set mouse=a         " Set mouse support
endif

set noerrorbells        " No beeps.

syntax on               " Syntax colouring always nice

set updatetime=250      " Change updatetime to 250ms

" Status line
set showcmd             " Show (partial) command in status line.
set laststatus=2        " Always show status line
set ruler               " Show the line and column numbers of the cursor.
set noshowmode          " Do not show current mode

" Lines
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.

" Indentation
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set autoindent

" Typing
set showmatch           " Show matching brackets.

" UI
set linespace=3         " Set line-spacing
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

autocmd VimResized * wincmd = " Auto equalise panes

if !&scrolloff
  set scrolloff=10      " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif

set signcolumn=yes      " Always show sign column

set display+=lastline
set nostartofline       " Do not jump to first character with page commands

" Search
set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Line numbers
set number              " Show the line numbers on the left side.
set numberwidth=5       " Set width of line column
set relativenumber      " Use relative line numbers
augroup numbertoggle   " Intelligent relative numbers
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


set clipboard+=unnamedplus  " Link paste buffer to clipboard

" Delete selection to blackhole buffer and then paste
" i.e. we finally get a paste, not a copy then paste...
vnoremap p "_dP


let mapleader=","       " <leader> is ,

" CD
" set autochdir
" cd ~/
autocmd BufEnter * silent! call ProjectRootCD()
autocmd BufEnter * silent! lcd %:p:h

" Python binaries (neovim)
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'


" Completion
" set completeopt-=preview
"set completeopt=longest,menuone

" Disable annoying sql complete thing
let g:omni_sql_no_default_maps = 1

" Set sign column colour
highlight SignColumn ctermbg=234

" 120/100 column width
au BufWinEnter * highlight OverLength ctermbg=52 guibg=#5b1a2c
au BufWinEnter *.go let w:m2=matchadd('OverLength', '\%>120v.\+', -1)
au BufWinEnter *.vue,*.js let w:m2=matchadd('OverLength', '\%>100v.\+', -1)
