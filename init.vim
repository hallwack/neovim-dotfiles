" Basic
syntax on
set number
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set tabpagemax=10
set noswapfile
set t_Co=256
set laststatus=2
set cursorline
set timeoutlen=500
set mouse=a
if has("termguicolors")     " set true colors
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
    set termguicolors
endif

hi Normal guibg=NONE ctermbg=NONE

" Set Plugin (with vim-plug)
call plug#begin('~/.config/nvim/plugged')
    Plug 'theniceboy/nvim-deus'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'windwp/nvim-autopairs'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'windwp/nvim-ts-autotag'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'glepnir/galaxyline.nvim'
call plug#end()

colorscheme deus
let g:deus_termcolors=256

" Buffer
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>
nnoremap <S-w> :bw<CR>

" Window Navigation (with ALT + WASD)
nnoremap <A-a> <C-w>h
nnoremap <A-s> <C-w>j
nnoremap <A-w> <C-w>k
nnoremap <A-d> <C-w>l

" Set Size Windows (with CTRL + KHJL)
nnoremap <C-h> :vertical resize -2<CR>
nnoremap <C-j> :resize -2<CR>
nnoremap <C-k> :resize +2<CR>
nnoremap <C-l> :vertical resize +2<CR>

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

set completeopt=menuone,noselect

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

let g:nvim_tree_side = 'right'
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_highlight_opened_files = 1

let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

:lua << EOF
    require('lsp')
    require('completion')
    require('indentline')
    require('autopairs')
    require('treesitter')
    require('linestat')
EOF
