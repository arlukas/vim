set encoding=utf-8
set nocompatible

filetype plugin indent on

syntax on

"Corrección ortográfica
"set spell
set spell spelllang=es
set nospell

"Configuación de autoindentación
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround

"Números de línea y relativos
set number
set relativenumber

"Marcadores de línea y columna
set cursorline
"set cursorcolumn
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set textwidth=80

"Line wrap
set wrap 
set linebreak

"Resaltado de las búsquedas
set incsearch
set hlsearch

"Apertura de ficheros (tercero) abajo
set splitbelow

"Split right
"set vsplit
"==================================
"Plugins con Vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin('~/.vim/plugged')

"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Surround
Plug 'tpope/vim-surround'

"fzf
Plug 'junegunn/fzf.vim',{'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'

"Insert/Replace cursor
Plug 'wincent/terminus'

"Autocompletado general
Plug 'neoclide/coc.nvim'

"Autocompletado Python
Plug 'davidhalter/jedi-vim'

"Color Scheme
Plug 'ayu-theme/ayu-vim'

"Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

call plug#end()
"Fin de la definición de los plugins
"=========================================

"Estas dos definiciones son necesarias para que jedi-vim no 
"autocomplete automáticamente con la primera sugerencia
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 1

let g:coc_disable_startup_warning=1

"Sutitución de los espacios por ·
hi Conceal guibg=NONE ctermbg=NONE ctermfg=DarkGray
autocmd BufRead * setlocal conceallevel=2 concealcursor=nV
autocmd BufRead * syn match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=· 


"Configuración de los Snippets
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<c-t>"

iabbr fechasnip <C-r>=strftime('%c')<CR><CR>
