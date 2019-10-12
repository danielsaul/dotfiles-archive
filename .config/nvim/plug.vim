" My plugins
" Using vim-plug

" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

" General
Plug 'dbakker/vim-projectroot'          " Find project root
Plug 'tpope/vim-commentary'             " Comments yay
Plug 'ntpeters/vim-better-whitespace'   " Highlight eol whitespace
Plug 'Shougo/echodoc.vim'               " Show doc line in status bar
Plug 'Yggdroot/indentLine'              " Indentation lines for spaces

Plug 'majutsushi/tagbar'    " Tag window
Plug 'scrooloose/nerdtree'  " Show file list

" Bracket closing
" Plug 'rstacruz/vim-closer'
"Plug 'jiangmiao/auto-pairs'

" Linting
" Plug 'neomake/neomake'
Plug 'w0rp/ale'
Plug 'uber/prototool', { 'rtp':'vim/prototool' }

" Coc.nvim - LSP auto-completion etc
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-emoji', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-omni', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}

" Fuzzy
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Testing
Plug 'janko/vim-test'

" Pretty
Plug 'RRethy/vim-hexokinase'  " Colours

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colour schemes
Plug 'crusoexia/vim-monokai'
"Plug 'rakr/vim-two-firewatch'
"Plug 'arcticicestudio/nord-vim'
Plug 'reedes/vim-colors-pencil'
Plug 'rakr/vim-two-firewatch'
Plug 'jacoborus/tender.vim'
Plug 'nightsense/snow'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tveskag/nvim-blame-line'


"
" Languages
"

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'

" Go
Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'

" HTML/CSS
Plug 'othree/html5.vim'
Plug 'JulesWang/css.vim'

" SQL
Plug 'shmup/vim-sql-syntax'

" TOML
Plug 'cespare/vim-toml'

" Python
Plug 'hynek/vim-python-pep8-indent'

" LaTeX
Plug 'lervag/vimtex'

" Terraform
Plug 'hashivim/vim-terraform'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }


" Deoplete auto-completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'juliosueiras/vim-terraform-completion'
" Plug 'zchee/deoplete-jedi'
" Plug 'zchee/deoplete-clang'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" " Plug 'zchee/deoplete-go', { 'do': 'make'}

call plug#end()
