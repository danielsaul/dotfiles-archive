" Go
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_fmt_command = "goimports"

let g:go_auto_type_info = 0
let g:go_def_mapping_enabled = 0

" Really naughty, pretend all HTML files are Go HTML templates...
" au BufRead,BufNewFile *.html set filetype=gohtmltmpl

" Switch to go tests
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gt :GoTest -short<cr>
au FileType go nmap <leader>gc :GoCoverageToggle -short<cr>
