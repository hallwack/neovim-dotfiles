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
    Plug 'famiu/feline.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'romgrk/barbar.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'akinsho/flutter-tools.nvim'
call plug#end()

colorscheme deus
let g:deus_termcolors=256

source ~/.config/nvim/mappings.vim


" Lua files
:lua << EOF
    require('lsp')
    require('completion')
    require('indentline')
    require('autopairs')
    require('treesitter')
    require('linestat')
    require('git')
EOF
