syntax enable          " enable sytnax highlighting
filetype off            " turn on filetype detection
colorscheme gruvbox    " use funky gruvbox colors

set background=dark    " set the UI to a dark background
set number             " show line numbers
set colorcolumn=80     " draw a divider at the 80th column
set showcmd            " show command in bottom bar
set cursorline         " highlight current line
set wildmenu           " visual autocomplete for menu command

set tabstop=4          " number of visual spaces per tab
set softtabstop=4      " number of spaces in tab when editing
set expandtab          " tabs are spaces
set shiftwidth=4       " set number of columns shifted by `shift >`
set lazyredraw         " redraw screen only when needed
set backspace=2

set incsearch          " search as characters are entered
set hlsearch           " highlight search matches

set clipboard=unnamed  " alias the anonymous register to * register
set noswapfile         " do not use a swapfile for the buffer
set nobackup           " do not make a backup before overwriting a file

let mapleader=","      " set the leader to be comma

autocmd Filetype html setlocal ts=2 sts=2 sw=2 " html-specific indentation

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

"############################
"""""""""Plugins"""""""""""""
"############################
" set the runtimepath to include vundle
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'shime/vim-livedown'
Plugin 'henrik/vim-indexed-search'
Plugin 'uarun/vim-protobuf'
Plugin 'chiphogg/vim-prototxt'
call vundle#end()

" turn on filetype-specific indentation (must be called after Vundle)
filetype plugin indent on 

"############################
"""""""""Spell Check"""""""""
"############################
" turn on spell check for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
set spellfile=~/.vim/spellfile.add
set spelllang=en
hi SpellBad ctermbg=224

" local-remote copy and paste 
vnoremap y y:call system("pbcopy", getreg("\""))<CR>
