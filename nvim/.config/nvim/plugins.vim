call plug#begin('~/.vim/plugged')

" syntax support
Plug 'sheerun/vim-polyglot'

" icons
Plug 'ryanoasis/vim-devicons'

" auto close () [] , etc
Plug 'jiangmiao/auto-pairs'
" for </>
Plug 'alvan/vim-closetag'

" intelissense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" nerdtree
Plug 'preservim/nerdtree'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" themes 
Plug 'joshdick/onedark.vim' 
Plug 'morhetz/gruvbox'

call plug#end()
