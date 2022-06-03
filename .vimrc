"Simple VIM config file


"======================
"======================
"======================

" Load pathogen
execute pathogen#infect()
filetype plugin indent on
syntax on
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Rebind the <leader> key
let mapleader = ","

" Better indentation
vnoremap < <gv 
vnoremap > >gv 

" Color scheme
set t_Co=256
color jellybeans
" let g:jellybeans_overrides = {'background': { 'ctermbg': 'none', '256ctermbg': 'none' }}
" let g:jellybeans_use_term_italics = 1

" Showing line numbers and length 
set number
set tw=79
set nowrap
set fo-=t

" Ctrl-P setup
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Lightline setup
set laststatus=2
set noshowmode
let g:lightline = {'colorscheme': 'wombat'}

" NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" VIM UI Config
set so=7
set ruler
set cmdheight=1
set foldcolumn=0
syntax enable
hi Normal ctermbg=none
highlight NonText ctermbg=none
set hlsearch
set incsearch 
set showmatch 

" Navigation
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4


" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Fast saving
nmap <leader>w :w!<cr>
" Fast quit
nmap <leader>ww :q<cr>

