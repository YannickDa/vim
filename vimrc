set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Bundle 'jlanzarotta/bufexplorer'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'othree/html5.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Shougo/vimshell.vim'
Bundle 'shawncplus/phpcomplete.vim'
"Plugin 'Shougo/neocomplcache.vim'
Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-surround'
Plugin 'kien/tabman.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tobyS/vmustache'
Bundle 'tobyS/pdv'
Plugin 'vim-scripts/taglist.vim'
Bundle "pangloss/vim-javascript"
Plugin 'jelera/vim-javascript-syntax'
Plugin 'StanAngeloff/php.vim'
Plugin 'EvanDotPro/php_getset.vim'
Plugin 'mileszs/ack.vim'
Plugin 'comments.vim'
Plugin 'closetag.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'jQuery'
"Bundle 'JazzCore/neocomplcache-ultisnips'
Plugin 'Valloric/YouCompleteMe'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"execute pathogen#infect()
"syntax on
"filetype plugin indent on
"
"" Let unix format, utf8, see line number... etc...
set fileformat=unix
set encoding=utf-8
" Show lines number
set number
" Activate color syntax
syn on
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

color jellybeans


" Can copy/paste to an other vim windows
vmap <silent> ,y "xy<CR>:wviminfo! ~/.viminfo<CR>
nmap <silent> ,p :rviminfo! ~/.viminfo<CR>"xp

" Can delete ^M from Windows files
map <silent> ,m :%s/\r//g<CR>

" Config pour Fugitive
nmap ,ga :Git add
nmap ,gs :Gstatus<CR>
nmap ,gc :Git commit
nmap ,gpl :Git pull<CR>
nmap ,gps :Git push<CR>


" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts=1
"let g:airline_theme='bubblegum'





" Neocomplcache configuration
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_min_syntax_length = 3

"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"    return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"endfunction

"inoremap <expr><Enter>  pumvisible() ? "\<C-Y>" : "\<Enter>"
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"if !exists('g:neocomplcache_omni_patterns')
"    let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


" NERDTree configuration
let g:nerdtree_tabs_autoclose=1
inoremap <silent> <C-F> <ESC>:NERDTreeMirrorToggle<CR>i
vnoremap <silent> <C-F> :NERDTreeMirrorToggle<CR>
nnoremap <silent> <C-F> :NERDTreeMirrorToggle<CR>
let NERDTreeQuitOnOpen=1



" Tabman configuration
let g:tabman_toggle='<C-T>'
let g:tabman_number=0



" Ultisnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit='horizontal'



" PDV configuration
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>



" Taglist configuration
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



" vim-javascript configuration
let b:javascript_fold=1



" Buffer Explorer Options
inoremap <silent> <C-B> <ESC>:BufExplorer<CR>i
vnoremap <silent> <C-B> :BufExplorer<CR>
nnoremap <silent> <C-B> :BufExplorer<CR>
let g:bufExplorerShowRelativePath=1



" Javascript syntax configuration
let g:used_javascript_libs = 'underscore,backbone,jquery'
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0



" Closetag configuration
autocmd Filetype html,xml,xsl,htm,php source ~/.vim/bundle/closetag.vim/plugin/closetag.vim



" PHP-VIM Configuration
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END
