if has('nvim')
	if empty(glob('~/.config/nvim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	  autocmd VimEnter * PlugInstall
	endif
endif

if !has('nvim')
	if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	  autocmd VimEnter * PlugInstall
	endif
endif

call plug#begin('~/.vim/plugged')
Plug 'mboughaba/i3config.vim'
Plug 'lilydjwg/colorizer'
Plug 'scrooloose/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'tenfyzhong/axring.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'sbdchd/neoformat'
" Plug 'zchee/deoplete-jedi'
" Plug 'davidhalter/jedi-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'neomake/neomake'
" Plug 'scrooloose/nerdtree'
" Plug 'junegunn/goyo.vim'
" Plug 'tmhedberg/SimpylFold'
Plug 'kien/rainbow_parentheses.vim'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'chriskempson/base16-vim'
Plug 'sainnhe/gruvbox-material'
" Plug 'sebastianmarkow/deoplete-rust'
call plug#end()

filetype plugin indent on
syntax on
let mapleader = ","

set clipboard=unnamed


noremap y "+y
noremap yy "+yy
noremap p "+p
noremap Y "*y
noremap Y "*yy
noremap P "*p
noremap x "+x

nnoremap <C-Down> :m .+1<CR>==
nnoremap <c-up> :m .-2<CR>==

inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <c-up> <Esc>:m .-2<CR>==gi

vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <c-up> :m '<-2<CR>gv=gv

"
" set whichwrap+=<,>,h,l,[,]

" fast split
noremap <C-w> <C-w><C-w>

" close terminal
tnoremap <C-x> <C-\><C-n>
tnoremap <C-q> <C-\><C-n>:q<C-m>
tnoremap <C-w> <C-\><C-n><C-w><C-w>


let g:rainbow_active = 1
" setlocal foldmethod=syntax

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
" set expandtab
set wildmode=longest,list,full
set encoding=utf-8
set number relativenumber
set mouse=a

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:gruvbox_material_enable_italic = 1
set termguicolors
set background=dark
let g:gruvbox_material_contrast_dark = 'hard'
colorscheme gruvbox-material

let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
inoremap <C-z> <C-o>:call NERDComment(0,"toggle")<C-m>
nnoremap <C-z> :call NERDComment(0,"toggle")<CR>
vnoremap <C-z> :call NERDComment(0,"toggle")<CR>

nnoremap <F5> :vsp <CR> :term compiler % <CR>

noremap <C-s> :YcmCompleter GetDoc<CR>
inoremap <C-s> :YcmCompleter GetDoc<CR>

" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
"
let g:axring_rings = [
      \ ['&&', '||'],
      \ ['&', '|', '^'],
      \ ['&=', '|=', '^='],
      \ ['>>', '<<'],
      \ ['>>=', '<<='],
      \ ['==', '!='],
      \ ['>', '<', '>=', '<='],
      \ ['++', '--'],
      \ ['true', 'false'],
      \ ['verbose', 'debug', 'info', 'warn', 'error', 'fatal'], 
      \ ]

let g:axring_rings_go = [
      \ [':=', '='],
      \ ['byte', 'rune'],
      \ ['complex64', 'complex128'],
      \ ['int', 'int8', 'int16', 'int32', 'int64'],
      \ ['uint', 'uint8', 'uint16', 'uint32', 'uint64'],
      \ ['float32', 'float64'],
      \ ['interface', 'struct'],
      \ ]

" let g:deoplete#enable_at_startup = 1

" [C++]

" [python]
let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']

" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" disable docstring preview window
autocmd FileType python setlocal completeopt-=preview

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" let g:neomake_python_enabled_makers = ['pylint']

" [Ocaml]
" autocmd Filetype ocaml setlocal rtp+=~/.opam/default/share/merlin/vim
let g:neoformat_ocaml_ocamlformat = {
            \ 'exe': 'ocamlformat',
            \ 'no_append': 1,
            \ 'stdin': 1,
            \ 'args': ['--enable-outside-detected-project', '--name', '"%:p"', '-']
            \ }

let g:neoformat_enabled_ocaml = ['ocamlformat']
autocmd Filetype ocaml setlocal ts=2 sw=2 sts=2 

" [Latex]
" call deoplete#custom#var('omni', 'input_patterns', {
      " \ 'tex': g:vimtex#re#deoplete
      " \})

" Rust
" let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
" let g:deoplete#sources#rust#rust_source_path='/usr/lib/rustlib/src'

" rainbow_parentheses.vim :
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" let g:rbpt_colorpairs = [
    " \ ['brown',       'RoyalBlue3'],
    " \ ['Darkblue',    'SeaGreen3'],
    " \ ['darkgray',    'DarkOrchid3'],
    " \ ['darkgreen',   'firebrick3'],
    " \ ['darkcyan',    'RoyalBlue3'],
    " \ ['darkred',     'SeaGreen3'],
    " \ ['darkmagenta', 'DarkOrchid3'],
    " \ ['brown',       'firebrick3'],
    " \ ['gray',        'RoyalBlue3'],
    " \ ['black',       'SeaGreen3'],
    " \ ['darkmagenta', 'DarkOrchid3'],
    " \ ['Darkblue',    'firebrick3'],
    " \ ['darkgreen',   'RoyalBlue3'],
    " \ ['darkcyan',    'SeaGreen3'],
    " \ ['darkred',     'DarkOrchid3'],
    " \ ['red',         'firebrick3'],
    " \ ]

" let g:rbpt_max = 16
" let g:rbpt_loadcmd_toggle = 0
