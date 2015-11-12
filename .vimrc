language messages C
set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'indiofish/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic', {'on': []}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'garbas/vim-snipmate',{ 'on': []} | Plug 'indiofish/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'junegunn/rainbow_parentheses.vim', { 'for': 'scheme' }
  au BufEnter *.rkt RainbowParentheses
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'roman/golden-ratio'
if has("lua")
  Plug 'indiofish/neocomplete.vim'
else
  "Plug 'vim-scripts/AutoComplPop'
  "inoremap <expr><silent><Tab> pumvisible() ? "\<C-Y>"
        "\:"\<C-R>=snipMate#TriggerSnippet()\<CR>"

  inoremap <silent><expr><Tab> pumvisible() ? "\<C-Y>"
        \: snipMate#CanBeTriggered()?
        \"\<C-R>=snipMate#TriggerSnippet()\<CR>"
        \: Smart_TabComplete(3)
endif

"dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
call plug#end() 

"BASIC SETTINGS
filetype detect
set omnifunc=syntaxcomplete#Complete
set encoding=UTF-8
set fileencodings=UTF-8
set noswapfile
set shortmess=a

set title
set ignorecase
set smartcase
set infercase
set autoread
set incsearch
set hlsearch
set showmode
set nomodeline
set expandtab
set mousehide
set hidden "keeps buffer
set viminfo=:20,'20,@0,<0

set splitright "when opening splits, they go right
set splitbelow "and below
set nrformats=hex 
set autochdir
set autoindent
set smartindent
set clipboard=unnamed	"yank to the system register (+) by default
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=3
set backspace=eol,start,indent
set showcmd
set number
set rnu "relative number lines
set laststatus=2 "enabled to show statusline(airline)
set wrap
set ttimeoutlen=40
"set autowrite

set pumheight=5 "height of ins-completion-menu
set foldmethod=manual
set complete=.,b,i
set completeopt+=longest,menuone
set completeopt-=preview

set wildmenu " wild char completion menu
set wildignorecase
set wildmode=longest:full,full
set wildignore=*.o,*~,*.pyc,*.class,*.zip,*.out
let loaded_matchparen = 1
let &titleold = getcwd()

"COLOR CONFIGURATION
set t_Co=256
let g:rehash256 = 1
augroup load_colors
  au!
  au ColorScheme * set background=dark
  "au ColorScheme * hi Normal ctermbg = NONE
  "au ColorScheme * hi Normal ctermfg = 254
  au ColorScheme * hi CursorLineNr ctermfg=117 cterm=bold 
  au ColorScheme * hi LineNr ctermfg=250 ctermbg=none
  "au ColorScheme * hi Pmenu ctermfg=250 ctermbg=8
  "au ColorScheme * hi PmenuSel ctermfg=11 ctermbg=25
augroup END
if (&ft != 'text' && &ft != 'markdown')
  "color molokai
  let g:seoul256_background = 236
  color seoul256
endif

augroup readtxt
  autocmd!
  au FileType {text,markdown} set background=light
  au FileType {text,markdown} hi Normal ctermfg=234 ctermbg=255
  au FileType {text,markdown} :Goyo
augroup END


"STATUSLINE CONFIGURATION
set statusline=*PATH:\ 
set statusline+=\[%.20{pathshorten(MyDir())}%t\] "file path shortened
set statusline+=%(\ [%M%R%H]%)
set statusline+=%=\ Ln:%04l/%04L      "flags and LineNum

"KEYMAPS

"map space to a leader key.
map <Space> <leader>
"easier saving & quitting
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
"Toggle paste mode on and off
map <silent><leader>pp :setlocal paste!<cr>
noremap <Leader>l :ls<CR>:b

"copy the whole file to clipboard
nnoremap <leader>cp :%y+<cr>:echo "Copied to clipboard"<cr>
"tab to leave insert mode and save my pinky
imap jj <esc>
"search word and focus it at center
map N Nzz
map n nzz
map * *zz
"H to home, L to end
map H ^
map L $
"make Y act like D or C; from the cursor to the EOL
map Y y$
"indenting maintains visual area 
vnoremap > >gv
vnoremap < <gv

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
nnoremap <silent><CR> :noh<CR><CR>:<backspace>
"search visually selected area
vnoremap <silent>* :call VisualSelection('f', '')<CR>
vnoremap <silent># :call VisualSelection('b', '')<CR>
"sudo write a file :W
command! W w !sudo tee % > /dev/null

"PLUGIN CONFIGURATION

"NERDComment configuration
let NERDCreateDefaultMappings=0
"this lets you keep visual selection
nmap <leader>cc <plug>NERDCommenterToggle
nmap <leader>cu <plug>NERDCommenterUncomment
vmap <leader>cc <plug>NERDCommenterTogglegv
vmap <leader>cu <plug>NERDCommenterUncommentgv

