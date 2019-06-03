call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'roxma/nvim-completion-manager'
Plug 'w0rp/ale'
Plug 'cohama/lexima.vim'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
"Plug 'steelsojka/deoplete-flow'
Plug 'dyng/ctrlsf.vim'
call plug#end()

colorscheme one 
set background=dark

set hidden

set number
"set relativenumber
set termguicolors

set mouse=a

set inccommand=split
set clipboard=unnamed

set expandtab
set shiftwidth=2

let mapleader="\<space>"

nnoremap <leader>; A;<esc>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <C-p> :Files<cr>
nnoremap <C-f> :Ag<space>
nnoremap <C-q> :q<cr>
nnoremap <C-\> :NERDTreeToggle<cr>
nnoremap <C-S-Left> :vertical resize -1<cr>
nnoremap <C-S-Right> :vertical resize +1<cr>
nnoremap <C-S-Up> :resize -1<cr>
nnoremap <C-S-Down> :resize +1<cr>

map <leader>r :NERDTreeFind<cr>
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_linters = {'javascript': ['eslint', 'flow']}
let b:ale_linters_ignore = ['tsserver']

"let g:ale_sign_error = '●' " Less aggressive than the default '>>'
"let g:ale_sign_warning = '.'
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_fix_on_save = 1

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

let g:airline_theme='one'

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

"NERDTree-like config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * NERDTree
augroup END

" Deoplete
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#flow#flow_bin = 'flow' 

"let g:syntastic_javascript_checkers = ['eslint', 'flow']

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.gql,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" YouCompleteMe
" Start autocompletion after 4 chars
"let g:ycm_min_num_of_chars_for_completion = 4
"let g:ycm_min_num_identifier_candidate_chars = 4
"let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
"set completeopt-=preview
"let g:ycm_add_preview_to_completeopt = 0

