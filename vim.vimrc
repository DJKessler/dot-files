""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" begin Vundle plugin manager setup """""""""""""""""""""""
"""""""""""""" see https://github.com/gmarik/Vundle.vim for info """""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                    " Vim defaults instead of vi compatibility
filetype off                        " required by Vundle plugin manager
set rtp+=~/.vim/bundle/Vundle.vim   " set the runtime path to include Vundle
call vundle#begin()                 " initialize Vundle

  Plugin 'https://github.com/Valloric/YouCompleteMe.git'
  Plugin 'https://github.com/bkad/CamelCaseMotion.git'
  Plugin 'https://github.com/bling/vim-airline.git'
  Plugin 'https://github.com/vim-airline/vim-airline-themes.git'
  Plugin 'https://github.com/chriskempson/base16-vim.git'
  Plugin 'https://github.com/VundleVim/Vundle.vim.git'
  Plugin 'https://github.com/inside/vim-search-pulse.git'
  Plugin 'https://github.com/junegunn/vim-easy-align.git'
  Plugin 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
  Plugin 'https://github.com/rhysd/vim-clang-format.git'
  Plugin 'https://github.com/scrooloose/nerdtree.git'
  Plugin 'https://github.com/tpope/vim-fugitive.git'
  Plugin 'https://github.com/vim-scripts/VisIncr.git'
  Plugin 'https://github.com/vim-scripts/cscope.vim.git'

call vundle#end()                   " deinitialize Vundle
filetype plugin indent on           " required by Vundle plugin manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""" end Vundle plugin manager setup """"""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=1000                        " number of past commands to keep
set modeline
set modelines=5
set backspace=2                         " more powerful backspacing
set number                              " set line numbers to on
set ruler                               " show the cursor position
set nocursorline                        " disable cursorline
set incsearch                           " search as characters are entered
set showmatch                           " highlight matching [{()}]

set expandtab                           " tabs are spaces
set tabstop=2                           " set tab length to 2 spaces
set shiftwidth=2                        " set number of columns inserted for indentation

syntax on                               " syntax highlighting
set hlsearch                            " highlight the last searched term
set wildmenu

set switchbuf=useopen,usetab,newtab

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

""" highlight trailing whitespace as error
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set colorcolumn=81                      " add a guideline at 80 characters wide

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
""" use my global config file
let g:ycm_global_ycm_extra_conf = '~/.dot-files/vim-ycm.ycm_extra_conf.py'


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


nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""" vim-airline """"""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#pathshorten = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline_powerline_fonts = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""" CamelCaseMotion """""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call camelcasemotion#CreateMotionMappings('<leader>')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""" cpp-enhanced-highlight """"""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""" vim-cursor-line """""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_search_pulse_mode = 'cursor_line'

""" Override default header guard given by vim-headerguard
if filereadable(expand("$HOME/.vim/header-guard.vim"))
  source $HOME/.vim/header-guard.vim
endif

""" Do JPL ITAR header insertion
if filereadable(expand("$HOME/.vim/headers.vim"))
  source $HOME/.vim/headers.vim
endif

set exrc
set secure
