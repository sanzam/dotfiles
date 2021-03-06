"  Configuration file for Vim
"  (http://www.vim.org)

"  Darian Moody <mail@djm.org.uk>
"  https://github.com/djm/dotfiles/vim/vimrc
"  BSD License


" vundle setup.
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'              " the package manager itself.

Plugin 'nanotech/jellybeans.vim'        " jellybeans colorscheme.
Plugin 'tomasr/molokai'                 " molokai colorscheme.
Plugin 'altercation/solarized'          " solarized colorscheme.
Plugin 'mileszs/ack.vim'                " support for ack inside vim.
Plugin 'kien/ctrlp.vim'                 " full path fuzzy file finder.
Plugin 'sjl/gundo.vim'                  " visualises the vim undo tree.
Plugin 'scrooloose/syntastic'           " better syntax hightlighting support.
Plugin 'YankRing.vim'                   " maintains a history of yanks.
Plugin 'lilydjwg/colorizer'             " hex/rgb colours inline.
Plugin 'tpope/vim-fugitive'             " adds git support.
Plugin 'tpope/vim-vinegar'              " simple dir browsing.
Plugin 'bling/vim-airline'              " better status line.
Plugin 'jmcantrell/vim-virtualenv'      " Virtualenv support.
Plugin 'hail2u/vim-css3-syntax'         " CSS3 support.
Plugin 'groenewege/vim-less'            " LESS support.
Plugin 'chase/vim-ansible-yaml'         " Ansible support.
Plugin 'fatih/vim-go'                   " Golang support.
Plugin 'pangloss/vim-javascript'        " JS support.
Plugin 'elixir-lang/vim-elixir'         " Elixir support.
Plugin 'jimenezrick/vimerl'             " Erlang support.
Plugin 'chrisbra/csv.vim'               " CSV support.
Plugin 'wavded/vim-stylus'              " Stylus support.
Plugin 'ntpeters/vim-better-whitespace' " better visual whitespace support.

call vundle#end()

" Source Google vim helpers - only run while inside Google.
let googlevim = "/usr/share/vim/google/google.vim"
if filereadable(googlevim)
    exec 'source '.fnameescape(googlevim)
end

" Set filetype for 'odd' file extensions.
au BufNewFile,BufRead *.dump set filetype=sql
au BufNewFile,BufRead *.wsgi set filetype=python
au BufNewFile,BufRead Vagrantfile set filetype=ruby
au BufNewFile,BufRead *.j2 set filetype=html
au BufNewFile,BufRead *.md set filetype=markdown

au FocusLost * :wa          " saves all files automatically on losing focus.

filetype plugin indent on   " detect file type and load indents and plugins.
syntax on                   " enable syntax highlighting.
set t_Co=256                " enable 256 colours support.
colorscheme jellybeans      " sets the default colorscheme. Options options: molokai, solarized.

set autoread                " reload the buffer when files are changed externally.
set clipboard=unnamed       " yank using system clipboard.
set encoding=utf-8          " default character encoding.
set hidden                  " do not unload hidden buffers.
set undofile                " turns on tree-like undo functionality.
set undodir=~/.vim-undo/    " the dirtory to store the undo files in.

set laststatus=2            " permanently enable the status line.
set nowrap                  " do not wrap text.
set relativenumber          " show relative line numbers.
set scrolloff=5             " how many lines to keep above/below cursor.
set showcmd                 " show command line at bottom of screen.
set sidescroll=3            " number of chars to scroll sideways at a time.
set splitright              " open vertical split to the right.
set wildmenu                " tab completion for commands.
set wildmode=list:longest   " multiple tab completion matches: list all, complete common string.
set wildignore=*.pyc        " ignore in tab completion.
set modelines=0             " modelines is a security flaw.
set pastetoggle=<F2>        " key to enable paste friendly mode.

set cursorline              " highlights the current line.
set ruler                   " enables the ruler (curr. file position).
set showmode                " shows which mode you are in.
set ttyfast                 " enables faster scrolling.

