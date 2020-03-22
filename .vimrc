" vim: fdm=marker foldenable sw=4 ts=4 sts=4
" "zo" to open folds, "zc" to close, "zn" to disable.

set nocompatible
filetype off
" {{{ PLUGINS!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'

" File manager
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Plugin 'scrooloose/syntastic'
" Using ale instead of syntastic

" Comment/uncomment easily
Plugin 'scrooloose/nerdcommenter'

" Autocompletion
Plugin 'valloric/youcompleteme'

Plugin 'Yggdroot/indentLine'

" Like VSCode's multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" increase indentation size according to the fibonacci series
" Plugin 'dodie/vim-fibo-indent'

" Syntax checker
Plugin 'dense-analysis/ale'

" nice looking status bar
Plugin 'vim-airline/vim-airline'

" enable workspaces (use :ToggleWorkspace to create a new
" workspace)
Plugin 'thaerkh/vim-workspace'

" edit files in directories which don't exist yet
Plugin 'pbrisbin/vim-mkdir'

" Easily mark and unmark checkboxes
Plugin 'jkramer/vim-checkbox'

" Instantly preview markdown in browser
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}

" apparently the best git plugin for vim
Plugin 'tpope/vim-fugitive'

" better markdown support
Plugin 'tpope/vim-markdown'

" brackets and quotes
Plugin 'tpope/vim-surround'

" Automatic brackets and quote matching
Plugin 'jiangmiao/auto-pairs'

" to search through files using ag/ack
" see :Ack section below to enable Ag support
Plugin 'mileszs/ack.vim'

" Plugins end

call vundle#end()
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" {{{ For syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_quiet_messages = { "type": "style" }
" End syntastic
" }}}

" {{{ For ALE
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_linters = {
\   'python': ['pylint'],
\}
let g:ale_fixers = {
\ 'python': ['autopep8']
\}
" End ALE
" }}}

" {{{ For YouCompleteMe
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.ycm_global_extra_conf.py'
"let g:ycm_filetype_specific_completion_to_disable = {
      "\ 'python': 1
      "\}
"let g:ycm_filetype_blacklist = {
      "\ 'python': 1
      "\}
" let g:ycm_auto_trigger = 0
" End YouCompleteMe
" }}}

" {{{ for vim-workspace plugin
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autosave_untrailspaces = 0
" }}}

" {{{ for :Ack
" support for Ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }}}

" Indent lines
let g:indentLine_char = '▏'

" Make tabs 4 spaces
" :set tabstop=4
" :set shiftwidth=4
" :set expandtab

" {{{ Stuff from /etc/vim/vimrc
" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
" }}}

" {{{ Show tabs and spaces
" :set listchars=tab:▸\ ,trail:· 
" :set listchars=tab:├─,trail:·,nbsp:⎵
:set listchars=tab:<─>,trail:·,nbsp:⎵
:set list
" }}}

" {{{ Show line numbers
:set number
:set splitright
" }}}

" {{{ from talk on vim by maxin
set path+=** " Adds ability to search in all subdirs
set wildmenu " Shows tab completion options in command mode

" For the below command to work, ctags must be installed
command! MakeTags !ctags -R .
" }}}

" {{{ vim-instant-markdown configurations
"disables autostart
let g:instant_mardown_autostart = 0
let g:instant_markdown_slow = 1
" }}}

" {{{ Change indent continuously
vmap < <gv
vmap > >gv
" }}}

" {{{ Colors
hi SpellBad cterm=none ctermfg=black ctermbg=lightred
hi ALEWarning cterm=none ctermfg=black ctermbg=red
" }}}

