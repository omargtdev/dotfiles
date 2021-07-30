" USER INTERFACE
set number " line number
set relativenumber 
set wildmenu " display command line's tab complete options as a menu
set wildmode=list:longest " make wildmenu behave like similar to Bash completion
set ruler " always show cursor position
set clipboard=unnamedplus " clipboard copy/paste
set mouse=a " mouse support
set encoding=utf-8 " set encoding
set noshowmode " remove the line from the current mode
filetype on " enable type file detection
filetype plugin on " load an indent file for the detected file type
    
"  INDENTION 
set tabstop=4 " how many space to display a tab				
set smarttab " Insert 'tabstop' number of spaces when the 'tab' key is pressed.
set shiftwidth=4 " when shifting, indent using four spaces
set autoindent " new lines inherit the identation of previous lines
set expandtab " converts tabs to spaces
filetype indent on " enable identation rules that are file-type specific

"  SEARCH
set hlsearch " enable search highlighting
set incsearch " Incremental search that shows partial matches

" TEXT RENDERING
syntax on " hability syntax
set wrap " enable line wrapping

" time of update
set updatetime=100
