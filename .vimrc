set nocompatible

set runtimepath+=/home/amar/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('/home/amar/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', { 'build' : { 'linux' : 'make' } }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'easymotion/vim-easymotion'

NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

NeoBundle 'majutsushi/tagbar'

NeoBundle 'tpope/vim-rails'


call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" Tricks
nmap ; :
let mapleader = ","

set list
set hidden
set hlsearch
set t_Co=256
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

" Appearance
color xoria256

" Tagbar
nnoremap <F8> :TagbarToggle<cr>
" VimFiler
nnoremap <leader>ne :VimFilerExplorer<cr>

" Single file compile for competitive programming
autocmd FileType cpp map <F9> :!g++ -std=c++14 -o "%:p:r" "%:p" && "%:p:r" && rm "%:p:r"<cr>

" Unite
nnoremap <leader>b :Unite buffer<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>

call unite#custom#profile('default', 'context', {
\   'direction': 'botright',
\   'vertical_preview': 1,
\   'winheight': 15
\ })

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