set backspace=2             " make backspace behave like other apps.
set expandtab               " insert tabs as spaces.
set shiftwidth=4            " number of spaces for auto indent and line shift.
set cindent                 " syntax-aware auto indent.
set smarttab                " backspace deletes a shiftwidth worth of space.
set softtabstop=4           " number of spaces pressing tab counts for.
set tabstop=4               " number of spaces a tab in a file counts for.

set showmatch               " show matching brackets.
set ignorecase              " ignore case during pattern matching.
set smartcase               " if search contains upper case char, make search case sensitive.
set hlsearch                " keep previous search highlighted.
set incsearch               " highlight matches while typing.
set gdefault                " use global line replacement by default.

set guioptions-=m           " gui: remove menu
set guioptions-=T           " gui: remove toolbar

" Remap space to be our leader key.
nnoremap <space> <nop>
let mapleader = "\<space>"

" Better search handling.
nnoremap / /\v
vnoremap / /\v

" Disable highlighting of last search.
nnoremap <leader>, :noh<CR>

" Remap F1 to ESC in all modes.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Remap some common fat-fingered commands.
command WQ wq
command Wq wq
command W w
command Q q

" Remap a quick shortcut to get out of insert mode.
imap jk <Esc>

" Remap semi-colon for more fat-fingered-ness.
noremap ; :

" Prevent overwriting default register (system clipboard) when inconvenient.
vnoremap x "_x
vnoremap c "_c
vnoremap p "_dP

" Move between open buffers easily.
noremap <C-J> :bp<CR>
noremap <C-K> :bn<CR>
noremap <Leader>d :bd!<CR>:bp<CR>

" Move between vertical splits easily.
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" Highlight TODO statements.
match Todo /\s\+$/

" Turn off visual and sound bells.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Toggle relative numbers on/off when joining/leaving insert mode.
autocmd InsertEnter * silent! :set norelativenumber number
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

" Remove trailing whitespace and empty lines at end of file on write.
augroup whitespace
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
    autocmd BufWritePre * :%s/\($\n\s*\)\+\%$//e
augroup END

" Fugitive mappings.
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gmv :Gmove<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Git push<CR>

" Split the window and swap to it.
nnoremap <leader>s <C-w>v<C-w>l

" Delete the file on disk but keep the buffer.
nnoremap <leader>rm :call delete(expand('%'))<CR>

" Toggle the 80-char column on & off.
nnoremap <leader>c :call ColumnToggle()<CR>

" Switches between relative and static line numbering.
nnoremap <leader>n :call NumberToggle()<CR>

" Fixes ^M line endings.
nnoremap <leader>F :update<CR>:e ++ff=dos<CR>:setlocal ff=unix<CR>:w<CR>

" Use leader + number to indicate tab spacing settings.
nnoremap <leader>2 :setlocal sw=2 ts=2 sts=2 expandtab<CR>
nnoremap <leader>4 :setlocal sw=4 ts=4 sts=4 expandtab<CR>
nnoremap <leader><tab> :setlocal sw=4 ts=4 sts=4 noexpandtab<CR>

" Gundo configuration.
nnoremap <leader>g :GundoToggle<CR> " gundo

" Vim-airline configuration.
let g:airline#extensions#tabline#enabled = 1

" Ctrl-p configuration.
let g:ctrlp_map = '<leader>pf'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_use_caching = 200 " disable path caching for small dirs.

" Yankring configuration.
let g:yankring_history_file = '.yankring_history'

" Syntastic configuration.
let g:syntastic_enable_signs=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['html'] }
let g:syntastic_auto_loc_list=1
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_javascript_checkers = ["standard"]

function! ColumnToggle()
" Toggles the 80-char column.
    if exists("&colorcolumn")
        set colorcolumn=80
    endif
endfunction

function! NumberToggle()
" Toggles relative line numbers.
    if exists("&rnu")
        if &number
            setlocal relativenumber
        else
            setlocal number
        endif
    else
        setlocal nonumber
    endif
endfunction

" Google specific settings - only run while inside Google.
if filereadable(googlevim)
  Glug piper plugin[mappings]
  Glug relatedfiles plugin[mappings]
end
