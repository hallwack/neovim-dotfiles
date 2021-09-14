" Basic
syntax on
set number
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
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
set hidden
if has("termguicolors")     " set true colors
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
    set termguicolors
endif

hi Normal guibg=NONE ctermbg=NONE

" Set Plugin (with vim-plug)
call plug#begin('~/.config/nvim/plugged')
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'windwp/nvim-autopairs'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'windwp/nvim-ts-autotag'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'romgrk/barbar.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'mhartington/formatter.nvim'
    Plug 'andweeb/presence.nvim'
    Plug 'b3nj5m1n/kommentary'
    Plug 'folke/todo-comments.nvim'
    Plug 'sainnhe/everforest'
    Plug 'akinsho/flutter-tools.nvim'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'Neevash/awesome-flutter-snippets'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'windwp/windline.nvim'
call plug#end()

set background=dark
let g:everforest_background = 'hard'
let g:everforest_enable_italic = 1
let g:everforest_ui_contrast = 'hard'
let g:everforest_transparent_background = 0 " for transparent background
colorscheme everforest

" vsnip
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

" Nvim Tree
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_highlight_opened_files = 1

" Dart
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

autocmd BufRead,BufNewFile *.dart setlocal tabstop=2 shiftwidth=2 softtabstop=2

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
    require('tools')
    require('telescope-tools')
EOF
