" Plug-ins
"
colorscheme desert

" Spaces & tabs
set tabstop=4	        " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces

" Ui config
set number              " show line numbers
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set shiftwidth=4        " automatic indent space
set laststatus=2        " for lightline

" set modeline=1
filetype indent on      " load filetype-specific indent files

" Leader Shortcut
let mapleader=','       " leader is comma
inoremap jj <esc>

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable          " enablefolding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" Key Bindings
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" move windows
nnoremap <space> <c-w>

" highlight last inserted text
nnoremap gV `[v`]

" Functions
function Compile()
	if &filetype ==# 'cpp'
		exec "!g++ % -o %< -g -Wall -Wextra -Wconversion -std=c++11"
	elseif &filetype ==# 'c'
		exec "!gcc % -o %< -g -Wall -Wextra -Wconversion"
	endif
endfunction

function Debug()
	if &filetype ==# 'cpp' 
		exec "!lldb ./%<"
    elseif &filetype ==# 'c'
        exec '!gdb ./%<'
	endif
endfunction

function Run()
	if &filetype ==# 'cpp'
		exec "!time ./%<"
    elseif &filetype ==# 'c'
		exec "!time ./%<"
	elseif &filetype ==# 'sh'
		exec "!bash %"
	endif
endfunction

map <F9> : call Compile() <CR>
map <F5> : call Debug() <CR>
map <F6> : call Run() <CR>
map <F2> : ! python3 % <CR>
