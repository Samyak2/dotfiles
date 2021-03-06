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
" Plugin 'jkramer/vim-checkbox'

" Instantly preview markdown in browser
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}

" apparently the best git plugin for vim
Plugin 'tpope/vim-fugitive'

" better markdown support
Plugin 'tpope/vim-markdown'

" brackets and quotes
Plugin 'tpope/vim-surround'

" Automatic brackets and quote matching
" Plugin 'jiangmiao/auto-pairs'

" to search through files using ag/ack
" see :Ack section below to enable Ag support
Plugin 'mileszs/ack.vim'

" _vimrc_local.vim support
Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/local_vimrc'

" OpenGL Syntax Highlighting
" Plugin 'beyondmarc/opengl.vim'

" Show git diff markers in gutter
Plugin 'airblade/vim-gitgutter'

" Solarized colorscheme
" Plugin 'altercation/vim-colors-solarized'

" plugin for LaTeX support
Plugin 'lervag/vimtex'

" Julia support
Plugin 'JuliaEditorSupport/julia-vim'

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
\   'cpp': ['clang']
\}
let g:ale_fixers = {
\ 'python': ['autopep8'],
\ 'cpp': ['clang-format'],
\ 'c': ['clang-format']
\}
"let g:ale_python_pylint_options = "--load-plugins pylint_flask_sqlalchemy"
let g:ale_c_gcc_options = '-Wall -Wextra'
let g:ale_c_clang_options = '-Wall -Wextra'
let g:ale_completion_enabled = 0
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
let g:ycm_auto_trigger = 1
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1

" trigger semantic completion after typing 2 characters
let g:ycm_semantic_triggers = {
  \   'cpp': [ 're!\w{2}' ],
  \   'c': [ 're!\w{2}' ]
  \ }

" End YouCompleteMe
" }}}

" {{{ for vim-workspace plugin
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autosave_untrailspaces = 0
let g:workspace_autosave = 0
" }}}

" {{{ for :Ack
" support for Ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }}}

" {{{
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}
" }}}

" Indent lines
let g:indentLine_char = '▏'

" Make tabs 4 spaces
" :set tabstop=4
" :set shiftwidth=4
" :set expandtab
:set softtabstop=4
:set expandtab
:set smarttab
:set shiftwidth=4

" prevent slow O right after returning to normal mode from insert mode
:set ttimeoutlen=100

let maplocalleader = ','

let g:tex_flavor = 'latex'
let g:tex_conceal = ''
hi Conceal ctermfg=White

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
set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
" }}}

" {{{ Stuff from defaults.vim and example vimrc

" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

set history=200		" keep 200 lines of command line history

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" }}}

" {{{ Show tabs and spaces
" :set listchars=tab:▸\ ,trail:· 
" :set listchars=tab:├─,trail:·,nbsp:⎵
:set listchars=tab:<─>,trail:·,nbsp:⎵
" Make tab and trail (from above) to be shown in dark grey
:hi SpecialKey ctermfg=DarkGray
:set list
" }}}

" {{{ Show line numbers and vertical split right
:set number
:set splitright
:set splitbelow
" }}}

" {{{ from talk on vim by maxin
set path+=** " Adds ability to search in all subdirs
set wildmenu " Shows tab completion options in command mode

" For the below command to work, ctags must be installed
command! MakeTags !ctags -R .
" }}}

" {{{ vim-instant-markdown configurations
"disables autostart
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 0
" }}}

" {{{ Change indent continuously
vmap < <gv
vmap > >gv
" }}}

" {{{ Colors and highlighting
:hi SpellBad cterm=none ctermfg=black ctermbg=lightred
:hi ALEWarning cterm=none ctermfg=black ctermbg=red
:hi YcmWarningSection ctermfg=black ctermbg=red
:hi MatchParen term=NONE ctermbg=White ctermfg=Blue

:hi DiffAdd term=bold ctermbg=DarkBlue ctermfg=Black
:hi DiffText term=None ctermbg=DarkRed ctermfg=Magenta
:hi DiffChange ctermbg=Green ctermfg=Black
:hi DiffDelete term=bold ctermfg=DarkBlue ctermbg=Blue

:hi MatchParen ctermfg=white ctermbg=gray
" }}}

" {{{ Enable colorscheme
syntax enable
set background=dark
"colorscheme solarized
" }}}

