set nocompatible
filetype off

"Runtime path for Vundle
if has('win32') || ('win64')
  set rtp+=~/vimfiles/bundle/Vundle.vim/
  let path='~/vimfiles/bundle'
else
  set rtp+=~/.vim/bundle/Vundle.vim
endif

call vundle#begin()

" This is the vundle package itself
Plugin 'gmarik/vundle'

" Airline plugin
if has('unix')
  Plugin 'bling/vim-airline'
endif

" Git plugin
Plugin 'tpope/vim-fugitive'

" For commenting
Plugin 'tpope/vim-commentary'

" Detects hard/soft tabbing and tabwidths
Plugin 'tpope/vim-sleuth'

" Replaces grep
Plugin 'mileszs/ack.vim'

" NERDCommenter
Plugin 'scrooloose/nerdcommenter'

" NERDTree
Plugin 'scrooloose/nerdtree'

" Easy Motion
Plugin 'Lokaltog/vim-easymotion'

" Vim-gutter
Plugin 'airblade/vim-gitgutter'

" Luna colorscheme
Plugin 'Pychimp/vim-luna'

" AutoComplPop
Plugin 'vim-scripts/AutoComplPop'

" Surround
Plugin 'tpope/vim-surround'

" Supertab
Plugin 'ervandew/supertab'

" Enhanced CPP Highlights
Plugin 'octol/vim-cpp-enhanced-highlight'

" Relative numbering only in normal mode
Plugin 'myusuf3/numbers.vim'

" Graphical undo
Plugin 'sjl/gundo.vim'

" Gentle auto-pairing
Plugin 'vim-scripts/auto-pairs-gentle'

" New autoclose plugin for vim
"Plugin 'Townk/vim-autoclose'

" Close tag for html. Use with Control + _
Plugin 'vim-scripts/closetag.vim'

" To move to closing tag of even html files with %
Plugin 'edsono/vim-matchit'

" Vim addons
Plugin 'marcweber/vim-addon-mw-utils'

" Snipmate
"Plugin 'garbas/vim-snipmate'

" Needed for snipmate
"Plugin 'tomtom/tlib_vim'

" Vim auto stop with swap messages
Plugin 'autoswap.vim'

" Official PHP plugin for vim
"Plugin '2072/PHP-Indenting-for-VIm'
Plugin '2072/vim-syntax-for-PHP'

" For haskell
Plugin 'raichoo/haskell-vim'


" Colors
Plugin 'tomasr/molokai'
Plugin 'derekwyatt/vim-scala'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()
filetype plugin indent on

" For haskell
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1

let g:haskell_indent_if = 3

" For airline
if has('unix')
  set guifont=Liberation\ Mono\ for\ Powerline\ 10
  set laststatus=2
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
endif

" New space mappings
nnoremap <Space>w :w<CR>
nnoremap <Space>q :wq<CR>
vmap <Space>y "+y
vmap <Space>d "+d
nmap <Space>p "+p
nmap <Space>P "+P
vmap <Space>p "+p
vmap <Space>P "+P

" NERDcommenter mapping
nmap // <leader>ci

" EasyMotion
nmap .. <leader><leader>w
nmap ,, <leader><leader>b

" NERDTree
nmap <c-n> :NERDTreeToggle<return>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif	"To autoclose if only nerd left

syntax on
syntax enable
set nowrap

set undofile
set undodir=~/.vim/undodir

" Enable code folding with z,a
set foldmethod=indent
set foldlevel=99

" Make new windows with <ctrl>+w + v , <ctrl>+w + s and close with <ctrl>+w+q
" Allow movement between windows with control+movement keys
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <C><tab> :bnext<return>

" Keyboard shortcuts for PHP + HTML
" This one checks for errors with <F5>
map <F5> :!php -l %<return>
map <F7> :set ft=html<return>
map <F8> :set ft=phtml<return>

" To toggle the PHP tags in a markdown file meant for parsedown
map <F9> magg2//G//`a:w<return>

" For scala
map <F3> :!scalac %<return>:redraw!<return>:!scala %:r<return>

" For compiling files in C++
map <F4> :! make %:r<return>

set backspace=indent,eol,start
set background=dark
set shiftwidth=4
set shiftround
set tabstop=4
set smarttab
set wildmenu

set showmatch
set showcmd     "To show partial command in status bar
set nu        "For current line number
set rnu       "Relative numbering for the rest of the lines
set sidescroll=1

set ignorecase
set smartcase     "CSen only when capitals used.
set incsearch	  "Starts showing results as you type
set hlsearch

set autoindent
set copyindent
set smartindent
set cindent

set history=1000
set undolevels=1000
set scrolloff=6
set autoread 	  "Reloads file on change

set guioptions-=m
set guioptions-=T

cmap w!! w !sudo tee % >/dev/null

"colors pablo 
colors jellybeans

set pastetoggle=<F2>  "Toggles paste mode

:autocmd Filetype make set noexpandtab

if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal! g'\"" |endif
endif

set t_Co=256
set gfn=monofur\ for\ Powerline\ Regular\ 13

set dictionary+=~/.vim/bundle/bootstrap-snippets/dictionary
set complete+=k

if has('unix')
	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif
	"if (!'gui')
		"let g:airline_left_sep = '»'
		"let g:airline_left_sep = '▶'
		"let g:airline_right_sep = '«'
		"let g:airline_right_sep = '◀'
		"let g:airline_symbols.linenr = '␊'
		"let g:airline_symbols.linenr = '␤'
		"let g:airline_symbols.linenr = '¶'
		"let g:airline_symbols.branch = '⎇'
		"let g:airline_symbols.paste = 'ρ'
		"let g:airline_symbols.paste = 'Þ'
		"let g:airline_symbols.paste = '∥'
		"let g:airline_symbols.whitespace = 'Ξ'
	"endif
endif
