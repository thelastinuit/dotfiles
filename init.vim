let g:ruby_host_prog = '/Users/thelastinuit/.rvm/gems/ruby-2.7.0/bin/neovim-ruby-host'
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let mapleader=","
set expandtab
set tabstop=4
set shiftwidth=4
nmap <Space> :Files<CR>
nmap <Tab> :bnext!<CR>
nnoremap <BS> :Rg<CR>

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'zefei/vim-wintabs'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'opodartho/vim-linenum'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tmhedberg/simpylfold'
Plug 'konfekt/fastfold'
Plug 'jwalton512/vim-blade'
Plug 'evanleck/vim-svelte'
Plug 'jparise/vim-graphql'

call plug#end()
