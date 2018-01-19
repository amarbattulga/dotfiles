" Neobundle {
set nocompatible

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', { 'build' : { 'mac' : 'make' } }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimshell.vim'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'easymotion/vim-easymotion'

NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

NeoBundle 'majutsushi/tagbar'

NeoBundle 'tpope/vim-rails'
NeoBundle 'aperezdc/vim-template'


call neobundle#end()

filetype plugin indent on

NeoBundleCheck
" }

" General {
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
color xoria256
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

" Bindings {
nmap ; :
let mapleader = ","
nnoremap <leader>b :Unite buffer<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>
nnoremap <F8> :TagbarToggle<cr>
nnoremap <leader>ne :VimFilerExplorer -fnamewidth=0<cr>
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

" Plugin config {
let g:airline#extensions#tabline#enabled = 1
let g:templates_directory=["~/.vim/templates"]

call unite#custom#profile('default', 'context', {
\   'direction': 'botright',
\   'vertical_preview': 1,
\   'winheight': 15
\ })
" }
