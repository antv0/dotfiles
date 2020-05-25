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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'autozimu/LanguageClient-neovim', {
    " \ 'branch': 'next',
    " \ 'do': 'bash install.sh',
    " \ }
Plug 'Shougo/deoplete.nvim'
" Plug 'jackguo380/vim-lsp-cxx-highlight'

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
let g:lightline = {'colorscheme' : 'edge'}

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
" set hidden

" let g:LanguageClient_serverCommands = {
    " \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    " \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    " \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    " \ 'python': ['/usr/local/bin/pyls'],
    " \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    " \ }

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Coc: {{{

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}

" LSP: {{{

" " ccls
" " also see https://github.com/autozimu/LanguageClient-neovim/wiki/ccls
" let s:ccls_settings = {
            " \ 'highlight': { 'lsRanges' : v:true },
            " \ }

" let s:ccls_command = ['ccls', '-init=' . json_encode(s:ccls_settings)]

" let g:LanguageClient_serverCommands = {
            " \ 'c': s:ccls_command,
            " \ 'cpp': s:ccls_command,
            " \ 'objc': s:ccls_command,
            " \ }

" function SetLSPShortcuts()
  " nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  " nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  " nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  " nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  " nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  " nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  " nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  " nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  " nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  " nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
" endfunction()

" augroup LSP
  " autocmd!
  " autocmd FileType cpp,c call SetLSPShortcuts()
" augroup END

" let g:deoplete#enable_at_startup = 1

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
set number relativenumber
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
colorscheme edge

