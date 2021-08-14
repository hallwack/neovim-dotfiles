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
    Plug 'mhartington/formatter.nvim'
    Plug 'andweeb/presence.nvim'
    Plug 'b3nj5m1n/kommentary'
    Plug 'folke/todo-comments.nvim'
call plug#end()

colorscheme deus
let g:deus_termcolors=256

let g:nvim_tree_indent_markers = 1
let g:nvim_tree_highlight_opened_files = 1

let g:dart_style_guide = 2
let g:dart_format_on_save = 1

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
    require('format')
    require('discord')
EOF
