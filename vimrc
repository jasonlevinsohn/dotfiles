if $SHELL =~ 'bin/fish'
    set shell=/bin/bash
endif


                    
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"ColorSchemes
Bundle 'flazz/vim-colorschemes'


"Extra Syntaxes
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'

" Fuzzy Finder
Bundle 'kien/ctrlp.vim'

" Commenting with Backslash
Bundle 'tpope/vim-commentary'

" Zencoding
Bundle 'mattn/emmet-vim'

" Bundle 'mattn/zencoding-vim'
Bundle 'scrooloose/syntastic'

" Automatic closing of quotes, tags, parenths, and brackets
Bundle 'Raimondi/delimitMate'

" Freaking Awesome Auto Completion
Bundle 'Valloric/YouCompleteMe'

"Tabluar - used for aligning characters like = or :
Bundle 'godlygeek/tabular'

"MatchTag - highlights matching HTML tags when 
"the cursor is over one of the tags.
Bundle 'gregsexton/MatchTag'

"Dash - Documentation Manager
  Bundle 'rizzatti/funcoo.vim'
  Bundle 'rizzatti/dash.vim' 

" Multiple Cursors
Bundle 'terryma/vim-multiple-cursors'

" JSON Validator
Bundle 'elzr/vim-json'

" Fancy Status Line
Bundle 'bling/vim-airline'

" JSLint
" Bundle 'wookiehangover/jshint.vim'

" Git Gutter - shows commit diffs in the gutter.
" Bundle 'airblade/vim-gitgutter'
"
" TypeScript
Bundle 'leafgarland/typescript-vim'

"First scheme: colorscheme zenburn
" colorscheme wuye
" colorscheme wombat
" colorscheme wintersday



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
" set omnifunc=syntaxcomplete#Complete
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"


" ---------------------------------------------------------------------------- 
" ----------------------------------------------------------------------------
" Default tabstop / spacing
"
syntax on
" au BufNewFile,BufRead *.ts set filetype=ipt

set tabstop=4
set shiftwidth=4
set softtabstop=4

set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set nosmartindent
" set smartindent " Intellegently dedent / indent new lines based on rules. is apparently not that smart, files have rules already.
set noswapfile "Nobody likes a swap file
set completeopt-=preview "Don't show preview window when running SimpleJSON in Django

set ignorecase " sets the search scan so it ignores case
set smartcase " recognize uppercase if specified

set ch=2 " make command line two lines high

set laststatus=2 "Shows the status bar
set relativenumber "Enable Line Numbers
set ruler "Shows the line number on the status bar
" filetype indent on

"vim 7.3+ settings
set undofile "keep a a persistent undo file so we can undo after a reboot
set undodir=~/.vimundo//
set undoreload=10000


set showmatch "show us matching brackets, etc.

set hlsearch " enable search highlighting
set incsearch " search for matches as we type

" Don't ask to load an updated file, just do it.
set autowrite
set autoread

"Spell Checker
" set spell

"INSERT MODE - inoremap no other remap can come in here and override jf="the keys we want to map" <esc> the command you want to run
"NORMAL MODE - nnoremap

"Defines the <leader> tag when assigning key bindings
let mapleader=","

" Exit insert mode (never use Ctrl-C for this as it doesn't trigger
" InsertLeave)
inoremap jf <esc>

" Task Specific Shortcuts
" inoremap <c-j> __jlev___<left><left>
" inoremap <c-k> mdl.translateText('')<left><left>
" inoremap <c-l> data-i18n=""<left>
inoremap <c-c> console.log('');<left><left><left>
inoremap <c-v> console.dir('');<left><left><left>

nnoremap ; : 

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" Shortcut for sorting
vnoremap <leader>s :sort<cr>

" Shortcut for viewing old files
nnoremap <leader>o :browse oldfiles<cr>

"Turned off Arrow Keys to force myself to use home row key navigation
" nnoremap <up> <Nop>
" nnoremap <down> <Nop>
" nnoremap <left> <Nop>
" nnoremap <right> <Nop>

" inoremap <up> <Nop>
" inoremap <down> <Nop>
" inoremap <left> <Nop>
" inoremap <right> <Nop>


