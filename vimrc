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
set foldmethod=syntax
set hlsearch
set hidden
set paste
set nopaste
set wildmode=longest,list
set completeopt=longest,menuone
set laststatus=2

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

color jellybeans

au BufRead,BufNewFile *.js set ft=javascript syntax=jquery

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
inoremap <silent> <C-F> <ESC>:NERDTreeMirrorToggle<CR>i
vnoremap <silent> <C-F> :NERDTreeMirrorToggle<CR>
nnoremap <silent> <C-F> :NERDTreeMirrorToggle<CR>
let g:nerdtree_tabs_autoclose=1
let NERDTreeQuitOnOpen=1

" PHP DocBloc
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
autocmd FileType php inoremap <C-p> <ESC>:call pdv#DocumentWithSnip()<CR>i
autocmd FileType php nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
autocmd FileType php vnoremap <C-p> :call pdv#DocumentWithSnip()<CR> 

" Close Tag script
autocmd Filetype html,xml,xsl,htm,php source ~/.vim/scripts/closetag.vim

" Tabman configuration
let g:tabman_toggle='<C-T>'
let g:tabman_number=0

" Options phpcomplete
let g:phpcomplete_parse_docblock_comments=1

" Config pour Fugitive
nmap ,ga :Git add
nmap ,gs :Gstatus<CR>
nmap ,gc :Git commit
nmap ,gpl :Git pull<CR>
nmap ,gps :Git push<CR>

" Config airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'

" Buffer Explorer Options
inoremap <silent> <C-B> <ESC>:BufExplorer<CR>i
vnoremap <silent> <C-B> :BufExplorer<CR>
nnoremap <silent> <C-B> :BufExplorer<CR>

" Config neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Config UltiSnips
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
