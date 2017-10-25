" True colour
"set termguicolors

if has('mouse')
    set mouse=a
endif

" Cursor
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=e


set showcmd             " Show (partial) command in status line.
set laststatus=2
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set autoindent

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=3         " Set line-spacing
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands

set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

set updatetime=250      " Change updatetime to 250ms

syntax on

"Python
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Clipboard
:set clipboard+=unnamedplus 

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif


" Space instead of :
nnoremap <space> :

" CD
set autochdir
cd ~/
autocmd BufEnter * cd %:p:h

" Panes
map <C-up> <C-w><up>
map <C-down> <C-w><down>
map <C-left> <C-w><left>
map <C-right> <C-w><right>

"nnoremap <silent> > :vertical resize +5<CR>
"nnoremap <silent> < :vertical resize -5<CR>

" Status line
"set statusline=%f
"set statusline+=\ %h%w%m%r
"set statusline+=%=
"set statusline+=\ %P/%L
"set statusline+=\

" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" vim-plug
call plug#begin()

Plug 'crusoexia/vim-monokai'
"Plug 'rakr/vim-two-firewatch'
"Plug 'arcticicestudio/nord-vim'
Plug 'reedes/vim-colors-pencil'

Plug 'airblade/vim-gitgutter'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'othree/html5.vim'
Plug 'gko/vim-coloresque'
Plug 'JulesWang/css.vim'

Plug 'vim-scripts/Miranda-syntax-highlighting'

Plug 'matze/vim-move'

Plug 'rstacruz/vim-closer'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'

Plug 'hynek/vim-python-pep8-indent'

Plug 'Yggdroot/indentLine'

Plug 'scrooloose/nerdtree'

Plug 'neomake/neomake'

Plug 'lervag/vimtex'

Plug 'reedes/vim-lexical'
Plug 'reedes/vim-pencil'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

colorscheme monokai
"colorscheme nord

" Use deoplete.
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang/9.0.0/'

" Neomake on save
autocmd! BufWritePost * Neomake

" indent line
let g:indentLine_char = '│'
let g:indentLine_color_term = 237

" NERDTree ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

" Pencil
set nocompatible
filetype plugin on       " may already be in your .vimrc

let g:pencil#wrapModeDefault = 'soft' 

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
  autocmd FileType tex          call pencil#init()
                            \ | call lexical#init()  
augroup END

" Miranda
autocmd BufRead,BufNewFile *.m set filetype=Miranda

