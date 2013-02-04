set nocompatible
execute pathogen#infect()
set showcmd
set showmode
set number
set incsearch
set hlsearch
set wrap
set linebreak
syntax on
filetype plugin indent on
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set foldmethod=indent
set foldlevel=99
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename
nmap <leader>a <Esc>:Ack!
set statusline+=%{fugitive#statusline()}
set t_Co=256
set hidden

" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	sys.path.insert(0, project_base_dir)
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

