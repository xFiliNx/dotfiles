" Инициализация {{{
" Выключить режим совместимости
set nocompatible

""""""""""""""
" tmux fixes "
"""""""""""""""
" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen-256color'
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
	map! <Esc>OF <End>
endif


" НАСТРОЙКИ ОТСТУПА
set shiftwidth=4 " размер отступов (нажатие на << или >>)
set tabstop=4 " ширина табуляции
set softtabstop=4 " ширина 'мягкого' таба
set autoindent " ai - включить автоотступы (копируется отступ предыдущей строки)
set cindent " ci - отступы в стиле С
set expandtab " преобразовать табуляцию в пробелы
set smartindent " Умные отступы (например, автоотступ после {)
" Для указанных типов файлов отключает замену табов пробелами и меняет ширину отступа
au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8

" Строка статуса
set laststatus=2   " всегда показывать строку статуса
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=gray
hi IndentGuidesEven ctermbg=gray
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:solarized_termcolors=256

set noswapfile

" Нумерация строк
set nu
:nmap <C-N> :set invnumber<CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"call pathogen#infect()
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching
set scrolloff=3 " сколько строк внизу и вверху экрана показывать при скроллинге
set wrap " (no)wrap - динамический (не)перенос длинных строк
set linebreak " переносить целые слова
set matchpairs+=<:> " показывать совпадающие скобки для HTML-тегов
set autoread " перечитывать изменённые файлы автоматически
set confirm " использовать диалоги вместо сообщений об ошибках
set clipboard=unnamed " во избежание лишней путаницы использовать системный буфер обмена вместо буфера Vim
set history=128 " хранить больше истории команд
set undolevels=2048 " хранить историю изменений числом N
set pastetoggle=

"НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ КОДА (фолдинг)
set foldenable " включить фолдинг
set foldmethod=syntax " определять блоки на основе синтаксиса файла
set foldmethod=indent " определять блоки на основе отступов
set foldcolumn=5 " показать полосу для управления сворачиванием
set foldlevel=0 " Первый уровень вложенности открыт, остальные закрыты
set foldopen=all " автоматическое открытие сверток при заходе в них
set tags=tags\ $VIMRUNTIME/systags " искать теги в текущй директории и в указанной (теги генерируются ctags)
" Don't use Ex mode, use Q for formatting
map Q gq

"256 цветов
set t_Co=256

set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" Список используемых кодировок для автоматического их определения
set fileencodings=utf-8,koi8-r,cp1251,latin1,cp866

set iskeyword=@,a-z,A-Z,48-57,_,128-175,192-255

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"    set mouse=a
"endif


"set colorcolumn=80 "Показывать полосу ширины документа

filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,menu,longest

"ВКЛЮЧЕНИЕ АВТОДОПЛНЕНИЯ ВВОДА (omnifunct)
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType tt2html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType cpp set omnifunc=ccomplete#Complete
autocmd FileType pl set omnifunc=perlcomplete#Complete


au BufWinLeave *.* silent mkview " при закрытии файла сохранить 'вид'
au BufWinEnter *.* silent loadview " при открытии - восстановить сохранённый

"Удалять пустые пробелы на концах строк при открытии файла
"" Удалить пробелы в конце строк (frantsev)
"function! RemoveTrailingSpaces()
"   normal! mzHmy
"   execute '%s:\s\+$::ge'
"   normal! 'yzt`z
"endfunction
"autocmd BufEnter *.* :call RemoveTrailingSpaces()


"НАСТРОЙКИ ПОИСКА ТЕКСТА В ОТКРЫТЫХ ФАЙЛАХ
set ignorecase " ics - поиск без учёта регистра символов
set smartcase " - если искомое выражения содержит символы в верхнем регистре - ищет с учётом регистра, иначе - без учёта
set hlsearch " (не)подсветка результатов поиска (после того, как поиск закончен и закрыт)
set incsearch " поиск фрагмента по мере его набора
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on
    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!
        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78
        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \if line("'\"") > 1 && line("'\"") <= line("$") |
                    \exe "normal! g`\"" |
                    \endif
    augroup END
else
    set autoindent  "  always set autoindenting on
endif " has("autocmd")


"}}}

call plug#begin('~/.vim/plugged')


" git changes
Plug 'airblade/vim-gitgutter'
"Plug 'mhinz/vim-signify'

" change plugin
Plug 'chrisbra/changesPlugin'

" Find files
Plug 'kien/ctrlp.vim'

" Check syntax
Plug 'vim-syntastic/syntastic'

" Make sure you use single quotes
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options
Plug 'nsf/gocode', { 'tag': 'go.weekly.2012-03-13', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

Plug 'perl-support.vim'
let g:Perl_Perl = '/usr/bin/perl'
Plug 'vim-perl/vim-perl'
Plug 'jaxbot/semantic-highlight.vim'


" -+- xoria256

Plug 'vim-scripts/xoria256.vim'


"Plug 'joonty/vdebug'
"Plug 'vim-scripts/fencview.vim'
"Plug 'mattn/webapi-vim'
"Plug 'mattn/vdbi-vim'
Plug 'vim-scripts/dbext.vim'


" -+- netrw:

Plug 'ryan-cf/netrw'
let g:netrw_liststyle = 3
let g:netrw_banner    = 0

" -+- vim-airline

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='zenburn'
"let g:airline_enable_fugitive=1
"let g:airline_enable_syntastic=1
"let g:airline_enable_bufferline=1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
"let g:airline_linecolumn_prefix = '¶ '
"let g:airline_fugitive_prefix = '⎇ '
"let g:airline_paste_symbol = 'ρ'
let g:airline_section_c = '%t'
let g:airline_powerline_fonts = 1

" -+- vim-slime:

Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"

" -+- NeoComplete:

Plug 'Shougo/neocomplete'
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#force_overwrite_completefunc=1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

" -+- neosnippet:
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets', {'for': ['ruby', 'vim'] }
"Plug 'honza/vim-snippets'
let g:neosnippet#disable_runtime_snippets = { "_": 1, }
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" -+- Rainbow parentheses:

Plug 'vim-scripts/vim-niji'
 let g:niji_matching_filetypes = ['clojure', 'ruby']
 let g:niji_use_legacy_colours = 1

" -+- html/haml/slim/jade/css/sass/scss/less:

Plug 'tpope/vim-haml',            { 'for': ['haml']   }
Plug 'wavded/vim-stylus',         { 'for': ['stylus'] }
Plug 'groenewege/vim-less',       { 'for': ['less']   }
Plug 'digitaltoad/vim-jade',      { 'for': ['jade']   }
Plug 'slim-template/vim-slim',    { 'for': ['slim']   }
Plug 'othree/html5-syntax.vim',   { 'for': ['html']   }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss']   }

Plug 'hail2u/vim-css3-syntax',    { 'for': ['html','css'] }
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

Plug 'mattn/emmet-vim',           { 'for': ['html','xhtml','css','sass','scss','less'] }
au FileType html,css,sass,scss,less imap <expr><F4>     emmet#expandAbbrIntelligent("\<tab>")
au FileType html,css,sass,scss,less imap <expr>jk       emmet#expandAbbrIntelligent("\<tab>")
au FileType html                    imap <C-\>          <CR><CR><Esc>ki<Tab>

Plug 'kablamo/VimDebug'

" -+- tmux integration:

"if $COLORTERM == 'tmux'

    Plug 'wellle/tmux-complete.vim'

    " -+- tmux-navigator:

    Plug 'christoomey/vim-tmux-navigator'
    let g:tmux_navigator_no_mappings = 1
    nnoremap <silent> <C-a> <Left>  :TmuxNavigateLeft<cr>
    nnoremap <silent> <M-Down>  :TmuxNavigateDown<cr>
    nnoremap <silent> <M-Up>    :TmuxNavigateUp<cr>
    nnoremap <silent> <M-Right> :TmuxNavigateRight<cr>
    " nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

    " -+- tslime2:
    Plug 'tpope/timl'
    Plug 'sjl/tslime2.vim'
    let g:tslime_ensure_trailing_newlines = 1
    function! SendToTmuxStripped(text)
        call SendToTmux(substitute(a:text, '\v\n*$', '', ''))
"    endfunction
    endfunction
    nnoremap <buffer> <silent> <localleader>t :ConnectToTmux<cr>
    nnoremap <buffer> <silent> <localleader>l :call SendToTmuxRaw("")<cr>
    nnoremap <buffer> <silent> <localleader>] :let lisp_tslime_view = winsaveview()<cr>ggVG"ry:call SendToTmuxStripped(@r)<cr>:call winrestview(lisp_tslime_view)<cr>
    vnoremap <buffer> <silent> <localleader>[ :SendSelectionToTmux<cr>]))))

"endif

" -+- undotree:

Plug 'mbbill/undotree',    { 'on': 'UndotreeToggle' }
nnoremap <F3> :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir='~/.vim/.undodir/'
    set undofile
endif

" -+- Autopaste:

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
    set paste
      return ""
endfunction

" -+- Startify:

let g:startify_list_order    = ['sessions', 'bookmarks', 'files']
let g:startify_bookmarks     = ['~/.vimrc', '~/.gvimrc', '~/.bashrc','~/.zshrc']
let g:startify_custom_header = [
            \'                                    ',
            \'                                    ',
            \'    _|      _|  _|                  ',
            \'    _|      _|      _|_|_|  _|_|    ',
            \'    _|      _|  _|  _|    _|    _|  ',
            \'      _|  _|    _|  _|    _|    _|  ',
            \'        _|      _|  _|    _|    _|  ',
            \'                                    ',
            \'                                    ',
            \]
" -+- Substitute {motion} text with content of current register:

nnoremap <silent> S :set opfunc=PasteReplace<CR>g@
function! PasteReplace(type, ...)
    if a:0
        silent exe "normal! `<" . a:type . "`>p"
    elseif a:type == 'line'
        silent exe "normal! '[V']p"
    elseif a:type == 'block'
        silent exe "normal! `[\<C-V>`]p"
    else
        silent exe "normal! `[v`]p"
    endif
endfunction
nmap SS S$

" -+- vCoolor:

Plug 'vim-scripts/ConvertBase.vim'
Plug 'KabbAmine/vCoolor.vim'
let g:vcoolor_lowercase = 1
nmap <F7> :VCoolor<CR>
imap <F7> <Plug>vCoolorI

" -+- Sudo write:

noremap <leader>W :w !sudo tee %<CR>

Plug 'majutsushi/tagbar'
nnoremap <F2> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

Plug 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
let g:pymode = 1
let g:pymode_warnings = 0
let g:pymode_trim_whitespaces = 1
let g:pymode_run = 1
let g:pymode_run_bind = '<F9>'

let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_autoimport = 1
" документация
let g:pymode_doc = 1
let g:pymode_doc_bind = 'H'
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
let g:pymode_lint_on_fly = 1
let g:pymode_lint_cwindow = 1
" провека кода после сохранения
let g:pymode_lint_write = 1
" поддержка virtualenv
let g:pymode_virtualenv = 1
" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" отключить autofold по коду
let g:pymode_folding = 0
" возможность запускать код
let g:pymode_run = 1


"Plug 'davidhalter/jedi-vim'		" Jedi-vim autocomplete plugin
Plug 'mitsuhiko/vim-jinja'		" Jinja support for vim
Plug 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim)



call plug#end()



" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    let g:rehash256 = 1
    set background=dark
    colorscheme xoria256
    "colorscheme jellybeans
    set term=screen-256color
endif


" Автоматическое закрытие скобок
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>

" If some kind of C/C++ file is opened, check for Makefile and:
" - if file is present, bind F5 to make
" - if file is absent, bind F5 to "make without Makefile"
" In any case, if compilation wasn't successful, error list will be
" displayed
function! BindF5_C()
"http://habrahabr.ru/blogs/vim/40369/
    if filereadable("Makefile")
        set makeprg=make
        map <f5> :w<cr>:make<cr>:cw<cr>
        imap <f5> <esc>:w<cr>:make<cr>:cw<cr>
    else
        map <f5> :w<cr>:make %:r<cr>:cw<cr>
        imap <f5> <esc>:w<cr>:make %:r<cr>:cw<cr>
    endif
endfunction
au FileType c,cc,cpp,h,hpp,s call BindF5_C()
function! BindF9_C()
"http://habrahabr.ru/blogs/vim/40369/
    if filereadable("Makefile")
        set makeprg=make
        map <f9> :w<cr>:make<cr>:cw<cr>:!./%<<cr>
        imap <f9> <esc>:w<cr>:make<cr>:cw<cr>:!./%<<cr>
    else
        map <f9> :w<cr>:make %:r<cr>:cw<cr>:!./%<<cr>
        imap <f9> <esc>:w<cr>:make %:r<cr>:cw<cr>:!./%<<cr>
    endif
endfunction
au FileType c,cc,cpp,h,hpp,s call BindF9_C()

map       <F5>     :NERDTreeToggle<CR>


" Автозавершение слов по tab =)
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>

set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
menu Encoding.latin1 :e ++enc=latin1 ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>

