"frappe/erpnext"" Plugins
"""" Dein-begin

if &runtimepath !~# '/dein.vim'
  let s:dein_dir = expand('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  if !isdirectory(s:dein_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_dir))
  endif

  execute 'set runtimepath^=' . s:dein_dir
endif

call dein#begin(expand('~/.cache/dein'))

"""" Plugin manager
call dein#add('Shougo/dein.vim')
call dein#add('haya14busa/dein-command.vim')

"""" Look & feel
call dein#add('chriskempson/base16-vim')                " Color theme
call dein#add('itchyny/lightline.vim')                  " Bottom bar
call dein#add('mgee/lightline-bufferline')              " Top bar
call dein#add('maximbaz/lightline-trailing-whitespace') " Trailing whitespace indicator
call dein#add('gcavallanti/vim-noscrollbar')            " Scrollbar for statusline
call dein#add('cskeeters/vim-smooth-scroll')            " Smooth scroll
call dein#add('moll/vim-bbye')                          " Keep window when closing a buffer
call dein#add('junegunn/goyo.vim')                     " Distrction free writing

"""" format code
call dein#add('tpope/vim-sleuth')              " automatically detect tabs vs spaces
call dein#add('sbdchd/neoformat')              " automatically format code
call dein#add('editorconfig/editorconfig-vim') " Follow editorconfig if available
call dein#add('dhruvasagar/vim-table-mode')    " Quickly create markdown table

"""" Manipulate code
call dein#add('tpope/vim-surround')                                   " Surround
call dein#add('Raimondi/delimitMate')                                 " Insert closing brackets automatically
call dein#add('tomtom/tcomment_vim')                                  " Comment lines
call dein#add('junegunn/vim-easy-align')                              " Easy align around equals
call dein#add('alvan/vim-closetag')                                   " Automatically put closing tag in XML
call dein#add('matze/vim-move')                                       " Move blocks of code

"""" Snippets
call dein#add('SirVer/ultisnips')                                     " Snippet engine
call dein#add('honza/vim-snippets')                                   " List of snippets

"""" Navigate files, buffers and panes
call dein#add('airblade/vim-rooter')                                  " Change working directory to the project root
call dein#add('scrooloose/nerdtree')
call dein#add('junegunn/fzf', {'build': './install --bin'})           " Fuzzy search - binary
call dein#add('junegunn/fzf.vim')                                     " Fuzzy search - vim plugin
call dein#add('benizi/vim-automkdir')                                 " Automatically create missing folders on save

"""" Autocomplete
call dein#add('Shougo/deoplete.nvim')                                 " Autocomplete engine
call dein#add('Shougo/neco-vim')                                      " Vim
call dein#add('zchee/deoplete-jedi')                                  " Python
call dein#add('carlitux/deoplete-ternjs')                             " Javascript
call dein#add('zchee/deoplete-zsh')                                   " ZSH

"""" Git
call dein#add('tpope/vim-fugitive')                                   " Git integration
call dein#add('airblade/vim-gitgutter')                               " Git gutter

"""" Render code
call dein#add('sheerun/vim-polyglot')                                 " Many many syntaxes
call dein#add('ap/vim-css-color')                                     " Colors in CSS
call dein#add('euclio/vim-markdown-composer',
      \ {'build': 'cargo build --release'})                           " Instantly preview markdown

"""" Lint code
call dein#add('w0rp/ale')

"""" Dein-end
call dein#end()

if dein#check_install()
  call dein#install()
endif

