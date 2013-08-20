execute pathogen#infect()
syntax on
filetype plugin indent on

" Let unix format, utf8, see line number... etc...
set fileformat=unix
set encoding=utf-8
" Show lines number
set number
" Activate color syntax
syn on
set nocompatible 
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set showtabline=2
set foldmethod=indent
set hlsearch
set hidden
set paste
set nopaste
set wildmode=longest,list
set completeopt=longest,menuone

au FileType php set omnifunc=phpcomplete#CompletePHP

" Can copy/paste to an other vim windows
vmap <silent> ,y "xy<CR>:wviminfo! ~/.viminfo<CR>
nmap <silent> ,p :rviminfo! ~/.viminfo<CR>"xp

" Can delete ^M from Windows files
map <silent> ,m :%s/\r//g<CR>

" Configure ListTags plugin
inoremap <silent> <C-L> <ESC>:TlistToggle<CR>i
vnoremap <silent> <C-L> :TlistToggle<CR>
nnoremap <silent> <C-L> :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Close_On_Select=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Process_File_Always=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Sort_Type="name"

" Configure NERDTree
inoremap <silent> <C-F> <ESC>:NERDTreeToggle<CR>i
vnoremap <silent> <C-F> :NERDTreeToggle<CR>
nnoremap <silent> <C-F> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

" PHP DocBloc
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

" Close Tag script
autocmd Filetype html,xml,xsl,htm,php source ~/.vim/scripts/closetag.vim

" Tabman configuration
let g:tabman_toggle='<C-T>'
let g:tabman_number=0

" Options phpcomplete
let g:phpcomplete_parse_docblock_comments=1

" Syntestic configs
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
