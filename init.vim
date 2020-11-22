let g:ruby_host_prog = '/Users/thelastinuit/.rvm/gems/ruby-2.7.0/bin/neovim-ruby-host'
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:indent_guides_enable_on_vim_startup = 1

map <Space> :Files<CR>
map <Tab> :bnext!<CR>
noremap <F3> :Autoformat<CR>

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'zefei/vim-wintabs'
Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/simpylfold'
Plug 'konfekt/fastfold'
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()
