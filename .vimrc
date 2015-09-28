call plug#begin('~/.vim/plugged')

Plug 'indiofish/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic', { 'for': ['c', 'cpp', 'java', 'scheme'], 'on': []}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'Shougo/neocomplete.vim'
Plug 'bling/vim-airline'
Plug 'garbas/vim-snipmate',{ 'on': []} | Plug 'indiofish/vim-snippets'
Plug 'tpope/vim-surround', {'for': 'html'}
Plug 'junegunn/rainbow_parentheses.vim', { 'for': 'scheme' }
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

"syntax files
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
"Plug 'kchmck/vim-coffee-script'
"Plug 'groenewege/vim-less'
"Plug 'derekwyatt/vim-scala'
"Plug 'tpope/vim-haml'
"Plug 'pangloss/vim-javascript'
"Plug 'othree/html5.vim'
"Plug 'nono/vim-handlebars'
"Plug 'mklabs/grunt.vim'
"Plug 'tikhomirov/vim-glsl'
"Plug 'digitaltoad/vim-jade'

"dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
call plug#end() 

"filetype indent on
"filetype plugin on
"syntax on

"BASIC SETTINGS

set noswapfile
set nocompatible
set title
set ignorecase
set smartcase
set autoread
set incsearch
set ruler
set number
set esckeys
set hlsearch
set showmode
set nomodeline
set expandtab
set mousehide
set hidden

set splitbelow "and below
set splitright "when opening splits, they go right
set nrformats=alpha
set autochdir
set wrap
set autoindent
set smartindent
set clipboard=unnamed	" yank to the system register (*) by default
set tabstop=2
set scrolloff=3
set shiftwidth=2
set softtabstop=2
set encoding=UTF-8
set fileencodings=UTF-8
set backspace=eol,start,indent
set showcmd
set rnu
set autowrite
set laststatus=2 "enabled to show statusline(airline)
set pumheight=10 "height of ins-completion-menu

"autocompletion will not select the longest item, but just insert it in
"completion popup
set completeopt=menuone
set completeopt-=preview
set wildmenu            " wild char completion menu
set wildignore=*.o,*~,*.pyc,*.class,*.zip,*.out

"VISUAL SETTINGS

"for vim not gvim; force terminal color 256
set t_Co=256 
augroup load_colors
  au!
  au ColorScheme * set background=dark
  au ColorScheme * hi CursorLineNr ctermfg=117 cterm=bold 
  au ColorScheme * hi LineNr ctermfg=250 ctermbg=none
  au ColorScheme * hi Pmenu ctermfg=250 ctermbg=8
  au ColorScheme * hi PmenuSel ctermfg=11 ctermbg=25
  au ColorScheme * hi Normal ctermbg = NONE
augroup END
color molokai
"KEYMAPS

