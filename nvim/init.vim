set encoding=utf-8




call plug#begin("~/.config/nvim/lua")
"Install vim devicon

Plug 'ryanoasis/vim-devicons'


Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'



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
"
"nmap <silent> <F12> :call CocAction('jumpDefinition', 'vsplit')<CR>
"nmap <silent> <F36> <Plug>(coc-type-definition)
"nmap <silent> <F24> <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" config for tab





lua << EOF
-- package.path = package.path .. ';~/.config/nvim/lua/'
-- nvim-cmp
 local cmp = require('cmp')

 local lspconfig = require('lspconfig')

-- cmp-nvim-lsp
 local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Set up nvim-cmp.
cmp.setup {
-- use cmp_nvim_lsp is source of nvim-cmp ()
  sources = {
    { name = 'nvim_lsp' }
  },
	mapping = cmp.mapping.preset.insert({})
 }

 vim.lsp.start()
 
 lspconfig.clangd.setup{
	capabilities = cmp_nvim_lsp.default_capabilities(),
 }


 local set = vim.pot

 vim.o.number = true

 vim.keymap.set('', '<F5>', ':NERDTreeToggle<CR>')
 vim.keymap.set('','<C-t>l','<ESC>:tabnext<CR>',{noremap = true, silent = false})
 vim.keymap.set('', '<C-t>h', '<ESC>:tabprevious<CR>',{noremap = true, silent = false})
 vim.keymap.set('','<C-t>o','<ESC>:tabc<CR>',{noremap = true, silent = false})
 
 vim.api.nvim_create_autocmd({'VimEnter'},{
	callback = function()
		vim.cmd('NERDTree')
	end
 })




EOF
