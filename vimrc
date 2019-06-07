" ------------------------------------------------------------------------------
"  Plugin management with Vundle
" ------------------------------------------------------------------------------
" Fire up the new VIM only features
set nocompatible              " be iMproved, required by vundle
filetype off                  " required by vundle

" ------------------------------------------------------------------------------
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ------------------------------------------------------------------------------
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
" :PluginUpdate        - pulls the latest version of the update from their repo's
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
"
" ------------------------------------------------------------------------------
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Some 'sensible' defaults for VIM
if !has('nvim')
  Plugin 'tpope/vim-sensible.git'
endif

" VIM as IDE tools
" Auto-complete
Plugin 'Valloric/YouCompleteMe'
" Syntax checking
Plugin 'vim-syntastic/syntastic'

" VIM as IDE Python support
" Python VirtualEnv Support
Plugin 'jmcantrell/vim-virtualenv'
" Python Indent mod
Plugin 'hynek/vim-python-pep8-indent'
" PEP8 wrapper
Plugin 'nvie/vim-flake8'

" VIM as IDE UX changes
" Fancy status line
Plugin 'bling/vim-airline'

" VIM as IDE - Revision control
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" CSV Editor
" Plugin 'chrisbra/csv.vim'
"
" HTML tag matching
" Plugin 'gregsexton/MatchTag'
Plugin 'valloric/MatchTagAlways'

" ------------------------------------------------------------------------------
" All of your Plugins must be added before the following line
" ------------------------------------------------------------------------------
call vundle#end()
filetype plugin indent on    " required by Vundle

" ------------------------------------------------------------------------------
" Regular VIMRC stuff - also plugin configuration options
" ------------------------------------------------------------------------------
" --------------------------------------
" The <leader> key is a '/' by default.
" --------------------------------------
let mapleader = ","

" --------------------------------------
" Fancy color scheme
" --------------------------------------
syntax on
colorscheme xoria256

" --------------------------------------
" Auto carriage return on line length
" set textwidth=79
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=235

" --------------------------------------
" Tab and Whitespace hints
set list!
set listchars=tab:>-,trail:.,extends:>

" --------------------------------------
" Highlight search results
set hlsearch
" set incsearch
set noignorecase
" set smartcase

" --------------------------------------
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" --------------------------------------
" Windowing shortcuts
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" --------------------------------------
" VIM Buffers and Tabs
" --------------------------------------
" buffers to tabs
map <leader>, <esc>:tab sball<CR>

" buffer navigation
nnoremap gb :ls<CR>:b<Space>

" --------------------------------------
" Code Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" --------------------------------------
" Ignore whitespace for vimdiff
set diffopt+=iwhite

" --------------------------------------
" map sort function to a key
vnoremap <leader>s :sort<CR>

" --------------------------------------
" Re-select a block of text after changing its indent level
" Turns out I don't like this, I can just use '.' to indent again
" vnoremap < <gv
" vnoremap > >gv

" --------------------------------------
" Line Numbering
" --------------------------------------
set number relativenumber

" Auto-toggle when changing buffer focus
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Shortcuts to toggle relative line numbers and all line numbering
nnoremap <leader>n :set rnu!<CR>
nnoremap <C-n> :set rnu!<CR>:set nu!<CR>

" ------------------------------------------------------------------------------
" Filetypes, Tab and Whitespace Management
" ------------------------------------------------------------------------------
" Default tabs and indenting setup
set expandtab      " expand tabs into spaces
set tabstop=8      " Tabstop = 8 - to match typical files
set softtabstop=4  " SoftTabstop = 4 - behave like TS=4 when editing though
set shiftwidth=4   " Shiftwidth = 8 - characters to indent for Smart/Autoindent
set shiftround     " Indent changes stop at tabstops
set nosmartindent  " Old school smart indenting not needed

" Filetype Specific Tab Behaviors Setup
au FileType python set ts=4 sts=4 sw=4         " Python
au FileType python set textwidth=0             " Python needs \ for newlines
au FileType ruby   set ts=2 sw=2               " Ruby
au FileType c,cpp  set ts=4 sw=4 cindent       " C & C++
au FileType javascript set ts=4 sts=4 sw=4     " Javascript
au FileType docbk,html,xhtml,xml,tmpl,django set ts=2 sts=2 sw=2 tw=0 noexpandtab" DocBook, HTML, XHTML, and XML, Django Templates
au FileType php set ts=2 sts=2 noexpandtab tw=0 " PHP
au FileType perl set ts=2 sts=2 sw=2 tw=0
au FileType tcl set ts=4 sts=4 sw=4 tw=0

" Verilog/System Verilog
au BufRead,BufNewFile *.v,*.vh,*.sv,*.svh set filetype=verilog_systemverilog
au FileType verilog_systemverilog set ts=2 sts=2 sw=2 tw=0

" Suspiciously likely to be Django files
" Enable For Django Snippets
" Auto detect of Django templates seems to 'just work'
au BufNewFile,BufRead admin.py     setlocal filetype=python.django
au BufNewFile,BufRead urls.py      setlocal filetype=python.django
au BufNewFile,BufRead models.py    setlocal filetype=python.django
au BufNewFile,BufRead views.py     setlocal filetype=python.django
au BufNewFile,BufRead settings.py  setlocal filetype=python.django
au BufNewFile,BufRead forms.py     setlocal filetype=python.django

function! DetectDjangoTemplate()
    let path = expand('%:p')
    if path =~ '.*template.*'
        set filetype=django
    endif
endfunction

au BufRead,BufNewFile *.html call DetectDjangoTemplate()

" Stata files
au BufRead,BufNewFile *.ado        setlocal filetype=stata
au BufRead,BufNewFile *.class      setlocal filetype=stata
au BufRead,BufNewFile *.do         setlocal filetype=stata

" ------------------------------------------------------------------------------
" Code folding limits
" ------------------------------------------------------------------------------
" autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0

" ------------------------------------------------------------------------------
" Special Handling of saving files
" ------------------------------------------------------------------------------
" Remove trailing whitespaces when saving
au BufWritePre *.py,*.v,*.sv,*.c :%s/\s\+$//e

" Automatic reloading of .vimrc
au! bufwritepost .vimrc source %

" ------------------------------------------------------------------------------
"  File Navigation and Buffers
" ------------------------------------------------------------------------------
"  Remove the silly banner when using the file browser
let g:netrw_banner = 0

" --------------------------------------
"  You Complete Me default compile flags
" --------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_server_keep_logfiles = 1

" --------------------------------------
" Context Aware Tab completion
" au FileType python set omnifunc=pythoncomplete#Complete
au FileType verilog_systemverilog let g:SuperTabDefaultCompletionType = "context"

" Now we just enable the menu and pydoc preview to get the most useful information out of the code completion:
" set completeopt=menuone,longest,preview

" ------------------------------------------------------------------------------
" Other Plugin Time
" ------------------------------------------------------------------------------

" --------------------------------------
" MatchTagAlways
" --------------------------------------
nnoremap <leader>% :MtaJumpToOtherTag<cr>