" vnoremap <up> <Nop>
" vnoremap <down> <Nop>
" vnoremap <left> <Nop>
" vnoremap <right> <Nop>

"Makes it easier to switch Split Views no more (i.e. Ctrl-W j)
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

"Clear that freakin highlighed search
nnoremap <leader><space> :noh<cr>


"Increase/decrease size of vsplit windows
nnoremap <c-o> :vertical resize +15<cr>
nnoremap <c-i> :vertical resize -15"<cr>

"Shows invisible characters
"set list
"set listchars=tab:▸\ ,eol:¬

"Save the file when losing focus
"au FocusLost * :wa


" Uppercase a word mapping
" Allows you to press <c-z> to uppercase a word
"
"                    cursor
"                    v
"     wordtouppercase|
"     <c-u>
"     WORDTOUPPERCASE|
"                    ^
"                    cursor
"
" Exiting out of insert mode will record the current cursor
" location in the z mark, then using gUiw to uppercase inside
" the current work, then moves back to the z mark, and puts
" you back in insert mode again.  
"
" NOTE - This does override the contents of z mark so don't use  that.
inoremap <c-z> <esc>mzgUiw`za


"Plug-in Configuration Section, - {{{

" vim-colorschemes
    " Match the original monokai background color
    " let g:molokai_original = 1
    " 256 color version default GUI version color terminal
    " let g:rehash256 = 1


" Dash
    let g:dash_map = {
        \ 'javascript' : 'angularjs'
        \ }
    nmap <leader>d <Plug>DashSearch
    vmap <leader>d <Plug>DashSearch



" Tabular 
    nnoremap <leader>a; :Tab /:<cr>
    vnoremap <leader>a; :Tab /:<cr>
    vnoremap <leader>f; :Tab /:\zs<cr>
    nnoremap <leader>f; :Tab /:\zs<cr>



" zencoding(emmet) settings
  let g:user_emmet_leader_key = '<c-e>'


" vim-commentary

    nmap <leader>c <Plug>CommentaryLine
    xmap <leader>c <Plug>Commentary

    " Apache Support
    autocmd FileType apache set commentstring=#\ %s


" ctrlp.vim

    let g:ctrlp_map = '<c-t>'
    let g:ctrlp_max_height = 30

    " For Wall-E Project, ignore some directories
    " Directories: /analysis /node_modules /build
    let g:ctrlp_custom_ignore = '\v[\/](node_modules|analysis|build)$'

" Syntastic {{{

    " let g:syntastic_enable_signs = 1
    " let g:syntastic_disabled_filetypes = ['html', 'py']
    " let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
    " let g:syntastic_jsl_conf = '$HOME/.vim/jsl.conf'
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:syntastic_javascript_checkers = ['eslint']
    let g:syntastic_typescript_checkers = ['tslint']

    " Default html checker is tidy.  It doesn't play nice with angular so...
    let g:syntastic_html_checkers = []

    let g:syntastic_html_tidy_ignore_errors = [
        \ 'proprietary attribute "ng-',
        \ 'proprietary attribute "dl-',
        \ '<form> proprietary attribute "novalidate"'
    \ ] 

" }}}

 " delimitMate {{{


        let delimitMate_expand_cr = 1
        let delimitMate_expand_space = 1


" }}}
" JSON Validation {{{
"
"   Don't conceal the double quotes everywhere.
    let g:vim_json_syntax_conceal = 0
" }}}
"
" YouCompleteMe {{{
    " let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_min_num_of_chars_for_completion               = 2
    let g:ycm_auto_trigger                                  = 1
    let g:ycm_collect_identifiers_from_tags_files           = 1
    let g:ycm_autoclose_preview_window_after_completion     = 1
    let g:ycm_autoclose_preview_window_after_insertion      = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 1

    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" }}}

" Airline {{{
    let g:airline_powerline_fonts=1
    " let g:airline_section_b = '%{getcwd()}'
    " let g:airline_section_c = '%t'
    let g:airline_section_y = ''
" }}}
    
        

" }}} - End Plug-in Manager


" slow multiple_cursors & YCM
function! Multiple_cursors_before()
    let g:ycm_auto_trigger = 0
endfunction
 
function! Multiple_cursors_after()
    let g:ycm_auto_trigger = 1
endfunction
