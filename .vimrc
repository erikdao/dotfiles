set nocompatible	" required
filetype off		" required

" set the runtime path to include Vundle and intialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manages Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
" Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'leafgarland/typescript-vim'
Plugin 'dense-analysis/ale'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

call vundle#end()
filetype plugin indent on	" required

" ctrP to ignore folders such as node_modules
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" UTF-8 support
set encoding=utf-8

" Python indentation
au BufNewFile, BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Flagging unnecessary whitespaces
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile  .py,.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Syntax highlight
let python_highlight_all=1
syntax on

" Enable line number
set number

" Allow system clipboard
set clipboard=unnamed

" Recommended settings for syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Open NERDTree with Ctrl+B
map <C-b> :NERDTreeToggle<CR>

" Enable formatting for front-end files
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

au BufNewFile,BufRead *.js,*.ts,*.tsx,*.jsx,*.html,*.css,*.scss
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" ALE syntax linting
let g:ale_linters = {
\  'python': ['flake8', 'pylint'],
\  'javascript': ['eslint'],
\  'typescript': ['eslint'],
\  'css': ['prettier'],
\  'scss': ['prettier'],
\  'html': ['prettier']
\}

let g:ale_fix_on_save = 1

nnoremap ]r :ALENextWrap<CR>     " move to the next ALE warning / error
nnoremap [r :ALEPreviousWrap<CR> " move to the previous ALE warning / error

" Autocomplete with Deoplete
let g:deoplete#enable_at_startup = 1
