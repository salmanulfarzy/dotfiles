  " Global Settings

  set nocompatible  " Not compatible with older vi
  set history=256   " History default is 20
  set number        " Show line number of left
  set ruler         " Show the column/rwo

  syntax enable         " Enable syntax highlighting

  set backspace=indent,eol,start   " Allows the backspace to delete indenting, end of lines, and over the start of insert
  set hidden            " Ignore non-modified buffer on exit
  set laststatus=2      " Show two lines for status line
  set display+=lastline       " Always show the last line instead of @ @ @
  set encoding=utf-8          " Enable UTF-8 encoding

  " set smartindent       " Insert additional level of indention
  set cindent
  set smarttab          " For TAB use shiftwith on startofline and tabstop elsewhere
  set autoindent        " Apply indention of current line to next line using Enter
  set expandtab         " Expand Tabs into Space
  set pastetoggle=<F3>  " Indent bulk paste
  set tabstop=4         " Columns in Editor when tab is hit
  set shiftwidth=4      " Indention on << and >>

  autocmd FileType html setlocal tabstop=2 shiftwidth=2
  autocmd FileType css setlocal tabstop=2 shiftwidth=2

  set ignorecase smartcase  " Ignore case when doing a search as well as highlight it as it is typed
  set hlsearch      " Highlight search terms
  set incsearch     " Show search matches as type
  set showmatch     " Show the matching when doing a search

  set shortmess=I   " Don't show the startup message
  set showcmd     " Show the current command at the bottom

  " Store backup to .vim/backup
  set backup
  set writebackup
  set backupdir=~/.vim/backup/
  set directory=~/.vim/swap/  " Specific swap folder
  let mapleader=','         " Map leader to ,

  set wildmenu    " Enhanced mode for command line completion
  set wildmode=longest:list,full

  " Ignore some defaults
  set wildignore+=*.so,*.swp,*.zip
  set wildignore+=*/.Trash/**,,*.Library/**
  set wildignore+=*.o,*.obj,*~,*.pyc
  set wildignore+=.env
  set wildignore+=.git,.gitkeep
  set wildignore+=.tmp
  set wildignore+=*DS_Store*
  set wildignore+=log/**
  set wildignore+=tmp/**
  set wildignore+=*.png,*.jpeg,*.jpg,*.gif,*.pdf
  set wildignore+=*.dmg,*.app
  set wildignore+=*.mp*

  " Set mouse
  set mouse=a

  nmap Q q

  "  Show only selected in Visual mode
  nmap <silent> <leader>th :cal ToggleSelected(0)<cr>
  vmap <silent> <leader>th :cal ToggleSelected(1)<cr>

  " Shorcuts to split the window
  nmap <leader>s<bar> :vsplit<cr>
  nmap <leader>s- :split<cr>
  nmap <leader>s? :map <leader>s<cr>

  " Easier split navigation
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

  " Unhighlight the last search pattern on Enter
  nn <silent> <cr> :nohlsearch<cr><cr>

  " When pushing j/k on a line that is wrapped, it navigates to the same line,
  " just to the expected location rather than to the next line
  nnoremap j gj
  nnoremap k gk

  " Disable arrow keys in normal mode
  nnoremap <buffer>  <up> <nop>
  nnoremap <buffer>  <down> <nop>
  nnoremap <buffer>  <left> <nop>
  nnoremap <buffer>  <right> <nop>

  " Disable arrow keys in insert mode
  inoremap <buffer>  <right> <nop>
  inoremap <buffer>  <left> <nop>
  inoremap <buffer>  <up> <nop>
  inoremap <buffer>  <down> <nop>

  " Keymap to toggle NERDTree
  map <F2> :NERDTreeToggle<CR>

  " Map Ctrl+V to paste in Insert mode
  imap <C-V> <C-R>*

  " Map Ctrl+C to copy in Visual mode
  vmap <C-C> "+y

  " Jump to last cursor position when re-opening a file
  if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif

   map X dd " single-key delete line

  " Check vim-plug installation
  if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

    " vim-plug configuration

  call plug#begin('~/.vim/bundle')

  Plug 'airblade/vim-gitgutter'
  Plug 'bling/vim-airline'
  Plug 'Valloric/YouCompleteMe'
  Plug 'tpope/vim-fugitive'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'majutsushi/tagbar'

  call plug#end()            " Required

  " set background=dark
  " colorscheme solarized

  " Ctrlp configuration
  nmap <leader>p :CtrlP<CR>
  let g:ctrlp_cmd='CtrlP'
  let g:ctrlp_working_path_mode='ra'
  let g:ctrlp_custom_ignore={
              \ 'dir':  '\v[\/]\.(git|hg|svn)|env|\_site$',
              \ 'file': '\v\.(class|jpg|jepg|mp4|avi|iso|gmd|pkg)$',
              \ }

" YouCompleteMe configuration
  let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
  let g:ycm_autoclose_preview_window_after_completion=1
  let g:ycm_python_binary_path='python'


" vim-airline configuration
  " let g:airline_powerline_fonts=1
  let g:airline_section_y='%{strftime("%I:%M")}'
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#branch#enabled=1

" Tagbar configuration
  nmap <F8> :TagbarToggle<CR>

" NERD Tree configuration
  let NERDTreeShowHidden=1
  let NERDTreeMinimalUI=1
  let NERDTreeIgnore=['\.git[[dir]]', 'env$[[dir]]']

" NERD Commenter configuration
  let g:NERDSpaceDelims = 1
  let g:NERDTrimTrailingWhitespace = 1


" Show trailing whitespace and tabs obnoxiously
  set list listchars=tab:▸\ ,trail:.
  set list

  fun! ToggleWhitespace()
    ToggleBadWhitespace
    if &list
      set nolist
    else
      set list listchars=tab:▸\ ,trail:.
      set list
    endif
  endfun


  " To open a new empty buffer
  nmap <leader>t :enew<CR>

  " Buffer navigation
  nmap <leader>j :bnext<CR>
  nmap <leader>h :bprevious<CR>
  nmap <tab> :b#<cr>

  " Close the current buffer and move to the previous one
  " Replicate the idea of closing a tab
  nmap <leader>bq :bp <BAR> bd #<CR>

  " Show all open buffers and their status
  nmap <leader>bl :ls<CR>

  " Disable ridiculous mappings
  let g:vimrplugin_insert_mode_cmds=0

  " Launch Marked2
  nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p'<cr>
