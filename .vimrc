" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark
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
"Tab configuration
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
"set cinoptions=:0,g0,t0,(0
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
"set mouse=a
"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
"autocmd BufEnter * :syntax sync fromstart
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"*******************************************
" Part Two: Configurations about plugins
"*******************************************
" Required Plugins:
" C-support: Also known as c.vim, a powerful tool to write C/C++" code.
" NERDTree: A tool to explore local and network files and directories.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taglist
nmap <silent><F3>       :Tlist<CR>:wincmd j<cr>
"imap <silent><F3>       :Tlist<CR>:wincmd j<cr>
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let Tlist_WinWidth = 27
let Tlist_Exit_OnlyWindow = 1
let winManagerWindowLayout = 'FileExplore|TagList'
"let winwidth don't resize
let Tlist_Inc_Winwidth = 0
"let Tlist_Display_Prototype = 1
"Trinity
"
" Open and close all the three plugins on the same time 
" nmap <F6>  :TrinityToggleAll<CR> 
"
" " Open and close the Source Explorer separately 
 nmap <F8>  :TrinityToggleSourceExplorer<CR> 
"
" " Open and close the Taglist separately 
 nmap <F7> :TrinityToggleTagList<CR> 
"
" " Open and close the NERD Tree separately 
 nmap <F9> :TrinityToggleNERDTree<CR> 

"SuperTab.vim
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
" C-Support
"Mapleader was setted as ',' in previous setting.
" NERDTree 
map <F2> :NERDTreeToggle<CR>
let NERDTreeDirArrows = 1
let NERDTreeMousneMode = 2	"single click => open
let s:Dir_F = 0
func! NERDTree_OC()
	exe "normal mz"
	if s:Dir_F
		let s:Dir_F = 0
		exe "1"
		exe "normal mz"
		exe "NERDTreeClose"
		"exe ":wincmd j"
	else
		let s:Dir_F = 1
		exe "normal mz"
		exe "NERDTree"
	endif
endfunc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"*******************************************
" Part Three: Configurations about filetypes.
"*******************************************
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C/C++
autocmd FileType c,cpp map <buffer> <leader><space> :make<cr>
autocmd FileType c,cpp setlocal cindent
"\ textwidth=82
"\ shiftwidth=8
"\ tabstop=8
"\ softtabstop=8
" Highlight space errors in C/C++ source files (Vim tip #935)
if $VIM_HATE_SPACE_ERRORS != '0'
let c_space_errors=1
endif
""""""""""""""""""""""""""""""
" HTML
"""""""""""""""""""""""""""""""
au FileType html set ft=xml
au FileType html set syntax=html
" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" loading  templates
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
:autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c
:autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
:autocmd BufNewFile *.php 0r ~/.vim/templates/skeleton.php
:autocmd BufNewFile Makefile 0r ~/.vim/templates/Makefile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"remember the location of *.c
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:au BufWinLeave *.c silent mkview
:au BufWinEnter *.c silent loadview	
autocmd BufWinLeave * if expand("%") != "" | mkview | endif
autocmd BufWinEnter * if expand("%") != "" | loadview | endif
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
"*******************************************
" Part For: Key Mappings.
"*******************************************
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybind of F2 - F12
nmap <F2> :call NERDTree_OC()<cr>
" <F3> Was bind by Taglist
"map <F4> :call Number_OS()<cr> "...> function ShowNumberLine()
nmap <F5>   :!bash<cr>
" <F9> Was bind by C.vim to show errors when compile C code.
map <C-LEFT> <Esc> :bp<CR>
map <C-RIGHT> <Esc> :bn<CR>
"-------------------------
"Case Sensitive or insensitive
map <silent> <leader>ic :set ic<cr>
map <silent> <leader>nic :set noic<cr>
"Fast saving
nmap <silent> <leader>ww :w<cr>
imap <silent> ,ww <Esc>:w<cr>
nmap <silent> <leader>wf :w!<cr>
nmap <silent> <leader>wa :wa<cr>
"Fast quiting
nmap <silent> <leader>xx :x<cr>
nmap <silent> <leader>qq :x<cr>
nmap <silent> <leader>qa :xa<cr>
imap <silent> ,xx <Esc>:x<cr>
imap <silent> ,qq <Esc>:x<cr>
nmap <silent> <leader>xa :xa<cr>
nmap <silent> <leader>xa :call Myquit()<cr>
vmap <silent> <leader>xa :call Myquit()<cr>
imap <silent> <leader>xa <Esc>:call Myquit()<cr>
" Windows configuration
nmap <silent> <leader>w2 :split<cr>
nmap <silent> <leader>w3 :vs<cr>
nmap <silent> <leader>clo :close<cr>
nmap <silent> <leader>ol :only<cr>
"Buffer -- goto Next and Previous
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>
map <C-l> zz
" About Blank lines: delete or merge.
nmap <leader>db :g/^$/,/./j<cr>:w<cr>
nmap <leader>rb :call ReduceBlankLines()<cr>:w<cr>
" Sort the
nmap <leader>st :%sort<cr>
vmap <leader>st :sort<cr>
nmap <leader>mk : call Maketags()<cr>
" Enable of Disable Spell Check
nmap <leader>sp :set spell<cr>
nmap <leader>nsp :set nospell<cr>
" Delete Repeated Lines and sort.
nmap <leader>dr :%sort u
vmap <leader>dr :sort u
" Shotkey to change tab configuration
nmap <leader>t8 :set shiftwidth=8 softtabstop=8 tabstop=8<cr>
nmap <leader>t4 :set shiftwidth=4 softtabstop=4 tabstop=4<cr>
nmap <leader>et :set expandtab<cr>
nmap <leader>nt :set noexpandtab<cr>
" Keybind for Subversion.
nmap <leader>ad :! svn add %<cr>
imap <leader>ad <Esc>:! svn add %<cr>
nmap <leader>up :! svn up<cr>
nmap <leader>ci :! svn ci .<cr>
nmap <leader>vd :call Base_diff()<cr>
nmap <leader>vf :call SVN_diff()<cr>
" Keybind for Vimdiff
nmap <leader>dg :diffget<cr>
nmap <leader>dp :diffput<cr>
vmap <leader>dg :diffget<cr>
vmap <leader>dp :diffput<cr>
" Fast diff
nmap <leader>df :diffsplit<cr>
set diffopt+=vertical
" Shortkey to change Fileformats
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>
" Delete the superflous white sapces
"nmap <silent> <leader>ws :call DeleteTrailingWS()<cr>:w<cr>
"imap <silent> <leader>ws <Esc>:call DeleteTrailingWS()<cr>:w<cr>
"Fast reloading and editing of .vimrc
map <silent> <leader>sr :source ~/.vimrc<cr>
map <silent> <leader>ee :e ~/.vimrc<cr>
" Fast grep
nmap <silent> <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
vmap <silent> <leader>lv :lv /<c-r>=<sid>GetVisualSelection()<cr>/ %<cr>:lw<cr>
"map for ESC
inoremap jj <ESC>

