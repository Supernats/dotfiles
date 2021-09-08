" =====================================================================
" Plug
" =====================================================================

" Install vim-plug if we don't already have it
if empty(glob("~/.config/nvim/autoload/plug.vim"))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')
" Add or remove your Bundles here:
" =====================================================================
" General packages with no post-install
" =====================================================================
Plug 'bling/vim-airline'
Plug 'chrisbra/Recover.vim'
Plug 'danro/rename.vim'
Plug 'darfink/vim-plist'
Plug 'diepm/vim-rest-console'
Plug 'editorconfig/editorconfig-vim'
Plug 'flazz/vim-colorschemes'
Plug 'janko-m/vim-test'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mhinz/vim-grepper'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'romainl/vim-qf'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/vim-slumlord'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/AdvancedSorters'
Plug 'w0rp/ale'
Plug 'wannesm/wmgraphviz.vim'
" =====================================================================
" General packages with post-install
" =====================================================================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" =====================================================================
" Language specific packages
" =====================================================================
" =====================================================================
" CoffeeScript
" =====================================================================
Plug 'kchmck/vim-coffee-script'
" =====================================================================
" CSV
" =====================================================================
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
" =====================================================================
" Golang
" =====================================================================
" Plug 'fatih/vim-go', { 'for': 'go' }
" =====================================================================
" Markdown
" =====================================================================
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
" =====================================================================
" PlantUML
" =====================================================================
Plug 'aklt/plantuml-syntax'
" =====================================================================
" Ruby
" =====================================================================
Plug 'janx/vim-rubytest', { 'for': 'ruby' }
Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }
Plug 'skalnik/vim-vroom', { 'for': 'ruby' }
call plug#end()
