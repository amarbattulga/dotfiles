set nocompatible

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()

" Basics {
syntax on
set list
set hidden
set hlsearch
set t_Co=256
set mouse=a
set nobackup
set noswapfile
set laststatus=2
set visualbell t_vb=
set listchars=tab:▸\ ,trail:·
set cursorline
color jellybeans
" }

" Bindings {
nmap ; :
let mapleader = ","
" }

" Tab control bindings {
nnoremap <c-t> :tabnew<cr>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
" }

" JSONView {
function JSONView()
        :%!python -m json.tool
        set filetype=json
endfunction
command JSONView :exec JSONView()
" }

" Filetype specific configs {
command Input :execute "rightb vsp " . expand("%:p:h") . "/input.txt"
autocmd FileType cpp map <F9> :!g++ -std=c++14 -o "%:p:r" "%:p" && "%:p:r" < "%:p:h"/input.txt && rm "%:p:r"<cr>
autocmd Filetype cpp setlocal et
autocmd Filetype xml setlocal sw=4 sts=4 et
autocmd Filetype java setlocal sw=4 sts=4 et
autocmd Filetype json setlocal sw=2 sts=2 et
autocmd Filetype javascript setlocal sw=2 sts=2 et
" }
