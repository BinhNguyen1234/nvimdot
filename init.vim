set clipboard=unamedplus
syntax on
colorscheme onedark
set encoding=utf-8
set signcolumn=yes

call plug#begin()
"Install vim devicon
Plug 'ryanoasis/vim-devicons'


Plug 'neovim/nvim-lspconfig'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Install File explorer
Plug 'preservim/nerdtree'|
           \ Plug 'Xuyuanp/nerdtree-git-plugin' 
" Install code cpp suggestion
"Plug 'Shougo/deoplete.nvim'
"Plug 'zchee/deoplete-clang'
" Prerequisite for install telescope for looking file

" themes
Plug 'joshdick/onedark.vim'

"status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" intelisense
call plug#end()

" config for F12 go to definit
nmap <silent> <F12> :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> <F36> <Plug>(coc-type-definition)
nmap <silent> <F24> <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" config for tab
nnoremap <C-t> gt
nnoremap <C-xt> :tabc<CR>

" config for split

nnoremap sc ^Wo

noremap <F5> :NERDTreeToggle<CR>

nnoremap <C-f> <cmd>Telescope find_files<cr>
autocmd VimEnter * NERDTree

lua << EOF
local lspconfig = require('lspconfig')
lspconfig.clangd.setup{}
EOF
