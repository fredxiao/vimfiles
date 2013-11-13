" https://github.com/fredxiao/vimfiles
" ============================================================================
" Author:Fred
" Date:2013.10.28
" ============================================================================
"
"
"
"
" ============================================================================
" Plugins included
" ============================================================================
" Pathogen
" Better Management of VIM plugins
"
" NERD Tree
"
" Pep8
" Check the code whether is pep-8 compliant
"
" PyFlakes
" Underlines and displays errors with Python on-the-fly
"
" Task List
" 追踪TODO项目
"
" Super Tab
" 得到以前输入过的符号列表，并通过tab键循环选择
"
" SnipMate
" 自动补全代码块
"
" Tag List and ctags.exe
" 显示程序代码中的对象，配合ctags.exe使用。
"
" Tagbar
" 类Tag List插件
"
" Rainbow Parentheses
" 显示彩虹色的括号
"
" Matchit
"
" Surround
"
" YankRing
"
"
" TODO(Fred):Pytest
" Runs your Python tests in Vim.
"
" TODO(Fred):Command-T
"
" TODO(Fred)Fugitive
" Interface with git from vim
"
"
"
" ============================================================================
" Shortcuts
" ============================================================================
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible     

" Define mapleader key is ',',default one is '\'
let mapleader = ","
let g:mapleader = ","

" <leader>ev to fast edit vimrc file,default is F5
nmap <silent> <leader>ev :e $MYVIMRC<CR>

" Easy window navigations
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" <leader>. to clear highlighted searches
nmap <silent> ,. :nohlsearch<CR>

" <leader>8 to Run PEP 8 compliant test
let g:pep8_map='<leader>8'
"let g:pyflakes_use_quickfix = 0 " Don't show it in quickfix window

" <leader>td to run Task List
map <leader>td <Plug>TaskList

" F2 or <tab> to trigger snippets,default is <tab>
ino <F2> <c-r>=TriggerSnippet()<cr>
snor <F2> <esc>i<right><c-r>=TriggerSnippet()<cr>

" F6 to toggle NERD Tree
map <F6> :NERDTreeToggle<CR>
imap <F6> <ESC>:NERDTreeToggle<CR>

" F7 to toggle Tag List
nnoremap <silent> <F7> :TlistToggle<CR>

" F9 to toggle Tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>

" F10 to run python codes
map <F10> :!python.exe %<CR>

" F12 to open/close GUI toolbar and menu
map <silent> <F12> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

" ==========================================================
" Pathogen - Allows us to organize our vim plugins
" ==========================================================
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" ============================================================================
" Basic Settings
" ============================================================================
"""Display on different OS
" define platform function MySys()
function! MySys()
  if has("gui_win32")
    return "windows"
  else
    return "linux"
  endif
endfunction

"define function SwitchToBuf(filename).base on www.easwy.com
"    function! SwitchToBuf(filename)
"        "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
"        " find in current tab
"        let bufwinnr = bufwinnr(a:filename)
"        if bufwinnr != -1
"            exec bufwinnr . "wincmd w"
"            return
"        else
"            " find in each tab
"            tabfirst
"            let tab = 1
"            while tab <= tabpagenr("$")
"                let bufwinnr = bufwinnr(a:filename)
"                if bufwinnr != -1
"                    exec "normal " . tab . "gt"
"                    exec bufwinnr . "wincmd w"
"                    return
"                endif
"                tabnext
"                let tab = tab + 1
"            endwhile
"            " not exist, new tab
"            exec "tabnew " . a:filename
"        endif
"    endfunction

" Fass edit vimrs
if MySys() == 'linux'
    "Fast reloading of the .vimrc
    map <silent> <leader>ss :source ~/.vimrc<cr>
    "Fast editing of .vimrc
    "map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>
    map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>
    "When .vimrc is edited, reload it
    autocmd! bufwritepost .vimrc source ~/.vimrc

    set langmenu=zh_CN.UTF-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8

elseif MySys() == 'windows'
    " Set helplang
    set helplang=cn
    "Fast reloading of the _vimrc
    "map <silent> <leader>ss :source ~/_vimrc<cr>
    map <silent> <leader>ss :source $VIM\vimfiles\vimrc<cr>
    "Fast editing of _vimrc
    "map <silent> <leader>ee :call SwitchToBuf("~/_vimrc")<cr>
    nmap <silent> <leader>ev :e $MYVIMRC<CR>
    "nmap <silent> <leader>ev :e $MYVIMRC<CR>
    "When _vimrc is edited, reload it
    "autocmd! bufwritepost _vimrc source ~/_vimrc
    autocmd! bufwritepost _vimrc source $VIM\vimfiles\vimrc
endif

" For windows version
if MySys() == 'windows'
    source $VIMRUNTIME/mswin.vim
    behave mswin

    "encoding
    set encoding=utf-8
    set termencoding=utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,chinese
    set langmenu=zh_CN.utf-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_cn.utf-8

    "full screen gvim
    "map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

endif

" GUI font and color
if has("gui_running")
	    if has("gui_gtk2")
		:set guifont=Inconsolata-dz\ Medium\ 12
		:set guifontwide=Yahei\ Mono\ 12
        colo molokai
	    elseif has("x11")
		" Also for GTK 1
		:set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
	    elseif has("gui_win32")
        :set guifont=Inconsolata-dz:h11.5:cANSI
        :set guifontwide=Yahei_Mono:h11.5:cGB2312
        colo molokai
	    endif
	endif


syntax on " syntax highlighing
filetype on " try to detect filetypes
filetype plugin indent on " enable loading indent file for filetype
set number " Display line numbers
set numberwidth=1 " using only 1 column (and 1 space) while possible
set ruler                               "
set title " show title in console title bar
set wildmenu " Menu completion in command mode on <Tab>
set wildmode=full " <Tab> cycles between all matching choices.

""" Moving Around/Editing
set cursorline " have a line indicate the cursor location
set ruler " show the cursor position all the time
set nostartofline " Avoid moving cursor to BOL when jumping around
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set scrolloff=3 " Keep 3 context lines above and below the cursor
set backspace=2 " Allow backspacing over autoindent, EOL, and BOL
set showmatch " Briefly jump to a paren once it's balanced
set nowrap " don't wrap text
set linebreak " don't wrap textin the middle of a word
set autoindent " always set autoindenting on
set smartindent " use smart indent if there is no indent file
set tabstop=4 " <tab> inserts 4 spaces
set shiftwidth=4 " but an indent level is 2 spaces wide.
set softtabstop=4 " <BS> over an autoindent deletes both spaces.
set expandtab " Use spaces, not tabs, for autoindent/tab key.
set shiftround " rounds indent to a multiple of shiftwidth
set matchpairs+=<:> " show matching <> (html mainly) as well
set foldmethod=indent " allow us to fold on indents
set foldlevel=99 " don't fold by default

