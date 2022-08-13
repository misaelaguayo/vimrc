set hlsearch
set nocompatible
set ignorecase
filetype plugin indent on
syntax on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab

set rtp+=/opt/homebrew/opt/fzf
set laststatus=2
set noshowmode

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

call plug#begin()
  Plug 'neovim/nvim-lspconfig'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'vimwiki/vimwiki'
  " Git integration with vim
  Plug 'tpope/vim-fugitive'
  " vim line overview
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'tomasiser/vim-code-dark'
call plug#end()

colorscheme codedark

" Required for operations modifying multiple buffers like rename
set hidden
set number

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'bufnum' ], [ 'readonly', 'absolutepath', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
