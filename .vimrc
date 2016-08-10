set autoindent
set expandtab
set hlsearch
set nu
set paste
set shiftwidth=4
set tabstop=4
syntax on

if has("mouse")
    set mouse=a
endif

" strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" quicker escape key
inoremap uh <ESC>
