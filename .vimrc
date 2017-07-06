set autoindent
" hilight search pattern matches
set hlsearch
" show visible line numbers - relative
set rnu
set paste
" set tabs to 4 spaces always and forever
set softtabstop=4 tabstop=4 shiftwidth=4 expandtab
retab
" set syntax highlighting on
syntax on

if has("mouse")
    set mouse=a
endif

" strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" quicker than ESC
inoremap uh <ESC>

" set color
color delek
