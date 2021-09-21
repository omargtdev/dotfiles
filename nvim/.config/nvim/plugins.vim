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

" indentline
Plug 'Yggdroot/indentLine'

" nerdtree
Plug 'preservim/nerdtree'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" search
Plug 'easymotion/vim-easymotion'

" themes 
Plug 'joshdick/onedark.vim' 
Plug 'morhetz/gruvbox'

" SQL environment
Plug 'tpope/vim-dadbod'
Plug 'jsborjesson/vim-uppercase-sql'

call plug#end()