""" Environment
"""" General
filetype plugin indent on
syntax on
let &fillchars="vert:|,fold: ,diff: "
set cursorline                                                  " Spot the cursor easier
set diffopt+=iwhite                                             " Ignore whitespace changes
set formatoptions+=l                                            " Don't wrap long lines when editing them
set formatoptions+=n                                            " Recognize numbered lists
set formatoptions+=o                                            " Continue comment when pressing o or O
set formatoptions+=r                                            " Continue comment when pressing Enter
set formatoptions-=c                                            " Don't wrap long comments
set formatoptions-=t                                            " Don't wrap long lines when typing them
set hidden                                                      " Keep buffer around even if it is not displayed right now
set history=32
set ignorecase                                                  " Ignore search case
set lazyredraw                                                  " Don't redraw when there is no need for it
set linebreak                                                   " Wrap lines intelligently, e.g. by end of words
set list                                                        " Display unusual whitespace characters
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨ " Which whitespace characters to display and how
set showbreak=↪\                                                " Highlight beginning of wrpped lines
set mouse=a                                                     " Enable mouse support
set noshowmode                                                  " Don't show current mode in echo
set nostartofline                                               " Don't move cursor on the line when moving around
set nrformats=                                                  " Use only decimal numbers base when incrementing numbers
set number                                                      " Show line numbers
set report=0                                                    " Always report how many lines substitute changed
set scrolloff=3                                                 " Number of lines to keep above and below cursor
set shiftround                                                  " Round indent to a multiple of shiftwidth
set shiftwidth=2                                                " Tab shifts by this number of spaces
set shortmess+=I                                                " Don't show intro msg when starting vim
set shortmess+=c                                                " Don't echo while autocompletion in insert mode
set hlsearch                                                    " Highlight search terms
set incsearch                                                   " Show search matches as type
set showmatch                                                   " Show the matching when doing a search
set showcmd
set showtabline=2
set sidescrolloff=3                                             " Number of columns to keep on the left/right of the cursor
set smartcase
set spelllang=en
set splitbelow
set splitright
set tabstop=2
set title                                                       " Change terminal title based on the file name
set updatetime=100
set virtualedit=all



set wildmenu                        " Enhanced mode for command line completion
set wildmode=longest,list,full
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

"""" Theme
set termguicolors
set background=dark
colorscheme base16-tomorrow-night
set guioptions+=c
set guioptions-=T
set guioptions-=m
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
hi LineNr ctermfg=244 ctermbg=235

""" Keyboard shortcuts
"""" Leader
let mapleader=","

"""" Write buffer
nnoremap <Leader>w :w<CR>

"""" Fix spelling mistake
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u`

"""" Split windows
nnoremap <leader>s<bar> :vsplit<cr>
nnoremap <leader>s- :split<cr>
nnoremap <leader>s? :map <leader>s<cr>

"""" Navigate through split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"""" Better redo
nnoremap U <C-R>

"""" Remove annoyance
nnoremap <Del> <nop>
vnoremap <Del> <nop>
nnoremap <Backspace> <nop>
vnoremap <Backspace> <nop>
nnoremap Q <nop>

"""" Yank line without spaces
nnoremap <expr> Y 'my^"'.v:register.v:count1.'yg_`y'

"""" Repeat last substitute with flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

""""" Disadble highlight after search
nnoremap <CR><CR> :noh<cr>

"""" Select most recent paste
nmap gV vgb

"""" Copy to system clipboard
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y

"""" Paste from system clipboard
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>P "+P

"""" Delete, not cut
nnoremap <Leader>d "_d
vnoremap <Leader>d "_d

""""" Delte wih single key
nnoremap X dd

"""" Paste in visual mode multiple times
xnoremap p pgvy

"""" Close buffer and window
nnoremap <silent> <Leader>cc :Bd<CR>
nnoremap <silent> <Leader>CC :Bd!<CR>
nnoremap <Leader>cw :close<CR>

"""" Write with sudo
cnoremap w!! w !sudo tee > /dev/null %

"""" Edit .vimrc
nnoremap <silent> <Leader>ec :e $MYVIMRC<CR>
nnoremap <silent> <Leader>sc :so $MYVIMRC<CR>

"""" Navigate through visual lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

