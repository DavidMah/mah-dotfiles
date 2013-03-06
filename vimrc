"""""""""""""""""""""
" Personal Settings "
"""""""""""""""""""""
set noswapfile
call pathogen#infect()

set mouse=a

colorscheme colorer
let mapleader='f'
set wrap

" GVim Font Size changing functions
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + (2 * a:amount)
    let newfont = fontname . newsize
    let &guifont = newfont
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()"

map <Leader>= :LargerFont<Enter>
map <Leader>- :SmallerFont<Enter>

" Tab interfacing
map T :tabnew<Enter>
map <Leader>[ gT
map <Leader>] gt

" ; to be the same as ;
" nnoremap ; :

" Dealing with HTML.vim
" Don't ruin semicolon
:let g:html_map_leader = '\'
" Don't insert all caps tags
:let g:html_tag_case = 'lowercase'
" Don't let html.vim override anything else
:let g:no_html_map_override = 'yes'
" What is this toolbar I do not want it
:let g:no_html_toolbar = 'yes'


set nocompatible

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
" set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Change method of autocompletion
set wildmode=longest,list:longest

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" https://github.com/gmarik/vundle
Bundle 'gmarik/vundle'
" https://github.com/mattn/webapi-vim
Bundle 'mattn/webapi-vim'
" https://github.com/mattn/gist-vim
Bundle 'mattn/gist-vim'

if has("autocmd")
  " Racket Scheme for .rkt and .rktl files
  au BufReadPost *.rkt,*.rktl set filetype=scheme
  " Scala for using tabs
  " au BufReadPost *.scala set noexpandtab
  " au BufReadPost *.scala set tabstop=2
endif

"""""""""""""""""""""""""
" Personal Settings End "
"""""""""""""""""""""""""

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-K> [e
nmap <C-J> ]e
" Bubble multiple lines
vmap <C-K> [egv
vmap <C-J> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Use modeline overrides
set modeline
set modelines=10

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Show (partial) command in the status line
set showcmd

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
