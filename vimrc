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

NeoBundle 'majutsushi/tagbar'

NeoBundle 'tpope/vim-rails'
NeoBundle 'aperezdc/vim-template'


call neobundle#end()

filetype plugin indent on

NeoBundleCheck

syntax on

" Tricks
nmap ; :
let mapleader = ","

set list
set hidden
set hlsearch
set t_Co=256
set mouse=a
set nobackup
set noswapfile
set laststatus=2
" set cursorline " performance sucks on large file

" Hidden chars
set listchars=tab:▸\ ,trail:·

" Tab control
nnoremap <c-t> :tabnew<cr>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt

" Disable bell
set visualbell t_vb=

" Appearance
color xoria256

" Tagbar
nnoremap <F8> :TagbarToggle<cr>
" VimFiler
nnoremap <leader>ne :VimFilerExplorer -fnamewidth=0<cr>

" Single file compile for competitive programming
command Input :execute "rightb vsp " . expand("%:p:h") . "/input.txt"
autocmd FileType cpp map <F9> :!g++ -std=c++14 -o "%:p:r" "%:p" && "%:p:r" < "%:p:h"/input.txt && rm "%:p:r"<cr>
autocmd Filetype cpp setlocal et
autocmd Filetype xml setlocal sw=4 sts=4 et
autocmd Filetype java setlocal sw=4 sts=4 et
autocmd Filetype json setlocal sw=2 sts=2 et
autocmd Filetype javascript setlocal sw=2 sts=2 et

" Unite
nnoremap <leader>b :Unite buffer<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>

call unite#custom#profile('default', 'context', {
\   'direction': 'botright',
\   'vertical_preview': 1,
\   'winheight': 15
\ })

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" Templates
let g:templates_directory=["~/.vim/templates"]

"JSON View
function JSONView()
        :%!python -m json.tool
        set filetype=json
endfunction
command JSONView :exec JSONView()
