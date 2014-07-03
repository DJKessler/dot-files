set modelines=0
set mouse=a
set nocompatible "use Vim defaults instead of 100% vi compatiblitiy
set backspace=2  "more powerful backspacing
set ai		 "auto indenting
set ruler	 "show the cursor position
syntax on 	 "syntax highlighting
set hlsearch	 "highlight the last searched term
set tabstop=2 	 "set tab length to 2 spaces
set nu		 "set line numbers to on
set background=light "use light background color profile
set shiftwidth=2

set isprint=
set tenc=utf8

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

filetype plugin on 
:highlight Comment ctermfg=lightblue "set the color of comments

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

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
