" True colour
set termguicolors

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
  set scrolloff=10      " Show next 3 lines while scrolling.
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

set signcolumn=yes      " Always show sign column

set numberwidth=5

set updatetime=250      " Change updatetime to 250ms

:let mapleader=","			" <leader> is ,

syntax on

" Line numbers
set number              " Show the line numbers on the left side.
set relativenumber      " Use relative line numbers
:augroup numbertoggle   " Intelligent relative numbers
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

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
autocmd BufEnter * silent! lcd %:p:h

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
Plug 'rakr/vim-two-firewatch'
Plug 'jacoborus/tender.vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'

Plug 'tpope/vim-commentary'

Plug 'ntpeters/vim-better-whitespace'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'

Plug 'othree/html5.vim'
Plug 'gko/vim-coloresque'
Plug 'JulesWang/css.vim'

Plug 'matze/vim-move'

"Plug 'rstacruz/vim-closer'
Plug 'jiangmiao/auto-pairs'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

Plug 'hynek/vim-python-pep8-indent'

Plug 'Yggdroot/indentLine'

Plug 'scrooloose/nerdtree'

Plug 'neomake/neomake'

Plug 'lervag/vimtex'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

set rtp+=~/.config/nvim/neon.vim
colorscheme neon.vim

" Use deoplete.
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" Let <Tab> also do completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang/9.0.0/'

" Neomake on save
" autocmd! BufWritePost * Neomake
" Neomake on writing buffer and normal mode changes after 1000ms
call neomake#configure#automake('nw', 1000)

" indent line
let g:indentLine_char = '▏' "'│'
let g:indentLine_color_term = 236
let g:indentLine_color_gui = '#2C2C2C'
"let g:indentLine_fileTypeExclude = ['json']

" NERDTree ctrl-n
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Fugitive, git status toggle ctrl-/
function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        Gstatus
    endif
endfunction
command ToggleGStatus :call ToggleGStatus()
nmap <silent> <C-_> :ToggleGStatus<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:neon_airline = 1
let g:airline_theme='neon'
let g:airline#extensions#tabline#enabled = 1

" Set sign column colour
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=234

highlight ExtraWhitespace ctermbg=52 guibg=#5b1a2c

" 100 column width, doeesn't work on load??
highlight OverLength ctermbg=52 guibg=#5b1a2c
match OverLength /\%101v.\+/

"Fzf
command GFilesFallback :execute system('git rev-parse --is-inside-work-tree') =~ 'true' ? 'GFiles' : 'Files'
nnoremap <C-space> :GFilesFallback<cr>
nnoremap <C-b> :Buffers<cr>
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Go
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

" Switch to go tests
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gt :GoTest -short<cr>
au FileType go nmap <leader>gc :GoCoverageToggle -short<cr>
