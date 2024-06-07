set encoding=utf-8
call plug#begin("~/.config/nvim/lua")
"Install vim devicon

Plug 'ryanoasis/vim-devicons'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'folke/tokyonight.nvim'



"Install File explorer
Plug 'preservim/nerdtree'|
           \ Plug 'Xuyuanp/nerdtree-git-plugin' 
" Install code cpp suggestion
"Plug 'Shougo/deoplete.nvim'
"Plug 'zchee/deoplete-clang'
" Prerequisite for install telescope for looking file

" themes
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
vim.cmd("syntax on")
vim.cmd("colorscheme tokyonight-night")

require'nvim-treesitter.configs'.setup{
ensure_installed = { "c", "cpp" , "lua", "vim", "vimdoc", "query" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
 sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
 auto_install = true,
 highlight = {
    	enable = true,
	additional_vim_regex_highlighting = false
	}
}
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
 
local on_attach = function(client, bufnr)
  -- Tùy ch?n cho các keybinding
  local opts = { noremap=true, silent=true, buffer=bufnr }

  -- Thi?t l?p các keybinding cho các ch?c nang LSP
  vim.keymap.set('n', '<F12>', function() vim.lsp.buf.declaration() end, { noremap = true, silent = false })
  vim.keymap.set('n', '<C-F12>', function() vim.lsp.buf.definition() end, { noremap = true, silent = false })
  vim.keymap.set('n', '<F11>', vim.lsp.buf.references, { noremap = true, silent = false })end
 lspconfig.clangd.setup{
	capabilities = cmp_nvim_lsp.default_capabilities(),
	on_attach = on_attach,
 }


 local set = vim.pot

 vim.o.number = true

vim.keymap.set('', '<F12>', ':NERDTreeToggle<CR>')

 vim.keymap.set('', '<F5>', ':NERDTreeToggle<CR>')
 vim.keymap.set('','<C-t>l','<ESC>:tabnext<CR>',{noremap = true, silent = false})
 vim.keymap.set('', '<C-t>h', '<ESC>:tabprevious<CR>',{noremap = true, silent = false})
 vim.keymap.set('','<C-t>o','<ESC>:tabc<CR>',{noremap = true, silent = false})
 

 vim.api.nvim_create_autocmd({'CursorHoldI'},{
	callback = function()
		vim.lsp.buf.hover()
	end
 })
vim.api.nvim_create_autocmd({'CursorHold'},{
	callback = function()
		vim.lsp.buf.hover()
	end
 })



 vim.api.nvim_create_autocmd({'VimEnter'},{
	callback = function()
		vim.cmd('NERDTree')
	end
 })




EOF
