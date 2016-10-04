  " Global Settings

  set nocompatible  " Not compatible with older vi
  set history=9999  " History default is 20
  set number        " Show line number of left
  set ruler         " Show the column/rwo
  nnoremap ; :      " Remap ; to : always typing shift
  syntax on         " Enable syntax highlighting
  set guifont=Hack:h11  " GUI font
  set backspace=indent,eol,start   " Allows the backspace to delete indenting, end of lines, and over the start of insert
  set hidden            " Ignore non-modified buffer on exit
  set laststatus=2      " Show two lines for status line
  set display+=lastline       " Always show the last line instead of @ @ @
  set encoding=utf-8          " Enable UTF-8 encoding

  set smartindent       " Insert additional level of indention
  set smarttab          " For TAB use shiftwith on startofline and tabstop elsewhere
  set autoindent        " Apply indention of current line to next line using Enter
  set expandtab         " Expand Tabs into Space
  set pastetoggle=<F3>  " Indent bulk paste
  set tabstop=4         " Columns in Editor when tab is hit
  set shiftwidth=4      " Indention on << and >>


  " Highlight only the lines that go past 80 characters
  highlight ColorColumn ctermbg=green guibg=green
  call matchadd('ColorColumn', '\%82v', 100)

  set ignorecase smartcase  " Ignore case when doing a search as well as highlight it as it is typed
  set hlsearch      " Highlight search terms
  set incsearch     " Show search matches as type
  set showmatch     " Show the matching when doing a search

  set shortmess=I   " Don't show the startup message
  set showcmd     " Show the current command at the bottom

  " Disable beeping and flashing
  set noerrorbells visualbell t_vb=
  autocmd GUIEnter * set visualbell t_vb=

  " Persisten undo
  if has('persistent_undo')
    set undodir=~/.vim/undo/
    set undofile
    set undolevels=1000
    set undoreload=10000
  endif

  " Store backup to .vim/backup
  set backup
  set writebackup
  set backupdir=~/.vim/backup/

  set directory=~/.vim/swap/  " Specific swap folder

  let mapleader = ','         " Map leader to ,

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

  "
  " Folding block settings
  "

  " Off on start
  " set nofoldenable

  " Set indent for folding
  " set foldmethod=indent
  " set foldlevel=20

  " Disble ex mode, ick, remap to Q 
  "
  "   Use command line window with q:
  "   Use search history with q/
  "
  "   Mode info:
  "     http://blog.sanctum.geek.nz/vim-command-window/
  "
    nmap Q q

  "  Show only selected in Visual mode
    nmap <silent> <leader>th :cal ToggleSelected(0)<cr>
    vmap <silent> <leader>th :cal ToggleSelected(1)<cr>

 " Shorcuts to split the window
    nmap <leader>s<bar> :vsplit<cr>
    nmap <leader>s- :split<cr>
    nmap <leader>s? :map <leader>s<cr>

  " Unhighlight the last search pattern on Enter
    nn <silent> <cr> :nohlsearch<cr><cr>

  " When pushing j/k on a line that is wrapped, it navigates to the same line,
  " just to the expected location rather than to the next line
    nnoremap j gj
    nnoremap k gk

    nnoremap <buffer>  <up> <nop>
    nnoremap <buffer>  <down> <nop>
    nnoremap <buffer>  <left> <nop>
    nnoremap <buffer>  <right> <nop>

    inoremap <buffer>  <right> <nop>
    inoremap <buffer>  <left> <nop>
    inoremap <buffer>  <up> <nop>
    inoremap <buffer>  <down> <nop>

    " Map Ctrl+V to paste in Insert mode
    imap <C-V> <C-R>*

    " Map Ctrl+C to copy in Visual mode
    vmap <C-C> "+y

    " Add paste shortcut
    "nmap <leader>P "+p

    " Smarter completion in C
    " autocmd FileType c set omnifunc=ccomplete#Comple\

    " Special flavouring to running programs
    " autocmd FileType asm,c,objc,scheme,sh,python,perl,javascript nn <leader>R :!~/deepThought.sh '%:p'<cr>


  map <F2> :NERDTreeToggle<CR>

  map X dd " single-key delete line

