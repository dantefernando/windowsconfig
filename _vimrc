call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

set relativenumber
set number
set guifont=:h15

" Sets the leader key
let mapleader =" " 

" Compile document, be it markdown or py using compiler script
" ~/.local/bin/compiler
map <leader>c :w! \| !compiler "<c-r>%"<CR><esc>

au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.cs,*.rkt,*.h,*.html,*.txt,*.js
     \ set tabstop=4 |
     \ set softtabstop=4 |
     \ set shiftwidth=4 |
     \ set textwidth=120 |
     \ set expandtab |
     \ set autoindent |
     \ set fileformat=unix |

colorscheme slate
" colorscheme gruvbox
colorscheme molokai

set encoding=utf-8
set laststatus=2
set autoindent " enable auto indentation of lines
set smartindent " allow vim to best-effort guess the indentation
set hlsearch "highlights matching searches
set showmatch "highlights matching brackets
set wildmenu "graphical auto complete menu

nnoremap <F8> :noh <esc>
nnoremap <F7> :IndentGuidesToggle <esc>
nnoremap <F10> :tabnew <esc>
" nnoremap <C-TAB> :tabn <esc>
nnoremap <F11> :tabp <esc>


autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown


" Start on vim Startup
let g:indent_guides_enable_on_vim_startup = 0

" The size of the indent line
let g:indent_guides_guide_size = 4

" When it starts
let g:indent_guides_start_level = 1

" Set Vim Airline Theme
let g:airline_theme='fruit_punch'

