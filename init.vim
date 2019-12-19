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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
"Plug 'steelsojka/deoplete-flow'
Plug 'slashmili/alchemist.vim'
"Plug 'wokalski/autocomplete-flow'
" For func argument completion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'flowtype/vim-flow', {
            \ 'autoload': {
            \     'filetypes': 'javascript'
            \ },
            \ 'build': {
            \     'mac': 'npm install -g flow-bin',
            \     'unix': 'npm install -g flow-bin'
            \ }}
Plug 'ngmy/vim-rubocop'
Plug 'rainerborene/vim-reek'
Plug 'shime/vim-livedown'
Plug 'roman/golden-ratio'
Plug 'eugen0329/vim-esearch'
call plug#end()

colorscheme one 
set background=dark

set hidden

set number
"set relativenumber
set termguicolors

set autoread

set mouse=n

set inccommand=split
set clipboard=unnamed

set expandtab
set shiftwidth=2

set splitright
set diffopt+=vertical

let mapleader="\<space>"

nnoremap <leader>; A;<esc>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <C-p> :Files<cr>
nnoremap <C-s> :Ag<space>
nnoremap <C-q> :q<cr>
nnoremap <C-\> :NERDTreeToggle<cr>
nnoremap <C-S-Left> :vertical resize -1<cr>
nnoremap <C-S-Right> :vertical resize +1<cr>
nnoremap <C-S-Up> :resize -1<cr>
nnoremap <C-S-Down> :resize +1<cr>
nnoremap <C-PageUp> :tabprevious<CR>                                                                            
nnoremap <C-PageDown> :tabnext<CR>
map <leader>r :NERDTreeFind<cr>
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

let g:ale_fixers = {'javascript': ['prettier'], 'ruby': ['rubocop', 'reek'] }
let g:ale_linters = {'javascript': ['eslint', 'flow']}
let b:ale_linters_ignore = ['tsserver']

"let g:ale_sign_error = '●' " Less aggressive than the default '>>'
"let g:ale_sign_warning = '.'
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_fix_on_save = 1

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

let g:flow#autoclose = 1

" Airline (statusline)
let g:airline_theme='onedark'
"let g:airline_section_b='%{FugitiveStatusline()}'

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" lexima
let g:lexima_enable_newline_rules = 0

"NERDTree-like config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * NERDTree
"augroup END
let g:NERDTreeMouseMode=3

" Deoplete
let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#flow#flow_bin = 'flow' 

" neosnippet
let g:neosnippet#enable_completed_snippet = 1

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

let g:syntastic_javascript_checkers = ['eslint']

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

" neosnippet
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=nv
endif

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'

augroup numbertoggle
 autocmd!
 autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
 autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

if exists('&inccommand')
 set inccommand=split
endif

if !exists(":Source")
  command Source source ~/.nvim/.init.vim
endif
if !exists(":SourceAndInstall")
  command SourceAndInstall source ~/.nvim/init.vim <bar> :PlugInstall
endif

map <Leader>soi :SourceAndInstall<CR>
map <Leader>sor :Source<CR>
