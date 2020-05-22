" vim: set foldlevel=0 fdm=marker fmr={{{,}}}:

" Plug installation {{{:
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
" }}}

" #################### Plugins list ##########################################
call plug#begin('~/.vim/plugged')
" ==> LSP
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim'
Plug 'jackguo380/vim-lsp-cxx-highlight'

" ==> Visual enhancement 
Plug 'mboughaba/i3config.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'crusoexia/vim-monokai', {'for': 'python'}
Plug 'lifepillar/vim-gruvbox8'
Plug 'sainnhe/edge'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
" Plug 'Yggdroot/indentLine'
Plug 'antv0/ayu-vim'
Plug 'calviken/vim-gdscript3'

" ==> tools 
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'tenfyzhong/axring.vim' " Enhance <c-a>, <c-x> ability to switch keywords.
" Plug 'tpope/vim-eunuch'
" Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'brooth/far.vim'

call plug#end()

set termguicolors

" #################### Plugins configs ########################
" ==> coc-highlight
command Colorpick :call CocAction('pickColor')

" ==> Surround
vmap s S

" ==> axring
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


" ==> gruvbox8
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#ebdbb2']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}

" ==> edge colorscheme
let g:edge_style = 'neon'

" ==> ayu colorscheme
let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme

" ==> indentline
let g:indentLine_setColors = 0

" ==> rainbow_parentheses
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

" ==> nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
inoremap <C-z> <C-o>:call NERDComment(0,"toggle")<C-m>
nnoremap <C-z> :call NERDComment(0,"toggle")<CR>
vnoremap <C-z> :call NERDComment(0,"toggle")<CR>

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" LSP: {{{

" ccls
" also see https://github.com/autozimu/LanguageClient-neovim/wiki/ccls
let s:ccls_settings = {
            \ 'highlight': { 'lsRanges' : v:true },
            \ }

let s:ccls_command = ['ccls', '-init=' . json_encode(s:ccls_settings)]

let g:LanguageClient_serverCommands = {
            \ 'c': s:ccls_command,
            \ 'cpp': s:ccls_command,
            \ 'objc': s:ccls_command,
            \ }

function SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType cpp,c call SetLSPShortcuts()
augroup END

let g:deoplete#enable_at_startup = 1

" }}}

" ==> EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

let g:lsp_cxx_hl_use_text_props = 1

" #################### Configs ################################
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

nnoremap s ciw
vnoremap w iw

nnoremap § /\c

nnoremap < <<
nnoremap > >>

" ctrl + [up|down] to move lines around
nnoremap <C-Down> :m .+1<CR>==
nnoremap <c-up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <c-up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <c-up> :m '<-2<CR>gv=gv

" fast switch buffer
noremap <C-w> <C-w><C-w>

" indent config
set tabstop=4				" show existing tab with 4 spaces width
set shiftwidth=4			" when indenting with '>', use 4 spaces width
set expandtab				" Insert spaces instead of tabs
set smarttab

set encoding=utf-8
" set number relativenumber
set mouse=a

" folding settings
set foldmethod=syntax
set foldlevel=99

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

map <F5> :w <CR>:! run % <CR>
map <F6> :w <CR>:! i3 "[instance=\"dropdown_run\"] kill"; ddspawn run % ";" read -r<CR>

" theming
set background=dark
colorscheme ayu

