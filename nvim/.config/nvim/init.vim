" vim: fdm=marker foldenable sw=4 ts=4 sts=4
" "zo" to open folds, "zc" to close, "zn" to disable.
" {{{ Plugs!
call plug#begin(stdpath('data') . '/plugged')

" breeze colorscheme
" Plug 'fneu/breezy'
" kuroi colorscheme
Plug 'aonemd/kuroi.vim'

" Airline
Plug 'vim-airline/vim-airline'

" Comments
Plug 'tpope/vim-commentary'

" parens, quotes management
Plug 'tpope/vim-surround'

" Better sessions
Plug 'tpope/vim-obsession'

" Instantly preview markdown in browser
Plug 'suan/vim-instant-markdown', {'rtp': 'after'}

" navigate files more easily
Plug 'ctrlpvim/ctrlp.vim'

" make HTML little less painful
Plug 'mattn/emmet-vim'

" File manager?
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Completion and stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Julia support
Plug 'JuliaEditorSupport/julia-vim'

" multiple language support
Plug 'sheerun/vim-polyglot'

" reStructuredText support
Plug 'Rykka/riv.vim'

" org-mode pls
Plug 'jceb/vim-orgmode'

" workspaces? tabs? idk, is has too much. can't get over emacs yet
Plug 'vim-ctrlspace/vim-ctrlspace'

" Time tracking
Plug 'wakatime/vim-wakatime'

" LaTeX
Plug 'lervag/vimtex'

" auto imports
Plug 'anihm136/importmagic.nvim'

call plug#end()
" }}}

" {{{ Coc.nvim
" Disable completion for python
autocmd FileType julia let b:coc_suggest_disable = 1

" <tab> to trigger completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" }}}

" {{{ ctrlspace config
set hidden
set encoding=utf-8
" hac for neovim
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
" Faster startup apparently
if has('win32')
    let s:vimfiles = '~/vimfiles'
    let s:os   = 'windows'
else
    let s:vimfiles = '~/.vim'
    if has('mac') || has('gui_macvim')
        let s:os = 'darwin'
    else
    " elseif has('gui_gtk2') || has('gui_gtk3')
        let s:os = 'linux'
    endif
endif

let g:CtrlSpaceFileEngine = s:vimfiles . '/plugged/vim-ctrlspace' . '/bin/file_engine_' . s:os . '_amd64'

" use ag instead of glob
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

nnoremap <silent><C-p> :CtrlSpace O<CR>

let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
" }}}

" {{{ vim-instant-markdown configurations
"disables autostart
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 0
" }}}

" {{{ vimtex LaTeX
let g:tex_flavor = 'latex'
" }}}

" {{{ vim-commentary config
autocmd FileType julia setlocal commentstring=#\ %s
autocmd FileType c,cpp,java setlocal commentstring=//\ %s
" }}}

" {{{ Misc
" Jump to last position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
" Show line numbers
set number

" split vertical right and horizontal below
set splitright
set splitbelow

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Visualize tabs and newlines
set listchars=tab:▸\ ,trail:·,nbsp:⎵
" set listchars=tab:▸\ ,eol:¬
set list " To enable by default

" For the below command to work, ctags must be installed
command! MakeTags !ctags -R .

" prevent slow O right after returning to normal mode from insert mode
:set ttimeoutlen=100
" }}}

" {{{ Whitespaces and tabs
" Whitespace
" set wrap
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
" }}}

" {{{ Spell check for certain files
autocmd FileType latex,tex,md,markdown setlocal spell
" }}}

" {{{ Stuff from defaults.vim and example vimrc
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
packadd! matchit

" {{{ backup options
set backup		" keep a backup file (restore to previous version)
set undofile	" keep an undo file (undo changes after closing)

set backupdir=~/.vim/tmp//,.
set directory=~/.vim/tmp//,.
set undodir=~/.vim/tmp//,.

" }}}

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

" {{{ Colors and highlighting
" Color scheme (terminal)
set t_Co=256
set background=dark
set termguicolors
colorscheme kuroi
" hi Normal guibg=NONE ctermbg=NONE

" Highlights
" hi SpellBad cterm=none ctermfg=black
" :hi SpellBad ctermfg=black ctermbg=cyan
" hi SpellBad ctermbg=lightgray ctermfg=black
" hi ALEWarning ctermbg=gray ctermfg=black
" :hi YcmWarningSection ctermfg=black ctermbg=red
" :hi MatchParen term=NONE ctermbg=White ctermfg=Blue
" }}}
