let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set ttimeout ttimeoutlen=50

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'Shougo/neocomplete.vim'

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
Bundle 'shawncplus/phpcomplete.vim'
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
Plugin 'tpope/vim-ragtag'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'jQuery'
Bundle "nvie/vim-flake8"
Bundle "mxw/vim-jsx"
Plugin 'Raimondi/delimitMate'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'moll/vim-node'
Plugin 'styled-components/vim-styled-components'
Plugin 'wakatime/vim-wakatime'


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
set shiftwidth=2
set tabstop=2
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
set backupcopy=yes

color jellybeans


" Can copy/paste to an other vim windows
vmap <silent> ,y "xy<CR>:wviminfo! ~/.viminfo<CR>
nmap <silent> ,p :rviminfo! ~/.viminfo<CR>"xp

" Can delete ^M from Windows files
map <silent> ,m :%s/\r//g<CR>

" Can delete ^M from Windows files
map <silent> ,; :%s/;$//g<CR>

" Config pour Fugitive
nmap ,ga :Git add
nmap ,gs :Gstatus<CR>
nmap ,gc :Git commit
nmap ,gpl :Git pull<CR>
nmap ,gps :Git push<CR>

" format JSON
nmap ,j :%!python -m json.tool<CR>

" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts=1
"let g:airline_theme='bubblegum'




" Ultisnips configuration
let g:UltiSnipsExpandTrigger="<NOP>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<NOP>"
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrJumpForwardOrReturnTab()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<TAB>"
    endif
endfunction
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit='horizontal'



"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
" <TAB>: completion.
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "<C-R>=ExpandSnippetOrJumpForwardOrReturnTab()<CR>"
"snoremap <buffer> <silent> <TAB> <ESC>:call UltiSnips#JumpForwards()<CR>
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1

" Enable omni completion.
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,phtml setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType js,jsx,javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" NERDTree configuration
let g:nerdtree_tabs_autoclose=1
inoremap <silent> <C-F> <ESC>:NERDTreeMirrorToggle<CR>i
vnoremap <silent> <C-F> :NERDTreeMirrorToggle<CR>
nnoremap <silent> <C-F> :NERDTreeMirrorToggle<CR>
let NERDTreeQuitOnOpen=1



" Tabman configuration
let g:tabman_toggle='<C-T>'
let g:tabman_number=0


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

" Move line
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"nmap n :m +1<CR>
"nmap m :m -2<CR>


" Javascript syntax configuration
let g:used_javascript_libs = 'underscore,backbone,jquery,react,flux,jasmine,chai,handlebars'
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularui = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularuirouter = 0
autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
autocmd BufReadPre *.js let b:javascript_lib_use_flux = 1
autocmd BufReadPre *.js let b:javascript_lib_use_requirejs = 0
autocmd BufReadPre *.js let b:javascript_lib_use_sugar = 0
autocmd BufReadPre *.js let b:javascript_lib_use_jasmine = 1
autocmd BufReadPre *.js let b:javascript_lib_use_chai = 1
autocmd BufReadPre *.js let b:javascript_lib_use_handlebars = 1


" Closetag configuration
" autocmd Filetype html,xml,xsl,htm,php source ~/.vim/bundle/closetag.vim/plugin/closetag.vim


" PHP-VIM Configuration
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

" let JSHintUpdateWriteOnly=1

let g:jsx_ext_required = 0

let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

cnoreabbrev Ack Ack! --ignore-dir=build

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set t_RV=