""" Searching and Patterns
set ignorecase smartcase " when serching,is all 'a',ignore diff 'a'&'A'
                         " if key any 'A',must consider the diff 'a'&'A'.
                         " simple idea, great achievement!
set smarttab
set hlsearch " highlight search terms
set incsearch " show search matches as you type

""" Status Line 
set laststatus=1
set statusline=                       
set statusline+=[%Y                     "file type
set statusline+=/%{&encoding}           "encoding
set statusline+=/%{&fileformat}]        "file format
set statusline+=\ \ \%<%F%h%m%r%=%b
set statusline+=\ \0x%B                 "char hex value
set statusline+=\ \ \%=%-10.(%l,%c%V%)
set statusline+=\ %p%%/%L               "% of total rows/total rows

"set statusline=
"set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\%w\\
"set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\%f
"set statusline=%({CurDir()}%)\%f           "current dir
"set statusline+=%2*%-3.3n%0* " buffer number
"set statusline+=%h%1*%m%r%w%0* " flag
"set statusline+=%= " right align
"set statusline+=%2*0x%-8B " current char


set nobackup " cancel auto backup
set noswapfile " cancel swapfile







set showcmd                             "show incomplete cmds down the bottom
set showmode                            "show current mode down the bottom
set showmatch                           "
set history=1000                        "remember more commands and search history
set undolevels=1000                     "use many muchos levels of undo
"set wrap                                "auto wrap lines
set equalalways                         "when split window,keep the same width/height
set clipboard=unnamed                   "yank to the system register (*) by default





"auto wrap lines by 100 english words/50 chinese words
"For exsiting text,key "gq" to wrap
"set tw=79 fo+=Mm                       

" Remove trailing whitespace when writing a buffer, but not for diff files.
" From: Vigil
"    function RemoveTrailingWhitespace()
"        if &ft != "diff"
"            let b:curcol = col(".")
"            let b:curline = line(".")
"            silent! %s/\s\+$//
"            silent! %s/\(\s*\n\)\+\%$//
"            call cursor(b:curline, b:curcol)
"        endif
"    endfunction
"    autocmd BufWritePre * call RemoveTrailingWhitespace()

set lines=35                            "lines on window
set columns=170                         "columns on window
winpos 3 255                            "set widow position,refer to topleft,unit is px

"maximize GUI window
"autocmd GUIEnter * simalt ~x

"underline the word of colume 80 for specified files,such as *.c,*.cpp and etc
au BufRead,BufNewFile *.c,*.cpp,*.py,*.txt 2match Underlined /.\%81v/

set guioptions-=m                       "'+'/'-"keep/remove GUI menu
set guioptions-=T                       "'+'/'-"keep/remove GUI toolbar
set guioptions-=r                       "'+'/'-"keep/remove GUI right scrollbar
set guioptions-=L                       "'+'/'-"keep/remove GUI left scrollbar




"Ê¹ÓÃ¿ÕžñŒüÀŽ¿ª¹ØÕÛµþ
set foldenable                          "fdmÊÇfoldmethodÃüÁîµÄŒò»¯
"set foldmethod=indent
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>





function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction


" ============================================================================
" Plug-in Settings
" ============================================================================
" MiniBufExplorer
let g:miniBufExplMapCTabSwitchBufs=1    "<C-Tab> to switch tabs
let g:miniBufExplMapWindowsNavVim=1     "<C-h,j,k,l> to switch windows
let g:miniBufExplMapWindowNavArrows=1   "<C-arrow key> to switch windows
let g:miniBufExplModSelTarget=0         "Modifiable Select Target
"let g:miniBufExplorerMoreThanOne=0     "to solve multi windows issue


" NERD Tree
let NERDTreeShowBookmarks=1             "show bookmark
let NERDChristmasTree=1                 "beautifull tree
let NERDTreeShowLineNumbers=1           "show line numbers
let NERDTreeWinPos="right"              "set window position
let NERDTreeWinSize=25                  "set window width


" Yankring
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>


" Indent Guide"
let g:indent_guides_guide_size=1        "<mapleader>ig to use it


" TagList
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"tags
"set tags=e:\Dropbox\Src\ODMTestAutomation_novss\release\


" Tagbar
let g:tagbar_left = 1 "设置tagbar在左边显示
let g:tagbar_width = 30 " 设置显示宽度 
let g:tagbar_sort = 0 " 设置按顺序显示，不按名字字母排序


" Rainbow Parentheses
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound " ()
au Syntax * RainbowParenthesesLoadSquare " []
au Syntax * RainbowParenthesesLoadBraces " {} 
au Syntax * RainbowParenthesesLoadChevrons " <>
