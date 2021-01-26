set nocompatible

:hi Visual cterm=none ctermbg=darkgrey ctermfg=cyan

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs 
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data').'/plugged')
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-unimpaired'
    Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
    Plug 'sjl/gundo.vim'
	Plug 'vim-airline/vim-airline'
    Plug 'kien/rainbow_parentheses.vim'
	Plug 'tpope/vim-markdown'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'joshdick/onedark.vim'
call plug#end()

" syntax on and filetype plugin indent on is set by vim-plug
"syntax on

set splitbelow
set splitright
set showmatch
set autoindent
"set background=dark
set backspace=2
"set colorcolumn=+1        " highlight column after 'textwidth'
set expandtab
set hlsearch
set ignorecase
set incsearch
set list
set listchars=eol:¬,tab:>-,trail:•,extends:>,precedes:<
set mouse=a
set number
set nocompatible
set relativenumber
set ruler
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smarttab
set tabstop=4

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Inside _P_arentheses
onoremap p i(

" Inside curly breaces
onoremap o i{
" }}}


" Normal Mode ----------------------------------- {{{
" Arrow Key Line Movement ----------------------- {{{
" " Moving lines up and down with the arrow keys. As inspired by 
" "http://codingfearlessly.com/2012/08/21/vim-putting-arrows-to-use/"
nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv
nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <Right> >gv

" Map ctrl+hjkl to switch splits
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Crosshair ------------------------------------- {{{
" Set up crosshair, toggle with <leader>c in normal mode
:hi CursorLine cterm=NONE ctermbg=grey ctermfg=white guibg=grey guifg=white
:hi CursorColumn cterm=NONE ctermbg=grey ctermfg=white guibg=grey guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Git ------------------------------------------- {{{
" gst - Open Git status
" nnoremap <leader>gst :Gstatus<cr>

" let g:Hexokinase_highlighters = [ 'virtual' ]

" NERDTree -------------------------------------- {{{
" Start if no file opened
autocmd vimenter * if !argc() | NERDTree | endif
" " Assign command to /g
map <TAB> :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
" " Fix encoding issues surrounding arrows
" "
" "https://superuser.com/questions/387777/what-could-cause-strange-characters-in-vim"
" let g:NERDTreeDirArrows=0
" " }}}

" RainbowParentheses ---------------------------- {{{
" Auto enable rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
" }}}

nnoremap <F5> :GundoToggle<CR>
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_minlines = 100

colorscheme onedark

" cocvim config ------------{{{
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
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
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" }}}
