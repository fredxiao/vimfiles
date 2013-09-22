"Start fred's personal configuration from here
"Author:Fred
"Date:2012.07.09
"----------------------------------------------------------

"Use pathogen to easily modify the runtime path to include all
"plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()                  

"use Vim settings, rather then Vi settings (much better!).
"this must be first, because it changes other options as a side effect.
set nocompatible                        

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

"Fass edit vimrs
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
    map <silent> <leader>ss :source $VIM\_vimrc<cr>
    "Fast editing of _vimrc
    "map <silent> <leader>ee :call SwitchToBuf("~/_vimrc")<cr>
    nmap <silent> <leader>ev :e $MYVIMRC<CR>
    "nmap <silent> <leader>ev :e $MYVIMRC<CR>
    "When _vimrc is edited, reload it
    "autocmd! bufwritepost _vimrc source ~/_vimrc
    autocmd! bufwritepost _vimrc source $VIM\_vimrc
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
    map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

endif

"GUI font and color
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

filetype on                             "
syntax enable                           "
syntax on
filetype plugin on

set number                              "show line number
set ruler                               "
set nobackup                            "cancel auto backup
set noswapfile                          "cancel swapfile
set hlsearch                            "highlight search terms
set incsearch                           "show search matches as you type
set smarttab
set tabstop=4                           "
set softtabstop=4
set shiftwidth=4                        "
set expandtab
set autoindent                          "
set smartindent                         "
set showcmd                             "show incomplete cmds down the bottom
set showmode                            "show current mode down the bottom
set showmatch                           "
set history=1000                        "remember more commands and search history
set undolevels=1000                     "use many muchos levels of undo
"set wrap                                "auto wrap lines
set equalalways                         "when split window,keep the same width/height
set wildmenu                            "
set clipboard=unnamed                   "yank to the system register (*) by default

"when serching,is all 'a',ignore diff 'a'&'A'
"if key any 'A',must consider the diff 'a'&'A' 
"simple idea, great achievement!
set ignorecase smartcase


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

"'F2'to open/close GUI toolbar and menu
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

"define mapleader key is ',',default one is '\'
let mapleader = ","
let g:mapleader = ","

"fast edit vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>

"Ê¹ÓÃ¿ÕžñŒüÀŽ¿ª¹ØÕÛµþ
set foldenable                          "fdmÊÇfoldmethodÃüÁîµÄŒò»¯
"set foldmethod=indent
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


"status line 
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


"Easy window navigations
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"clear highlighted searches
nmap <silent> ,. :nohlsearch<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"MiniBufExplorer
let g:miniBufExplMapCTabSwitchBufs=1    "<C-Tab> to switch tabs
let g:miniBufExplMapWindowsNavVim=1     "<C-h,j,k,l> to switch windows
let g:miniBufExplMapWindowNavArrows=1   "<C-arrow key> to switch windows
let g:miniBufExplModSelTarget=0         "Modifiable Select Target
"let g:miniBufExplorerMoreThanOne=0     "to solve multi windows issue

"NERD Tree
map <F5> :NERDTreeToggle<CR>
imap <F5> <ESC>:NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1             "show bookmark
let NERDChristmasTree=1                 "beautifull tree
let NERDTreeShowLineNumbers=1           "show line numbers
let NERDTreeWinPos="right"              "set window position
let NERDTreeWinSize=25                  "set window width

"Yankring
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

"Indent Guide"
let g:indent_guides_guide_size=1        "<mapleader>ig to use it


"TagList
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"tags
set tags=e:\Dropbox\Src\ODMTestAutomation_novss\release\