"<leader> settings
"map space to a leader key.
map <Space> <leader>
"easier saving & quitting
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
"ciw to delete in the word (doesn't include spaces) and go to insert mode
map <leader>dw ciw
"delete brackets
map <leader>db ci(
"delete quotes
map <leader>dq ci"
"Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
noremap <Leader>l :ls<CR>:buffer<Space>

"copy the whole file to clipboard
nnoremap <leader>cp :%y+<cr>:echo "Copied to clipboard"<cr>
"tab to leave insert mode and save my pinky
imap jj <esc>
"imap <tab> <esc>
"stop q: from calling the stupid window
map q: :q
"search word and focus it at center
map N Nzz
map n nzz
map * *zz
"H to home, L to end
map H ^
map L $
"make Y act like D or C; from the cursor to the EOL
map Y y$
"indenting maintain visual area 
vnoremap > >gv
vnoremap < <gv

"in autocomplete, C-n would always highlight some choice
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"move through splits easily
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"keymap regarding tabs
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabprev<CR>
nnoremap tk  :tabnext<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap [l  :lprev<CR>
nnoremap ]l  :lnext<CR>

"press enter to disable highlight
nnoremap <CR> :noh<CR><CR>:<backspace>
"let's use c-j

"search visually selected area
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
"sudo write a file :W
command! W w !sudo tee % > /dev/null
"abbreviate
cabbrev E Explore

let &titleold = getcwd()
let loaded_matchparen = 1

"PLUGIN CONFIGURATION

"NERDComment configuration
let NERDCreateDefaultMappings=0
"this lets you keep visual selection
nmap <leader>cc <plug>NERDCommenterToggle
nmap <leader>cu <plug>NERDCommenterUncomment
vmap <leader>cc <plug>NERDCommenterTogglegv
vmap <leader>cu <plug>NERDCommenterUncommentgv

"syntastic configuration
"if racket file hangs while checking, ^C to escape.
augroup load_plugins
  au!
  au InsertEnter * call plug#load('vim-snipmate','syntastic')
augroup END
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_filetype_map = {"scheme" : "racket"}
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_verilog_compiler = 'iverilog'
let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 3

"NERDTree configuration
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=20

"airline configuration
let g:airline#extensions#disable_rtp_load = 1
let g:airline_powerline_fonts=1
let g:airline_section_b = '%.20{pathshorten(MyDir())}'
let g:airline_section_c = '%t'
let g:airline_section_y =''
let g:airline_section_z ='Ln:%04l/%04L'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = "monochrome"
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#default#section_truncate_width = {
      \ 'x': 70,
      \ 'z': 45,
      \ }
"add this so that in airline plugin, leaving insert mode is done smoothly
set ttimeoutlen=40

"neocomplete configuration
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#max_list = 10
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#auto_completion_start_length = 3
"fixes a bug that happens where autopairs overwrite neocomplete's smart close
"option
let g:AutoPairsMapBS = 0
inoremap <expr><BS> pumvisible()? neocomplete#smart_close_popup()."\<C-h>" : AutoPairsDelete()

autocmd! User GoyoLeave nested call <SID>goyo_leave()

"Tagbar configuration
nmap <leader>t :TagbarToggle<cr>
let g:tagbar_width =20
let g:tagbar_show_visibility = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1

"Limelight configuration
let g:limelight_conceal_ctermfg = 59
let g:limelight_priority = -1

"AUTOCMDS

augroup gen_view
  au!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent loadview
augroup END

if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost * 
        \ if line("'\"") > 0 && line("'\"") <= line("$") | 
        \   exe "normal g`\"" |
        \ endif 

  autocmd BufEnter * let &titlestring = expand("%:t") . " :: vim"
endif

"change number mode

augroup compileInside
  au!
  " run python
  au Bufenter *.py map <F5> :!python %<CR>

  "run c
  au Bufenter *.c map <F5> :!gcc % -lm && ./a.out<CR>
  au Bufenter *.c map <F6> :!gcc % -g && gdb ./a.out<CR>
  au Bufenter *.c map <F7> :!gcc % -g && valgrind ./a.out<CR>

  " run cpp
  au Bufenter *.cpp map <F5> :!g++ % && ./a.out<CR>
  au Bufenter *.cpp map <F6> :!g++ % -g && gdb ./a.out<CR>
  au Bufenter *.cpp map <F7> :!g++ % -g && valgrind ./a.out<CR>

  " run ruby
  au Bufenter *.rb map <F5> :!ruby %<CR>

  " run java
  au Bufenter *.java map <F4> :!javac % <CR><CR>
  au Bufenter *.java map <F5> :!javac % && java %:r<CR>

  " run racket
  au Bufenter *.rkt map <F5> :!racket %<CR>
  au Bufenter *.rkt RainbowParentheses

  " run verilog
  au Bufenter *.v map <F5> :!iverilog % && ./a.out<CR>
augroup END

"FUNCTIONS

"function for displaying current directory the way i like it
function! MyDir()
  " empty flag lets you swap only once
  " parse home directory and the usr name and substitute to ~/
  let cwd = substitute(getcwd(),'/home/\h\w*',"~","")
  return cwd . "/"
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("Ack \"" . l:pattern . "\" " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

function! s:goyo_leave()
  ''
endfunction
