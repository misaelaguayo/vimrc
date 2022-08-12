set hlsearch
set nocompatible
set ignorecase
filetype plugin on
syntax on

" surrounds a block of text with '#' using \#
:nnoremap <Leader># I#<Space><Esc>A<Space>#<Esc>yy2P<C-V>$r#2j.

" lists buffers and starts typing which buffer to switch to
:nnoremap <Leader>b :buffers<CR>:buffer<Space>

" use control-f in fzf to find files
:nnoremap <silent> <C-f> :Files<CR>

" use \f in fzf to find text in files
:nnoremap <silent> <Leader>f :Rg<CR>

call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'vimwiki/vimwiki'
  " Git integration with vim
  Plug 'tpope/vim-fugitive'
  " vim line overview
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  " vim language server
  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
  Plug 'tomasiser/vim-code-dark'
call plug#end()

colorscheme codedark

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

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['pyright'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
