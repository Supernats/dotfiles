let g:ruby_path = system('rbenv prefix')
set backupdir=~/.vimtemp
set directory=~/.vimtemp

" ===========
"   Plugins
" ===========
source ~/.config/nvim/plug.vim

syntax enable
filetype plugin indent on

set clipboard=unnamed
set autoread
set rnu
set nu
set ruler
set smartindent
syntax on
set ai
set aw
set ts=2
set sw=2
set expandtab
set softtabstop=2
set ignorecase
set smartcase
set scrolloff=5
set backspace=indent,eol,start
set timeoutlen=1000
set ttimeoutlen=50
set textwidth=80
" colors
set t_Co=256
colorscheme navajo

" Rainbow Parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" VROOM
let g:vroom_use_dispatch = 1
let g:vroom_detect_spec_helper = 1
let g:vroom_use_binstubs = 1
let g:vroom_test_unit_command= 'rake test'
let g:vroom_use_spring = 1

" autosessions (courtesy of gkchestertron)
command -nargs=1 MS :mksession ~/vimsessions/<args>.vim
command -nargs=1 SS :mksession! ~/vimsessions/<args>.vim
command -nargs=1 LS :source ~/vimsessions/<args>.vim
command LL :source ~/vimsessions/last.vim
autocmd VimLeavePre * :mksession! ~/vimsessions/last.vim

" mappings

" make Y work like the other capital verbs
nmap Y y$

" Autoswap stuff
let g:autoswap_detect_tmux = 1

set tags=tags

let mapleader =" "
" Switch between the last two files
nnoremap <silent> <leader><leader> <c-^>

" Removes trailing spaces
function TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>ttt :call TrimWhiteSpace()<CR>

" Toggle NERDTree hella fast
nnoremap <silent> <Leader>n :NERDTreeMirrorToggle<CR>
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>gw :Gw<CR>

let g:airline#extensions#tabline#enabled = 1

let g:vimrubocop_config = '/users/baldur/work/coverhound/.rubocop.yml'

" Syntastic recommended new user settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ALE
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0


" FZF mappings
let g:fzf_command_prefix = 'Fzf'
nnoremap <C-p> :FZF!<CR>
nnoremap <Leader>b :Buffers<CR>

" Grepper
runtime autoload/grepper.vim

" VRC Split Requests
let g:vrc_split_request_body = 1

" ===== Seeing Is Believing =====
" Assumes you have a Ruby with SiB available in the PATH
" If it doesn't work, you may need to `gem install seeing_is_believing -v 3.0.0.beta.6`
" ...yeah, current release is a beta, which won't auto-install

" Annotate every line
nmap <leader>rbA :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>;
" Annotate marked lines
nmap <leader>rba :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>;
" Remove annotations
nmap <leader>rbd :%.!seeing_is_believing --clean<CR>;
" Mark the current line for annotation
nmap <leader>rbm A # => <Esc>
" Mark the highlighted lines for annotation
vmap <leader>rbM :norm A # => <Esc>

" ===== arrow-logger.js =====
" Assumes you have arrow-logger available in the PATH
" Annotate marked lines
nmap <leader>jsa :%.!arrow-logger<CR>;
" Mark the current line for annotation
nmap <leader>jsm A // => <Esc>
" Mark the highlighted lines for annotation
vmap <leader>jsM :norm A # => <Esc>

" Something in Sierra/High Sierra completely broke exiting insert mode.
" Let's fix that.
vnoremap <ESC> <C-c>
inoremap <ESC> <C-c>

" Get that automated ALE fixing
let g:ale_fixers = { 'ruby': 'rubocop' }

" Vim-Test bindingings
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
