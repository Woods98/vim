" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" #Yuchi settings#
" set the maximum number of charactors per line
set tw=100
"
set scrolloff=4
" find the next matched string
noremap - n
" find the previous matched string
noremap = N
" run this file
noremap <C-r> :source /etc/vim/vimrc<CR>
" #Colemak Settings#

" 1.1. The Most Basics

" switch to insert mode
noremap k i
" quit current vim window
noremap Q :q<CR>
" save the current file
noremap S :w<CR>

" 1.2. Remapped Cursor Movement in Normal Mode

" Cursor up a terminal line
noremap u k
" Cursor down a terminal line
noremap e j
" Cursor left
noremap n h
" Cursor right
noremap i l
" Cursor up 5 terminal lines
noremap U 5k
" Cursor down 5 terminal lines
noremap E 5j
" Cursor to the start of the line
noremap <C-n> 0
" Cursor to the end of the line
noremap <C-i> $
" Move the view port up 5 lines without moving the cursor
noremap <C-u> 5<C-y>
" Move the view port down 5 lines without moving the cursor
noremap <C-e> 5<C-e>	
" Move to the end of this word
noremap h e
" Move cursor five words forward
noremap W 5w
" Move cursor five words behind
noremap B 5b
" Move cursor five charactors forward
noremap I 5l
" Move cursor five charactors behind
noremap N 5h

" 1.3. Remapped Cursor Movement in Insert Mode

" Cursor left
inoremap <C-n> <Left>
" Cursor right
inoremap <C-i> <Right>
" Cursor up
inoremap <C-u> <Up>
" Cursor down
inoremap <C-e> <Down>
" Move cursor to the end of the line
inoremap <C-a> <End>

" 1.4. Remapped Cursor Movement in Command Mode

" Cursor left
cnoremap <C-n> <Left>
" Cursor right
cnoremap <C-i> <Right>
" Cursor up
cnoremap <C-u> <Up>
" Cursor down
cnoremap <C-e> <Down>

" 1.5. Remapped Text Manipulating Commands in Normal Mode

" undo
noremap l u
" redo
noremap <C-l> <C-r>

" 1.6. Other Useful Normal Mode Remappings

" Compile/Run the current file
noremap r :make<CR>

" Window Management

" 2.1. Creating Window Through Split Screen

" Create a new horizontal split screen and place it above the current window
noremap su <C-w>s<C-w>j
" Create a new horizontal split screen and place it below the current window
noremap se <C-w>s
" Creat a new vertical split screen and place it left to the current window
noremap sn <C-w>v<C-w>l
" Creat a new vertical split screen and place it right to the current window
noremap si <C-w>v

" 2.2. Moving the Cursor Between Different Windows

" Move cursor to one window left
noremap <space>n <C-w>h
" Move cursor to one window right
noremap <space>i <C-w>l
" Move cursor to one window up
noremap <space>u <C-w>k
" Move cursor to one window down
noremap <space>e <C-w>j

" 2.3. Resizing Different Windows

" Decrease current window height by N (default 1)
noremap <Down> <C-w>-
" Increase current window height by N (default 1)
noremap <Up> <C-w>+
" Decrease current window width by N (default 1)
noremap <Left> <C-w><
" Increase current window width by N (default 1)
noremap <Right> <C-w>>


" 2.4. Closing Windows

"Close the window below the current window.(The current window will be closed if there is no window
"below)
noremap <space>q <C-w>j<C-w>c

" others

" go to newer cursor position in jump list
noremap <C-y> <C-i>
" paste from register "0
noremap P "0p
" add multiple line comment in c code
vmap // :s:^://<CR>
" delede multiple line comment in c code
vmap ?? :s://:<CR>
" set up a placeholder
inoremap ?? <++>
" go to the next placeholder (<++>)
nnoremap <space><space> /<++><CR>vlllc
" indent in nomal mode
nnoremap > V><esc>
" Unindent in nomal mode
nnoremap < V<<esc>
" yink in insert mode
inoremap <C-v> <C-r>
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

