set autoindent
set expandtab
set nu
set paste
set shiftwidth=4
set tabstop=4
set hlsearch
syntax on

" strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
