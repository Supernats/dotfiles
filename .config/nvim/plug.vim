" ========
"   Plug
" ========

" Install vim-plug if we don't already have it
if empty(glob("~/.config/nvim/autoload/plug.vim"))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

" YCM might take a long time
let g:plug_timeout=300

" Also, YCM needs special handling
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

call plug#begin('~/.config/nvim/plugged')
" Add or remove your Bundles here:
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'kien/rainbow_parentheses.vim'
Plug 'janx/vim-rubytest'
Plug 'danro/rename.vim'
Plug 'diepm/vim-rest-console'
Plug 'gioele/vim-autoswap'
Plug 'bling/vim-airline'
Plug 'chrisbra/csv.vim'
Plug 'skalnik/vim-vroom'
Plug 'vim-scripts/AdvancedSorters'
Plug 'ngmy/vim-rubocop'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-vinegar'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
call plug#end()
