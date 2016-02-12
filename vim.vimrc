""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" begin Vundle plugin manager setup """""""""""""""""""""""
"""""""""""""" see https://github.com/gmarik/Vundle.vim for info """""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                    " Vim defaults instead of vi compatibility
filetype off                        " required by Vundle plugin manager
set rtp+=~/.vim/bundle/Vundle.vim   " set the runtime path to include Vundle
call vundle#begin()                 " initialize Vundle

  Plugin 'https://github.com/gmarik/Vundle.vim.git'
  Plugin 'https://github.com/scrooloose/nerdtree.git'
  Plugin 'https://github.com/tpope/vim-fugitive.git'
  Plugin 'https://github.com/dhruvasagar/vim-railscasts-theme.git'
  Plugin 'https://github.com/bling/vim-airline.git'
  Plugin 'https://github.com/bkad/CamelCaseMotion.git'
  Plugin 'https://github.com/Valloric/YouCompleteMe.git'
  Plugin 'https://github.com/rhysd/vim-clang-format.git'
  Plugin 'https://github.com/octol/vim-cpp-enhanced-highlight.git'

call vundle#end()                   " deinitialize Vundle
filetype plugin indent on           " required by Vundle plugin manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""" end Vundle plugin manager setup """"""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=1000                        " number of past commands to keep
set modelines=0
set backspace=2                         " more powerful backspacing
"set cursorline                          " highlight current line
"set list                                " show white space characters
set number                              " set line numbers to on
set ruler                               " show the cursor position
set incsearch                           " search as characters are entered
set showmatch                           " highlight matching [{()}]

set expandtab                           " tabs are spaces
set tabstop=2                           " set tab length to 2 spaces
set shiftwidth=2                        " set number of columns inserted for indentation
match ErrorMsg '\s\+$'                  " shows trailing whitespace as error
map <F2> :retab <CR> :wq! <CR>

"set ai                                  " auto indenting
syntax on                               " syntax highlighting
set hlsearch                            " highlight the last searched term
set wildmode=longest,list,full          " set the tab-completion to bash-like
set wildmenu

set switchbuf=useopen,usetab,newtab

set colorcolumn=81                      " add a guideline at 80 characters wide

set background=dark                     " set the background color profile
hi ColorColumn guifg=#5fff00 guibg=#606060 gui=bold ctermfg=82 ctermbg=241 cterm=bold

colorscheme railscasts

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""" begin code block """"""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" the following code block enables repeated pasting from visual selection
" without overwriting default register. This makes it possible to paste copied
" text repeatedly by just tapping the 'p' key after yanking from visual mode
  function! RestoreRegister()
    let @" = s:restore_reg
    return ''
  endfunction

  function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
  endfunction

  vnoremap <silent> <expr> p <sid>Repl()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""" end code block """""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" command completiong variables
set completeopt=longest,menuone
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc','&completefunc']
let g:SuperTabRetainCompletionType=2

" the following commands enable tab completion for auto-complete
inoremap <expr><Enter>  pumvisible() ? "\<C-Y>" : "\<Enter>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" the following commands cause vim to jump to the last cursor position
autocmd BufWinLeave *.* mkview
autocmd VimEnter *.* silent loadview

map <F7> :tabp <CR>
map <F8> :tabn <CR>
map <F1> :diffget <CR> ]c
map <F2> :diffput <CR> ]c

:nnoremap <F12> <k8><k0><Bar> i<CR><Esc>

" map ctrl+c to esc
inoremap <C-c> <Esc>`^


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""" YouCompleteMe """"""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" quit asking me if my .ycm_extra_conf.py is safe to load """
let g:ycm_confirm_extra_conf = 0
""" always populate vim's location list
let g:ycm_always_populate_location_list = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""" clang-format """"""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""" CamelCaseMotion """""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call camelcasemotion#CreateMotionMappings('<leader>')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""" cpp-enhanced-highlight """"""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1

