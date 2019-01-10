runtime! debian.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"*******************************************
" Part One: General A list of 'set' command.
"*******************************************
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set mapleader
let mapleader = ","
let g:mapleader = ","
let g:C_MapLeader = ','
"Get out of VI's compatible mode..
set nocompatible
"Sets how many lines of history VIM har to remember
set history=1000
"Auto read a file when it has been changed by other program
set autoread
"Enable omnicompelte
set nocp
set completeopt=longest,menu
"Enable filetype plugin
filetype plugin on
filetype indent on
syntax on
"Favorite filetypes
set ffs=unix,dos
"Turn on WiLd menu
set wildmenu
"Always show current position
set ruler
"The commandbar is 1 high
set cmdheight=1
"set backspace=eol,start,indent		 	"Set backspace
"set whichwrap+=<,>,h,l	    			"Bbackspace and cursor keys wrap to
set incsearch
set hlsearch		        			"Highlight search things
set magic           					"Set magic on
set showmatch	        				"show matching bracets
"Tab configuration for python
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

""trailing spaces language types, the default is 'python'
let g:auto_striptab = "python,ruby,cpp"

"Restore cursor to file position in previous editing session
set viminfo='20,\"50,:20,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Text options
set smarttab
"set tw=86
"Auto indent
set autoindent
set smartindent
"Wrap lines
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set language
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  using syntax to show	files.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile rfc*.* set syntax=rfc
au BufRead,BufNewFile RFC*.* set syntax=rfc
au BufRead,BufNewFile draft* set syntax=plain
au BufRead,BufNewFile DRAFT* set syntax=plain
au BufRead,BufNewFile readme set syntax=plain
au BufRead,BufNewFile README set syntax=plain
au BufRead,BufNewFile *.srt set syntax=sts
au BufRead,BufNewFile *.SRT set syntax=sts
au BufReadPost,BufNewFile *.md set syntax=markdown


" All of your Plugins must be added before the following line
filetype plugin indent on    " required
"
"""Python Django
autocmd FileType python set sw=4 et 
autocmd FileType python set ts=4 et
autocmd FileType python set sts=4 et
