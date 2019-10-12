
" Use deoplete.
let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('max_list', 10)

let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang/9.0.0/'

" let g:deoplete#sources#go#source_importer = 1
" let g:deoplete#sources#go#builtin_objects = 1
" autocmd BufWritePost *.go silent! "GoBuild -i" | cclose

let g:deoplete#omni_patterns = {}

call deoplete#custom#option('omni_patterns', {
\ 'complete_method': 'omnifunc',
\ 'terraform': '[^ *\t"{=$]\w*',
\})

call deoplete#initialize()

" let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
" let g:deoplete#enable_at_startup = 1
" call deoplete#initialize()

" Disalbe coc for terraform
autocmd FileType terraform let b:coc_suggest_disable = 1
