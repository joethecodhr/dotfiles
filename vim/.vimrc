set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required

set runtimepath^=~/.vim/bundle/ctrlp.vim

set encoding=utf-8
set termencoding=utf-8

"fix backspace after insert
set backspace=indent,eol,start

"powerline
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
set laststatus=2

" fancy utf-8 powerline. requires a patched font.
" let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized26_light'

" do not show -- INSERT -- after the status line, since powerline does this already
set noshowmode

" fast escaping of modes
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" Spell checking.
set spell spelllang=en_us
set nospell

" coding stuff
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin on
filetype indent on
set autoindent
set cindent
syntax on

" tmux color setting
set t_Co=256

" colorschemes
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"colorscheme solarized
"color jellybeans
"color railscasts
"color railscasts256
"set lines=55
"set columns=114
"let g:zenburn_transparent=1
"colorscheme zenburn


" line numbers
set number

" crosshair for your cursor
" set cursorline
" set cursorcolumn

set lazyredraw
let html_no_rendering=1
" set scrolljump=8
set noshowmatch
let loaded_matchparen=1

" fonts
set guifont=Monaco_for_Powerline:h14
"set guifont=Terminus:h14
"set guifont=Menlo_Regular:h14
"set guifont=Source_Code_Pro_Bold:h15
"set guifont=Cousine:h14
"set guifont=Anonymous_Pro:h12
"set guifont=Pet\ Me\ 128\ 2Y:h16

"set noantialias
"set antialias

" use /tmp for temporary files
set directory=/tmp
set backupdir=/tmp

" ignore case when searching
set ignorecase

" unless you put a capital in the search string
set smartcase

"autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" using powerline, so comment this out
"set statusline=%<%F%=\ [%M%R%H%Y]\ (%(%l,%c%))

" ctags configuration
set tags=/Users/jhopkinson/support/tags
set notagrelative

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" autocmd FileType php noremap <C-L> :!php -l %<CR>

" set fuoptions=maxvert,maxhorz

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

"autocmd BufWritePost *.php !php -l <afile>
"autocmd FileType php set keywordprg=phpdoc.sh
autocmd FileType markdown,text set keywordprg=pandoc.sh


"LaTeX
autocmd BufWritePost *.tex !pdflatex <afile>

"Graphviz
autocmd BufWritePost *.dot !dot -Tpng <afile> > <afile>.png; open <afile>.png

"DN standards
let g:syntastic_php_phpcs_args = '--standard=/Users/jhopkinson/support/phpcs.xml'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
map = :lnext<CR>
map - :lprev<CR>

"augroup pencil
"  autocmd!
"  autocmd FileType markdown,mkd call pencil#init({'wrap': 'hard', 'textwidth': 80})
"augroup END

"autocmd BufWritePost *.php :! php_save.sh %

" tslime configuration
let b:tmux_sessionname="scheme"
let b:tmux_windowname="main"
let b:tmux_panenumber="2"
let g:tslime_ensure_trailing_newlines = 1
let g:tslime_normal_mapping = '<localleader>t'
let g:tslime_visual_mapping = '<localleader>t'
let g:tslime_vars_mapping = '<localleader>T'

autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt

let g:niji_dark_colours = [
    \ [ '81', '#5fd7ff'],
    \ [ '99', '#875fff'],
    \ [ '1',  '#dc322f'],
    \ [ '76', '#5fd700'],
    \ [ '3',  '#b58900'],
    \ [ '2',  '#859900'],
    \ [ '6',  '#2aa198'],
    \ [ '4',  '#268bd2'],
    \ ]

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

