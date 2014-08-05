""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" begin Vundle plugin manager setup """""""""""""""""""""""
"""""""""""""" see https://github.com/gmarik/Vundle.vim for info """""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible										" use Vim defaults instead of vi compatibility
filetype off												" required by Vundle plugin manager
set rtp+=~/.vim/bundle/Vundle.vim		" set the runtime path to include Vundle
call vundle#begin()									" initialize Vundle
	
	Plugin 'https://github.com/gmarik/Vundle.vim.git'
	Plugin 'https://github.com/vim-scripts/L9.git'	
	Plugin 'https://github.com/vim-scripts/AutoComplPop.git'
	Plugin 'https://github.com/ervandew/supertab.git'
	
call vundle#end()										" deinitialize Vundle
filetype plugin indent on						" required by Vundle plugin manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""" end Vundle plugin manager setup """"""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set modelines=0
set mouse=a															" turn on mouse
set backspace=2													" more powerful backspacing
set tabstop=2														" set tab length to 2 spaces
set shiftwidth=2

set ai																	" auto indenting
syntax on																" syntax highlighting
set hlsearch														" highlight the last searched term
"set background=light										" use light background color profile
":colorscheme slate
":highlight Comment ctermfg=lightblue		"set the color of comments

set nu																	" set line numbers to on
set ruler																" show the cursor position
set switchbuf=useopen,usetab,newtab
set colorcolumn=80		" add a guideline at 80 characters wide


" the following code block enables repeated pasting from visual
" selection without overwriting default register.
" This makes it possible to paste copied text repeatedly by just
" tapping the 'p' key after yanking from visual mode
	function! RestoreRegister()
		let @" = s:restore_reg
		return ''
	endfunction
	
	function! s:Repl()
		let s:restore_reg = @"
		return "p@=RestoreRegister()\<cr>"
	endfunction
	
	vnoremap <silent> <expr> p <sid>Repl()


"the following block causes vim to always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\endif |
\endif


let &titlestring = "vim     " . expand("%:t") . "\t\t"
if &term == "screen"
	set t_ts=^[k
	set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
	set title
endif

set completeopt=longest,menuone

let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc','&completefunc']
let g:SuperTabRetainCompletionType=2

inoremap <expr><Enter>  pumvisible() ? "\<C-Y>" : "\<Enter>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
