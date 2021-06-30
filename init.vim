let g:ruby_host_prog = '/Users/thelastinuit/.rvm/gems/ruby-2.7.0/bin/neovim-ruby-host'
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let mapleader=","
let g:indent_guides_enable_on_vim_startup = 1
set expandtab
set tabstop=4
set shiftwidth=4
set colorcolumn=80
set cursorline
set cursorcolumn
highlight CursorLine ctermbg=0 guibg=lightgrey cterm=none
highlight ColorColumn ctermbg=0 guibg=lightgrey
nmap <Space> :Files<CR>
nmap <Tab> :bnext!<CR>
nnoremap <BS> :Rg<CR>
let g:deoplete#enable_at_startup = 1

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
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'opodartho/vim-linenum'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tmhedberg/simpylfold'
Plug 'konfekt/fastfold'
Plug 'jwalton512/vim-blade'
Plug 'evanleck/vim-svelte'
Plug 'jparise/vim-graphql'
Plug 'elixir-lang/vim-elixir'
Plug 'jdonaldson/vaxe'
Plug 'leafgarland/typescript-vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'shougo/deoplete.nvim'

call plug#end()