"""" Scroll by half of the screen
nmap <PageDown> <C-d>
nmap <PageUp> <C-u>
nmap <C-e> <C-u>

"""" Jump to previous / next cursor position
nnoremap <A-Left> <C-o>
nnoremap <A-Right> <C-i>

"""" Buffer navigation
nnoremap <silent> <C-PageUp> :bp<CR>
nnoremap <silent> <C-PageDown> :bn<CR>
nnoremap <tab> :b#<cr>

"""" Change tab size
nnoremap <silent><Leader>cst :setlocal ts=4 sts=4 noet <bar> retab! <bar> setlocal ts=2 sts=2 et <bar> retab<CR>

""" Plugins configuration
"""" Lightline
let g:lightline = {
      \   'active': {
      \     'left': [ [ 'mode' ], [ 'pwd' ] ],
      \     'right': [ [ 'linter_ok', 'linter_checking', 'linter_errors', 'linter_warnings', 'trailing', 'lineinfo' ], [ 'fileinfo' ], [ 'scrollbar' ] ],
      \   },
      \   'inactive': {
      \     'left': [ [ 'pwd' ] ],
      \     'right': [ [ 'lineinfo' ], [ 'fileinfo' ], [ 'scrollbar' ] ],
      \   },
      \   'tabline': {
      \     'left': [ [ 'buffers' ] ],
      \   },
      \   'separator': { 'left': '', 'right': '' },
      \   'subseparator': { 'left': '', 'right': '' },
      \   'mode_map': {
      \     'n' : 'N',
      \     'i' : 'I',
      \     'R' : 'R',
      \     'v' : 'V',
      \     'V' : 'V-LINE',
      \     "\<C-v>": 'V-BLOCK',
      \ 'colorscheme': 'base16-tomorrow-night',
      \     'c' : 'C',
      \     's' : 'S',
      \     'S' : 'S-LINE',
      \     "\<C-s>": 'S-BLOCK',
      \   },
      \   'component': {
      \     'lineinfo': '%l:%-v',
      \   },
      \   'component_expand': {
      \     'buffers': 'lightline#bufferline#buffers',
      \     'trailing': 'lightline#trailing_whitespace#component',
      \     'linter_ok': 'lightline#ale#ok',
      \     'linter_checking': 'lightline#ale#checking',
      \     'linter_warnings': 'lightline#ale#warnings',
      \     'linter_errors': 'lightline#ale#errors',
      \   },
      \   'component_function': {
      \     'pwd': 'LightlineWorkingDirectory',
      \     'scrollbar': 'LightlineScrollbar',
      \     'fileinfo': 'LightlineFileinfo',
      \   },
      \   'component_type': {
      \     'buffers': 'tabsel',
      \     'trailing': 'error',
      \     'linter_ok': 'left',
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \   },
      \ }

""""" Custom components
function! LightlineScrollbar()
  let top_line = str2nr(line('w0'))
  let bottom_line = str2nr(line('w$'))
  let lines_count = str2nr(line('$'))

  if bottom_line - top_line + 1 >= lines_count
    return ''
  endif

  let window_width = winwidth(0)
  if window_width < 90
    let scrollbar_width = 6
  elseif window_width < 120
    let scrollbar_width = 9
  else
    let scrollbar_width = 12
  endif

  return noscrollbar#statusline(scrollbar_width, '-', '#')
endfunction

function! LightlineFileinfo()
  if winwidth(0) < 90
    return ''
  endif

  let encoding = &fenc !=# "" ? &fenc : &enc
  let format = &ff
  let type = &ft !=# "" ? &ft : "no ft"
  return type . ' | ' . format . ' | ' . encoding
endfunction

function! LightlineWorkingDirectory()
  return &ft =~ 'help\|qf' ? '' : fnamemodify(getcwd(), ":~:.")
endfunction

"""" lightline-bufferline
  let g:lightline#bufferline#filename_modifier = ':~:.' " Show filename relative to current directory
  let g:lightline#bufferline#unicode_symbols = 1        " Use fancy unicode symbols for various indicators
  let g:lightline#bufferline#modified = ''             " Default pencil is too ugly
  let g:lightline#bufferline#unnamed = '[No Name]'      " Default name when no buffer is opened
  let g:lightline#bufferline#shorten_path = 0           " Don't compress ~/my/folder/name to ~/m/f/n

