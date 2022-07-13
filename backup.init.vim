call plug#begin("~/.vim/plugged")
  " Plugin Section
	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'marko-cerovac/material.nvim'

	"AutoComplete and so on...
	Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }

	let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json']  " list of CoC extensions needed

	Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

	" these two plugins will add highlighting and indenting to JSX and TSX files.
	Plug 'yuezk/vim-js'
	Plug 'HerringtonDarkholme/yats.vim'
	Plug 'maxmellon/vim-jsx-pretty'

  call plug#end()
"Config Section
"Enable Line Counter
set number
"Disable SignColumn (grey bar)
set signcolumn=no
"Enable Colorscheme
colorscheme material
let g:material_style = "oceanic"


"NerdTree Config
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

"Integrated Terminal Config
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"Mapping for FuzzyFinder
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let $FZF_DEFAULT_COMMAND = 'ag -g ""'


"Coc.nvim config
"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <NUL> coc#refresh()

"Use <Tab> and <S-Tab> to navigate the completion list:

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"coc-prettier command configuration
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"cmd+s to save file 
:map <M-s> :w<kEnter>  "Works in normal mode, must press Esc first
:imap <M-s> <Esc>:w<kEnter>i "Works in insert mode, saves and puts back in insert mode
