scriptencoding utf-8
set fileencoding=utf-8

set nocompatible
syntax on
"set tabstop=8
set tabstop=8
"set softtabstop=2
"set shiftwidth=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

filetype plugin on
filetype indent on

set t_Co=256
"colorscheme busybee

set number
set showcmd
set mouse=a
set cursorline
"set relativenumber

set list
set listchars=tab:>\ 

highlight ExtraWhitespaces  ctermbg=RED guibg=#A00000
highlight ExtraCaractere    ctermbg=124 guibg=#A00000

function Handle_Spaces()
  match ExtraWhitespaces /\s\+$/
  "2match ExtraCaractere  /\%81v.\+/
endfunction

au BufNewFile {*.{c,cpp}} call Epi_CHeader_Insert()
au BufNewFile {*.{h,hh,hpp}} call Epi_CHHeader_Insert()
au BufNewFile {Makefile} call Epi_Makefile_Insert()
au BufWritePre {*.{c,h,hh,cpp,hpp},Makefile} call UpdateHeaderDate()
au BufWinEnter,BufNew {*.{c,h,hh,cpp,hpp},Makefile} call Handle_Spaces()

map <F3> <esc>ggvG=
map <F5> <esc>:w
inoremap <F5> <esc>:w<CR>i
nnoremap <silent> <F12> :TlistToggle<CR>
inoremap <silent> <F12> <ESC>:TlistToggle<CR>i

inoremap ''; '';<esc>hi
inoremap '' ''<esc>i
inoremap ""; "";<esc>hi
inoremap "" ""<esc>i
inoremap (( ()<esc>i
inoremap ((; ();<esc>hi
inoremap [[ []<esc>i
inoremap [[; []<esc>hi
inoremap {{ {<cr>}<esc>ki<right><cr>
inoremap {{; {<cr>};<esc>ki<right><cr>

map - <C-W>-
map + <C-W>+
map < <C-W><
map > <C-W>>

nmap <C-S-tab> :tabprevious<cr>
nmap <C-tab> :tabnext<cr>
imap <C-S-tab> <ESC>:tabprevious<cr>i
imap <C-tab> <ESC>:tabnext<cr>i

map <F4> :%s/^[0-9]*//g<cr>:%s/.$//g<cr>:%s/’’/"/g<cr>:%s/‘‘/"/g<cr>
map <F3> ggvG=

let treeExplVertical=1
let treeExplWinSize=30
let treeExplDirSort=1
let treeExplNoList=1

let Tlist_Sort_Type='name'

set completeopt=menu
let OmniCpp_SelectFirstItem=2

imap <F2> <ESC>:sh<cr> 
map <F2> <ESC>:sh<cr> 

set nobackup
set nowritebackup

map <F11> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

set tags+=~/.vim/tags/cpp/tags

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" gestion plus intelligente du popup
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

autocmd FileType python set omnifunc=pythoncomplete#Complete
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.h set omnifunc=omni#cpp#complete#Main

inoremap <F8> <esc>^i/*<esc>$a*/ 

let g:clang_use_library=1
let g:clang_library_path="/usr/lib"

let g:voogle_browser="firefox"


if filereadable(".vim.custom")
  so .vim.custom
endif