"AUTOPairs configuration
let g:AutoPairsMultilineClose = 0
let g:AutoPairsFlyMode = 0
au BufEnter *.rkt let b:AutoPairs 
      \ = {"(": ")","{": "}", '"': '"', "[": "]"}

"syntastic configuration
"if racket file hangs while checking, ^C to escape.
let g:syntastic_filetype_map = {"scheme" : "racket"}
let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "active_filetypes": ["c", "scheme", "cpp", "java"],
      \ "passive_filetypes": [] }
let g:syntastic_error_symbol = "X!"
let g:syntastic_warning_symbol = "!!"
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_java_javac_classpath= './'
let g:syntastic_verilog_compiler = 'iverilog'
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 3
highlight SyntasticErrorSign ctermfg=0 ctermbg=168

"NERDTree configuration
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=20

"NEOCOMPLETE configuration
if has("lua")
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_auto_select = 1
  let g:neocomplete#auto_completion_start_length = 3
  "fixes a bug that happens where autopairs overwrite neocomplete's BS
  let g:AutoPairsMapBS = 0
  inoremap <expr><BS> pumvisible()? neocomplete#smart_close_popup()."\<C-h>" 
        \: AutoPairsDelete()
  "Tab to complete a snippet, or autocomplete when popup is up
  "give snipmate priority over auto completion
  inoremap <expr><Tab> snipMate#CanBeTriggered()? 
        \"\<C-R>=snipMate#TriggerSnippet()\<CR>" 
        \: pumvisible() ? "\<CR>" : "<TAB>"

  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'

else
  let g:AutoPairsMapBS = 0
  inoremap <expr><BS> pumvisible()? "\<C-E>\<C-h>" 
        \: AutoPairsDelete()
endif

"GOYO jump to last cursor position upon exit.
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"Tagbar configuration
nmap <leader>t :TagbarToggle<cr>
let g:tagbar_width =20
let g:tagbar_show_visibility = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_map_showproto = "p"

"Limelight configuration
let g:limelight_conceal_ctermfg = 248
let g:limelight_priority = -1

"ACP
let g:acp_behaviorKeywordLength = 3
let g:acp_behaviorKeywordCommand = "\<C-N>"
let g:acp_completeoptPreview = 1
let g:acp_completeOption='.,b,i'

"AUTOCMDS

augroup format
  au!
  au FileType * set formatoptions-=o
augroup END

augroup movecursor
  if has("autocmd")
    " When entering a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    au!
    autocmd BufWinEnter * 
          \ if line("'\"") > 0 && line("'\"") <= line("$") | 
          \   exe "normal g`\"" |
          \ endif 

    autocmd BufEnter * let &titlestring = expand("%:t") . " :: vim"
  endif
augroup END

augroup lazyload_plugins
  au!
  if (&ft != 'text' && &ft != 'markdown')
    au InsertEnter * call plug#load('vim-snipmate')
  endif
  au BufWritePre *.c,*.cpp,*.java,*.rkt call plug#load('syntastic')
augroup END

nmap <space>r :Run<CR>
nmap <f5> :Run<CR>
augroup Run
  au!
  au Bufenter *.python command! Run !python %

  au Bufenter *.c command! Run !gcc % -lm && ./a.out
  au Bufenter *.c map <F6> :!gcc % -g && gdb ./a.out<CR>
  "au Bufenter *.c set makeprg=gcc\ %\ -lm

  au Bufenter *.c command! Run !g++ % && ./a.out
  au Bufenter *.cpp map <F6> :!g++ % -g && gdb ./a.out<CR>

  au Bufenter *.java command! Run !javac % && java %:r
  au Bufenter *.java map <F4> :!javac % <CR><CR>

  au Bufenter *.rkt command! Run !racket %
  "au Bufenter *.rkt set makeprg=racket\ %
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
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

function! Smart_TabComplete(min_len)
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.'))      " from the start of the current
  " line to one character right of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  let len = strlen(substr)
  echo len
  if (len==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash && len>=a:min_len)
    return "\<C-N>\<C-N>"
  elseif ( has_slash )
    return "\<C-X>\<C-F>\<C-N>"                  
  elseif (has_period)
    return "\<C-X>\<C-O>"                         " plugin matching
  else
    return "\<tab>"
  endif
endfunction

function! GotoInsert()
  startinsert
  "call feedkeys("\<C-N>\<C-N>",'i')
endfunction

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd User GoyoEnter call <SID>goyo_enter()
autocmd User GoyoLeave call <SID>goyo_leave()
let Tlist_Compact_Format = 1
let Tlist_Use_Right_Window = 1
