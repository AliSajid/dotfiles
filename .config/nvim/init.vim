" Customized neovim  configuration

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" PLUG {{{
call plug#begin('~/.config/nvim/plugged')

" vim-plug plugins
Plug 'editorconfig/editorconfig-vim'
Plug 'jidn/vim-dbml'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'Raimondi/delimitMate'
Plug 'hashivim/vim-terraform'
Plug 'preservim/tagbar'
Plug 'jalvesaq/Nvim-R'
Plug 'chrisbra/csv.vim'
Plug 'LukeGoodsell/nextflow-vim'
Plug 'mattn/webapi-vim'
Plug 'moll/vim-bbye'
Plug 'pangloss/vim-javascript'
Plug 'simeji/winresizer'
Plug 'LnL7/vim-nix'
Plug 'simnalamburt/vim-mundo'
Plug 'vim-syntastic/syntastic'
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tomtom/tcomment_vim' " gc comments
Plug 'tpope/vim-surround'
Plug 'milkypostman/vim-togglelist'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'neomake/neomake', { 'for': ['rust', 'haskell', 'typescript'] }
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'Vimjas/vim-python-pep8-indent'


" FZF / Ctrlp for file navigation
if executable('fzf')
  " OSX vs Linux loading (depending on where fzf is)
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Darwin"
    Plug '/usr/local/opt/fzf'
  else
    Plug 'junegunn/fzf', {'dir': '~/.local/src/fzf', 'do': './install --all' }
  endif
  Plug 'junegunn/fzf.vim'
else
  Plug 'ctrlpvim/ctrlp.vim'
endif



" Language plugins
" Scala plugins
if executable('scalac')
  Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
endif
" Haskell Plugins
if executable('ghc')
  Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
  Plug 'owickstrom/neovim-ghci', { 'for': 'haskell' }
endif
" Rust Plugins
if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'racer-rust/vim-racer', { 'for': 'rust' }
endif

Plug 'vim-ruby/vim-ruby'

call plug#end()
" }}}


" KEYMAPPINGS {{{
" Leader key
let mapleader = ","

" arrow keys disable
nnoremap <right> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <up> <nop>

vnoremap <right> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <up> <nop>

" j/k move virtual lines, gj/jk move physical lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" WinResizer Shortcuts
let g:winresizer_start_key = "<leader>r"

" Tagbar Shortcut
nmap <F8> :TagbarToggle<CR>

" Remap increment and decrement numbers to something that works on macs/linux
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" panes
nnoremap <leader>d :vsp<cr>
set splitright
nnoremap <leader>s :split<cr>
set splitbelow
" map <C-w>w (switch buffer focus) to something nicer
nnoremap <leader>w <C-w>w

 tabs
nnoremap <leader>] :tabn<cr>
nnoremap <leader>[ :tabp<cr>
nnoremap <leader>T :tabe<cr>

" Insert date
nnoremap <leader>fd "=strftime("%m-%d-%y")<CR>p

" Edit vimrc
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>evs :source $MYVIMRC<cr>
" Toggle paste with F2
set pastetoggle=<F2>

" Terminal Mode
" Use escape to go back to normal mode
tnoremap <Esc> <C-\><C-n>

" }}}

" JS Prettier Configuration
let g:prettier#autoformat_config_present = 1
let g:prettier#exec_cmd_async = 1


" Syntax highlighting for Vagrantfile
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

" Configuring JavaScript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1


" Hard coding python providers

let g:python3_host_prog = '/Users/asimami/.venv/.neovim3/bin/python'
let g:python_host_prog = '/Users/asimami/.venv/.neovim2/bin/python'

" Rust format
let g:rustfmt_autosave = 1

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Racer options
set hidden
let g:racer_cmd = "/Users/asimami/.local/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
au FileType rust nmap <leader>rx <Plug>(rust-doc)
au FileType rust nmap <leader>rd <Plug>(rust-def)
au FileType rust nmap <leader>rs <Plug>(rust-def-split)j

" deoplete options
let g:deoplete#enable_at_startup = 1

" Playpen Integration
let g:rust_clip_command = 'pbcopy'

" vim-terraaform settings
let g:terraform_align=1
let g:terraform_fmt_on_save=1


" LOOK AND SYNTAX HILIGHTING {{{
set t_Co=256
syntax on
set background=dark
filetype plugin indent on
let g:gruvbox_italic=1
autocmd vimenter * ++nested colorscheme gruvbox
set termguicolors


" whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$/ containedin=ALL

" Undefined Marks
highlight UndefinedMarks ctermfg=yellow
autocmd Syntax * syn match UndefinedMarks /???/ containedin=ALL

" save undo trees in files
set undofile
set undodir=~/.vim/undo

" number of undo saved
set undolevels=10000 

" Automatic syntax highlighting for files
au BufRead,BufNewFile *.sbt           set filetype=scala
au BufRead,BufNewFile *.conf          set filetype=dosini
au BufRead,BufNewFile *.bash*         set filetype=sh
au BufRead,BufNewFile *.pp            set filetype=puppet

" Better split character
" Override color scheme to make split them black
" set fillchars=vert:\|
set fillchars=vert:│

set colorcolumn=121
set cursorline
" }}}


" Brace Completion {{{
set showmatch

" delimitMate setttings
let g:delimitMate_autoclose = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_smart_matchpairs = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_matchpairs = "(:),[:],{:}"
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
" }}}

" GENERAL/TOGGLEABLE SETTINGS {{{
" horizontal split splits below
set splitbelow

" indentation
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
filetype indent off
au BufNewFile,BufRead *.py
  \ setlocal tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ autoindent
  \ expandtab

" line numbers
set number

" show title
set title

" mouse
set mouse-=a


" Ignore case unless use a capital in search (smartcase needs ignore set)
set ignorecase
set smartcase

" Textwidth for folding
set textwidth=120

" Disable cursor styling in new neovim version
set guicursor=
" }}}

" Rusty-tags setup
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" vim-dbml config
let g:dbml_nofold_blocks = 1

" Remapping escape key
imap jj <Esc>
