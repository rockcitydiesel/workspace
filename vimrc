set wildmenu
syntax on
set t_Co=256
set runtimepath^=~/.vim/bundle/ctrlp.vim
map <leader>s :CtrlP<CR>
set tabstop=4
set shiftwidth=4
set expandtab
let g:netrw_liststyle=3
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
set mouse=a
set nocompatible               " be iMproved
set encoding=utf-8
set splitright
"set backupdir=~/.vim/backup//
"set directory=~/.vim/swap//
"set undodir=~/.vim/undo//

filetype off                  " required for vundle
" Set up vundle to manage bundles
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'mxw/vim-jsx'
" My bundles
" Fancy status bar
"Plugin 'bling/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
" Fancy file explorer
Plugin 'scrooloose/nerdtree'
" Tag explorer
"Plugin 'majutsushi/tagbar'
" Awesome comment/uncomment support
Plugin 'tomtom/tcomment_vim'
" Fuzzy file finder
Plugin 'kien/ctrlp.vim'
" For git blame and shit
Plugin 'tpope/vim-fugitive'
" Indicate git changes on the side
Plugin 'mhinz/vim-signify'
" Syntax checker
Plugin 'scrooloose/syntastic'
" Indent lines
Plugin 'nathanaelkane/vim-indent-guides'
" Better find in files
Plugin 'rking/ag.vim'

" JS indention and highlighting
" Plugin 'pangloss/vim-javascript'

" JS highlighting
" Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/yajs.vim'

" JS indentation
Plugin 'gavocanov/vim-js-indent'
" Plugin 'vim-scripts/JavaScript-Indent'

" This is for better JS processing
"Plugin 'marijnh/tern_for_vim'
" This is for nicer autocompletion
" Shit breaks all the time because python on OSX sucks
"Plugin 'Valloric/YouCompleteMe'
" This is haskell stuff
"Plugin 'eagletmt/neco-ghc'
"Plugin 'raichoo/haskell-vim'

" Javscript stuff
Plugin 'Raimondi/delimitMate'

" colors
Plugin 'flazz/vim-colorschemes'


" project support

call vundle#end()

" Filetype stuff
filetype plugin indent on

set background=dark
colorscheme busybee

" Nice things for editing
"syntax on
set number
set hidden
set nowrap        " don't wrap lines
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set smartindent
set copyindent    " copy the previous indentation on autoindenting
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set expandtab     " <TAB> inserts spaces
set tabstop=4     " a tab is four spaces
set softtabstop=4 " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set clipboard=unnamed " yank and paste with the system clipboard
set autoread
set nobackup
set title         "set our window/terminal title
set shortmess+=I


let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Ruler to encourage files to have a fixed width
set colorcolumn=120

" Highlight unwanted chars
set list
set listchars=tab:▸\ ,trail:▫,extends:→
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Show a navigable menu for tab completion
set wildmenu
set wildmode=longest,list,full

" Make commands easier
set showcmd
let mapleader=","

" Enable and setup powerline
set laststatus=2

"set guifont=Fira\ Sans:h12
"Hack\ Regular:h12
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#hunks#non_zero_only = 1

" Setup nerdtree
map <leader>r :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<cr>
let NERDTreeDirArrows=1
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers if only nerdtree is left
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction

" Setup tagbar
map <leader>a :TagbarToggle<CR>
let g:tagbar_compact = 1
"let g:tagbar_type_javascript = {
    "\ 'ctagsbin' : '~/.nvm/v0.11.9/bin/jsctags'
"\ }

" Setup ctrlP
map <leader>s :CtrlP<CR>
" This isn't used if we use ag
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
" We don't want to have sub modules override our search, only use the current working directory.
" Add 'r' to use the parent git repo as the root
" let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_working_path_mode = 0
" Use the silver searcher
if executable("ag")
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Setup fugitive
map <leader>gd :Gdiff<CR>
map <leader>gb :Gblame<CR>

" Setup ident guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" Setup tern for jump to definition and documention
"let g:tern_map_keys=1
map <leader>td :TernDef<CR>
map <leader>tD :TernDoc<CR>
"map <leader>tt :TernType<CR>
map <leader>tR :TernRename<CR>

" Setup you complete me
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_semantic_triggers = {'haskell' : ['.']}
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Setup signify
let g:signify_update_on_focusgained = 1

" JS specific
" Spell check our comments
autocmd FileType javascript set spell spelllang=en_us
" Indentation settings
" autocmd FileType javascript set tabstop=2
" autocmd FileType javascript set softtabstop=2
" autocmd FileType javascript set shiftwidth=2

" set errorformat=%E%.%#Error:%m,%C%.%#(%f:%l:%c)
" set errorformat=%-G%*[ ]at\ %.%#\ (%f:%l:%c)
" set errorformat=%*[\ ]at\ %.%#\ (%f:%l:%c)
" Mocha error messages
let &errorformat = '%E%.%#Error: %m,'
let &errorformat .= '%C%.%#at %s (%f:%l:%c),'
let &errorformat .= '%Z%.%#at %s (%f:%l:%c),'
let &errorformat .= '%-G%.%#,'




