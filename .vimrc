colorscheme molokai
syntax enable
let g:rehash256 = 1
:imap jj <Esc>

"set background=light
"colorscheme solarized

"st exrc
set nocompatible              " be iMproved, required
filetype off                  " required

set splitbelow

noremap <TAB> %
noremap <C-f> :FZF<CR>
:tnoremap <Esc> <C-\><C-n>
:vmap // :s:^://<CR>
map <C-u> :s/^\/\///<Enter>
:set mouse=a


call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/syntastic'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

       
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'



set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set noshowmode


let mapleader = "\<Space>"
noremap <Leader>q :q!<CR>
noremap <Leader>t :ter<CR>
noremap <Leader>w :w<CR>
noremap <Leader>a ggVG
noremap <Leader>s :source ~/.vimrc <CR>
noremap <Leader>e :x!<CR>
noremap <Leader>n :tabedit
noremap <Leader>g gt
vmap <Leader>c y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
map <Leader>v :r ~/.vimbuffer<CR>
noremap <Leader>hs :split
noremap <Leader>vs :vsplit
noremap <Leader>h :wincmd h<CR>
noremap <Leader>j :wincmd j<CR>
noremap <Leader>k :wincmd k<CR>
noremap <Leader>l :wincmd l<CR>
nnoremap <silent> <Leader>= :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <silent> <Leader>+ :res +5<CR>
nnoremap <silent> <Leader>_ :res -5<CR>

map <F9> :w<CR> :!clear<CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>
map <F8> :w<CR> :!clear<CR> :!g++ -g % -o %:r && ./%:r<CR>
map <F10> :!clear<CR> :!./%:r<CR>

set autoindent
set autoread
set cin
set nohlsearch
set hidden
set expandtab
set guifont=Menlo\ Regular:h16
set history=1000
set ignorecase
set scrolloff=15
set incsearch
set softtabstop=4
set smartindent
set mousehide
set noerrorbells
set noswapfile
set number
set relativenumber
set pastetoggle=<F3>
set shiftwidth=4
set smarttab
set tabstop=4
set vb t_vb=

filetype on
filetype plugin on

syntax on


" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" - Popup window (center of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }

" - Popup window (anchored to the bottom of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

" - Window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

