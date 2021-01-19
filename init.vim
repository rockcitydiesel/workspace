set wildmenu
syntax on
set shiftwidth=2
set tabstop=2
set expandtab
set mouse=a
set encoding=utf-8
set splitright
set cmdheight=2
let g:netrw_liststyle=3
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

set updatetime=300

let mapleader=","
set background=dark
" set number
set relativenumber
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
set tabstop=2     " a tab is four spaces
set softtabstop=2 " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set clipboard=unnamed " yank and paste with the system clipboard
set autoread
set nobackup
set title         "set our window/terminal title
set shortmess+=I


let g:deoplete#enable_at_startup = 1
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

call plug#begin()
" theme
Plug 'ayu-theme/ayu-vim'
" Plug 'joshdick/onedark.vim'
" Plug 'KeitaNakamura/neodark.vim'
" Plug 'sickill/vim-monokai'
" Plug 'patstockwell/vim-monokai-tasty'
" Plug 'atahabaki/archman-vim'


" code complete
Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': './install.sh', 'branch': 'release' }
Plug 'tpope/vim-surround'

" fuzzy file search
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" file explorer
Plug 'scrooloose/nerdTree'
" Plug 'francoiscabrol/ranger.vim'

" comments out blocks
Plug 'preservim/nerdcommenter'

Plug 'bling/vim-airline'

Plug 'henrik/vim-reveal-in-finder'

Plug 'sheerun/vim-polyglot'

" Plug 'tweekmonster/gofmt.vim'
     • To have some of your "node_modules" files transformed, you can specify a custom "transformIgnorePatterns" in your config.
Plug 'tpope/vim-fugitive'
     • If you simply want to mock your non-JS modules (e.g. binary assets) you can stub them out with the "moduleNameMapper" config option.
Plug 'Yggdroot/indentLine'
    You'll find more details and examples of these config options in the docs:
Plug 'pangloss/vim-javascript'

Plug 'maxmellon/vim-jsx-pretty'
call plug#end()


map <leader>l :Lines<cr>
map <leader>b :Buffers<cr>

let g:ctrlp_working_path_mode = ''

"map <leader>r :Ranger<cr>
"map <leader>e :RangerCurrentFile<cr>
" let g:ranger_replace_netrw = 1

" Setup nerdtree
map <leader>r :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<cr>
let NERDTreeDirArrows=1
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

"" Close all open buffers if only nerdtree is left
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


"inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
"inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
nnoremap <C-p> :<C-u>Files<CR>
"nmap <leader>gd <Plug>(coc-definition)
"nmap <leader>gr <Plug>(coc-references)
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

let ayucolor="dark"
let g:neodark#background='#202020'
colorscheme slate


" comment out blocks
vmap ++ <leader>cc
nmap ++ <leader>cc
let g:NERDSpaceDelims = 1