"""" Lightline trailing whitespace
let g:lightline#trailing_whitespace#indicator = '•'

"""" DelimitMate
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
let delimitMate_nesting_quotes = ['"', '`']
let delimitMate_excluded_regions = ""
let delimitMate_balance_matchpairs = 1

"""" Deoplete
let g:deoplete#enable_at_startup = 1

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-TAB> pumvisible() ? "\<c-p>" : "\<s-TAB>"

call deoplete#custom#source('_', 'min_pattern_length', 1)
call deoplete#custom#source('around', 'rank', 100)
call deoplete#custom#source('ultisnips', 'rank', 200)

"""" Deoplete-jedi (Python completion)
let deoplete#sources#jedi#show_docstring = 1

"""" Deoplete-ternjs (JS completion)
let g:tern_request_timeout = 1
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

"""" EasyAlign
nmap <Leader>= <Plug>(EasyAlign)
xmap <Leader>= <Plug>(EasyAlign)

"""" NERDRTree
nnoremap <silent> <F2> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.git[[dir]]', 'env$[[dir]]', '__pycache__[[dir]]', 'node_modules[[dir]]']
let NERDTreeRespectWildIgnore=1

"""" FZF
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>F :Files ~<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

"""" GitGutter
let g:gitgutter_map_keys = 0

nmap ]c <Plug>GitGutterNextHunk<Plug>GitGutterPreviewHunk<Bar>zv
nmap [c <Plug>GitGutterPrevHunk<Plug>GitGutterPreviewHunk<Bar>zv
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterUndoHunk
nmap <Leader>gp <Plug>GitGutterPreviewHunk

"""" Goyo
nnoremap <silent> <Leader>g :Goyo<CR>

"""" Markdown composer
let g:markdown_composer_open_browser = 1

"""" VIM Table Mode
let g:table_mode_corner='|'

"""" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

augroup fix-ultisnips-overriding-tab-visual-mode
  autocmd!
  autocmd VimEnter * xnoremap <Tab> >gv
augroup END

"""" vim-rooter
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1

"""" vim-smooth-scroll
let g:ms_per_line=2


""" Functions
""""" Disable listchars for python
augroup python
  autocmd BufRead *.python set nolist
augroup END

"""" Removes trailing whitespace
function! RemoveTrailingSpaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

nnoremap <silent> <F10> :call RemoveTrailingSpaces()<CR>

"""" Toggle automatic code formatting
function! ToggleAutoFormatCode()
  if !exists('#AutoFormatCode#BufWritePre')
    augroup AutoFormatCode
      autocmd!
      autocmd BufWritePre * silent! Neoformat
    augroup END
  else
    augroup AutoFormatCode
      autocmd!
    augroup END
  endif
endfunction
command! ToggleAutoFormatCode :call ToggleAutoFormatCode()
call ToggleAutoFormatCode() " Enable by default

"""" Repeat macro over visual selection
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

"""" Set terminal title
function! SetTerminalTitle()
  let bufnr = bufnr('%')
  if buflisted(bufnr)
    if bufname(bufnr) == ''
      let &titlestring = 'unnamed'
    else
      let &titlestring = expand('%:~')
    endif
  endif
endfunction

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

augroup reload-files-changed-outside
  autocmd!
  autocmd BufEnter,FocusGained * checktime
augroup END

augroup title
  autocmd!
  autocmd BufEnter * call SetTerminalTitle()
augroup END

"""" Jump to last cursor position when re-opening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"" vim:foldmethod=expr:foldlevel=0
"" vim:foldexpr=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='IP