" Jump to last position when re-opening a file
  if has("autocmd")
     au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
  endif

  " Vundle configuration

  filetype off                      " Required
  set rtp+=~/.vim/bundle/Vundle.vim " Required
  call vundle#begin()               " Required  
  Plugin 'VundleVim/Vundle.vim'     " Required
  
  Plugin 'airblade/vim-gitgutter'
  Plugin 'bling/vim-airline'
  Plugin 'Valloric/YouCompleteMe'
 
  " Plugin 'chriskempson/base16-vim'
  " Plugin 'jeetsukumaran/vim-buffergator'
  Plugin 'scrooloose/nerdtree'
  " Plugin 'ctrlpvim/ctrlp.vim'
  " Plugin 'scrooloose/syntastic'
  " Plugin 'tpope/vim-fugitive'
  " Plugin 'nathanaelkane/vim-indent-guides'
  " Plugin 'easymotion/vim-easymotion'
  " Plugin 'majutsushi/tagbar'
  " Plugin 'terryma/vim-multiple-cursors'
  " Plugin 'flazz/vim-colorschemes'
  " Plugin 'wikitopian/hardmode'
  " Plugin 'mattn/gist-vim'

  " let g:color_schemes = 'vim-colorschemes'
  filetype plugin indent on    " Required
  call vundle#end()            " Required 

  set background=dark
  colorscheme solarized

"  Fugitive mappings
"  nmap <leader>gc :Gcommit<cr>
"  nmap <leader>gp :Git pull<cr>
"  nmap <leader>gl :Git push<cr>
"  nmap <leader>gs :Gstatus<cr>
"  nmap <leader>ga :Git add<cr>
"  nmap <leader>g? :map <leader>g<cr>

" Indent-guides configuration
"  let g:indent_guides_guide_size = 1
"  let g:indent_guides_start_level = 2
"  let g:indent_guides_enable_on_vim_startup = 0
"  let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
"  let g:indent_guides_default_mapping = 1

" Ctrlp configuration
  nmap <leader>p :CtrlP
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn)|\_site$',
        \ 'file': '\v\.(class|jpg|jepg|mp4|avi|iso|gmd|pkg)$',
        \ }

" YouCompleteMe configuration
  let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
  let g:ycm_autoclose_preview_window_after_completion = 1


" vim-airline configuration
  let g:airline_powerline_fonts = 1
  let g:airline_section_y='%{strftime("%I:%M")}'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#syntastic#enabled = 1

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

  " Easymotion configuration
  " map <space> <Plug>(easymotion-prefix)

  " let g:EasyMotion_smartcase = 1
  " map <space>h <Plug>(easymotion-lineforward)
  " map <space>j <Plug>(easymotion-j)
  " map <space>k <Plug>(easymotion-k)
  " map <space>l <Plug>(easymotion-linebackward)

  " let g:EasyMotion_startofline = 0

  " Undotree settings
  " let g:undotree_SplitWidth = 30
  " let g:undotree_WindowLayout = 3

  " Multiple Cursors Settings
  " let g:multi_cursor_use_default_mapping = 0
  " let g:multi_cursor_next_key = '<C-j>'
  " let g:multi_cursor_prev_key = '<C-k>'
  " let g:multi_cursor_skip_key = '<C-x>'
  " let g:multi_cursor_quit_key = '<Esc>'

  " NERDTRee Options
    let NERDTreeShowHidden=1
    let NERDTreeMinimalUI=1

  " vim Explorer settings
  " map <F2> :Explore<cr>
  " let g:netrw_liststyle=3

  " Buffer Options

    " To open a new empty buffer
    nmap <leader>t :enew<CR>

    " Buffer navigation
    nmap <leader>j :bnext<CR>
    nmap <leader>h :bprevious<CR>

    " Close the current buffer and move to the previous one
    " Replicate the idea of closing a tab
    nmap <leader>bq :bp <BAR> bd #<CR>

    " Show all open buffers and their status
    nmap <leader>bl :ls<CR>

  " Buffergator Settings

    " Goto the previous buffer open
    " nmap <leader>jj :BuffergatorMruCyclePrev<cr>

    " Goto the next buffer open
    " nmap <leader>kk :BuffergatorMruCycleNext<cr>

    " View the entire list of buffers open
    " nmap <leader>bl :BuffergatorOpen<cr>

  " Disable ridiculous mappings
     let g:vimrplugin_insert_mode_cmds = 0

   " Syntastic Settings
   " set statusline+=%#warningmsg#
   " set statusline+=%{SyntatisStatuslineFlag()}
   " set statusline+=%*

   " let g:syntastic_always_populate_loc_list=1
   " let g:syntastic_error_symbol = '✗'
   " let g:syntastic_warning_symbol = '⚠'
   " let g:syntastic_enable_signs = 1

   " let g:syntastic_auto_loc_list = 1
   " let g:syntastic_check_on_open  = 1
   " let g:syntastic_check_on_wq = 0

   " let g:syntastic_cpp_checkers = [ ]
   " let g:syntastic_cpp_compiler = 'clang++'
   " let g:syntastic_cpp_compiler_options = '-Wall -Wextra -Werror'
   " let g:syntastic_cpp_compiler_options = '-Wall  -Werror'
   " let g:syntastic_c_checkers = [ ]
   " let g:syntastic_c_compiler = 'clang++'
   " let g:syntastic_c_compiler_options = '-Wall -Wextra -Werror'

   " let g:syntatic_ignore_files = ['*.htmli$']