" for js
autocmd FileType javascript noremap <buffer> <leader>F :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <leader>F :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <leader>F :call CSSBeautify()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"*******************************************
" Part Five: Functions called by obove key maps.
"*******************************************
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Merge Blank lines into one.
func! ReduceBlankLines()
exe "normal mz"
%s/\s\+$//ge
g/^$/,/./-j
nohl
exe "normal `z"
endfunc
" Fast grep
function! s:GetVisualSelection()
let save_a = @a
silent normal! gv"ay
let v = @a
let @a = save_a
let var = escape(v, '\\/.$*')
return var
endfunction
" Delete supefoulus white spaces.
func! DeleteTrailingWS()
exe "normal mz"
%s/\s\+$//ge
nohl
exe "normal `z"
endfunc
" Function to quit program in all modes.
func! Myquit()
exe "normal mz"
xa
endfunc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"*******************************************
" Part Six: Frequently used Abbrevs
"*******************************************
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"iabbr as  full

"execute pathogen#infect()
if expand('%:t') =~? 'rfc\d\+'
          setfiletype RFC
      endif 
inoremap <C-t> wangyahui, <C-R>=strftime("%F")<CR>
"insert time

"*******************************************
" my favoriate color-scheme
"*******************************************
:colorscheme elflord " when xfce-terminal -> ct -de


"*******************************************
"           Vundle require
"*******************************************
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)
" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Bundle 'L9'
Bundle 'FuzzyFinder'
" scripts not on GitHub
Bundle 'git://git.wincent.com/command-t.git'
"Project-wide code search and view 
"Bundle 'git@github.com:dyng/ctrlsf.vim.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Bundle '/plugin'
" ...
Bundle 'OmniCppComplete'
Bundle 'mediawiki'
Bundle 'accelerated-smooth-scroll'
"Bundle 'NERDTree'
"instant preview markdown
Bundle 'git@github.com:suan/vim-instant-markdown.git'
Bundle 'drawit'
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'ruby.vim'
Bundle 'git@github.com:mattn/emmet-vim'
Bundle 'git@github.com:maksimr/vim-jsbeautify'
Bundle 'vim-ruby/vim-ruby'
Bundle 'easytags'
Bundle 'DrawIt' 
"auto detect encoding
Bundle 'fencview'


filetype plugin indent on     " required
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line


let g:instant_markdown_autostart = 0
