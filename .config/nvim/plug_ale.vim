"  ALE
"
let g:ale_linters = {
  \ 'go': ['gofmt', 'golint', 'golangci-lint'],
  \ 'proto': ['prototool-lint'],
  \ }

let g:ale_fixers = {
  \ 'vue': ['eslint'],
  \ 'javascript': ['eslint'],
  \ 'terraform': ['terraform'],
  \ }

let g:ale_fix_on_save = 1

let g:ale_go_golangci_lint_options = '--disable golint'
let g:ale_go_golangci_lint_package = 1

let g:ale_virtualtext_cursor = 1

