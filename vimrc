syntax enable          " enable sytnax highlighting
filetype off            " turn on filetype detection
let g:gruvbox_guisp_fallback = "bg" " fix spelling highlight inversion
colorscheme gruvbox    " use funky gruvbox colors
set background=dark    " set the UI to a dark background
set number             " show line numbers
set colorcolumn=88     " draw a divider at the 80th column
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
set tags=tags;         " ctags
set nofoldenable       " disable folding


let mapleader=","      " set the leader to be comma

autocmd Filetype html setlocal ts=2 sts=2 sw=2 " html-specific indentation
autocmd Filetype matlab setlocal ts=2 sts=2 sw=2 " matlab-specific indentation
autocmd Filetype python setlocal ts=4 sts=4 sw=4 " python-specific indentation
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab



" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

"############################
"          Plugins
"############################
" set the runtimepath to include vundle
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-eunuch'
Plugin 'shime/vim-livedown'
Plugin 'henrik/vim-indexed-search'
Plugin 'uarun/vim-protobuf'
Plugin 'chiphogg/vim-prototxt'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'w0rp/ale'
Plugin 'prabirshrestha/async.vim'
Plugin 'ctrlpvim/ctrlp.vim'
call vundle#end()

let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 0

" turn on filetype-specific indentation (must be called after Vundle)
filetype plugin indent on

autocmd FileType python set makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
autocmd FileType python set errorformat=%f:%l:\ %m

let g:ctrlp_working_path_mode = '0'
"############################
"         ALE          - async replacement for syntastic
"############################
"
let g:ale_lint_on_save = 1
let g:ale_lint_delay = 200
"let g:ale_linters = {'python': ['pylint']}
"'pyflakes''flake8'
"let g:ale_linters = {'python': ['flake8', 'pylint', 'black', 'pyls', 'vulture'], 'MATLAB': ['mlint']}
"let g:ale_linters = {'python': ['flake8', 'pylint', 'black', 'pyls', 'vulture'], 'MATLAB': ['mlint']}
let g:ale_linters = {'python': ['flake8', 'pylint', 'vulture', 'pycodestyle'], 'MATLAB': ['mlint']}
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_highlights = 0
highlight ALEWarning ctermbg=DarkMagenta


"############################
"         Spell Check
"############################
"" turn on spell check for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
set spellfile=~/.vim/spellfile.add
set spelllang=en
hi SpellBad ctermbg=224

" local-remote copy and paste
vnoremap y y:call system("pbcopy", getreg("\""))<CR>
"
let g:vim_markdown_folding_disabled = 1
"
" " Ignore filetypes (for ctrl-p)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o

"Code-reading settings - minimal disruption - comment out the following
"let g:ale_linters = {}

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

:command Ipdb :normal i import ipdb ; ipdb.set_trace()<ESC>
set autoindent

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


map <Leader>p :call InsertLine()<CR>

function! InsertLine()
  let trace = expand("import ipdb; ipdb.set_trace()")
  execute "normal o".trace
endfunction

"if executable('pyls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'pyls',
"        \ 'cmd': {server_info->['pyls']},
"        \ 'whitelist': ['python'],
"        \ })
"endif
