" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
" Modified by: Steve Losh <steve@stevelosh.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
" Fred just remove all italic at 2011.12.03 and name the color as molokai4

hi clear

set background=dark
let g:colors_name="molokai4"

" Basic Layout {{{
hi Normal          guifg=#F8F8F2 guibg=#1B1E1F
hi Folded          guifg=#666666 guibg=bg                                       "用于关闭的折叠的行
hi CursorLine                    guibg=#232728                                  "置位'cursorline'时,光标所在的屏幕行
hi CursorColumn                  guibg=#232728                                  "置位'cursorcolumn'时,光标所在的屏幕列
hi ColorColumn                   guibg=#232728                                       "用于'colorcolumn'设置的列
hi LineNr          guifg=#AAAAAA guibg=bg                                       "":number" 和 ":#" 命令与置位 'number' 或 'relativenumber' 选项时的行号，
hi FoldColumn      guifg=#AAAAAA guibg=bg                                       "Fred:见help 'foldcolumn'
hi VertSplit       guifg=#AAAAAA guibg=bg gui=none                              "分离垂直分割窗口的列
hi Search          guifg=#000000 guibg=#E4E500                                  "最近搜索模式的高亮 (见 'hlsearch')。也用于 quickfix 当前行的
		                                                                        "高亮和其它类似的要突出显示的项目。
hi IncSearch       guibg=#000000 guifg=#FF8D00                                  "'incsearch' 高亮；也用于被 ":s///c" 替换的文本
" }}}
" Syntax {{{
hi Boolean         guifg=#AE81FF                                                "布尔型常数:TRUE,false
hi Comment         guifg=#5c7176                                                "任何注释
hi Character       guifg=#E6DB74                                                "字符常数:'c','\n'
hi Number          guifg=#AE81FF                                                "数值常数:234,0xff
hi String          guifg=#E6DB74                                                "字符串常数:"这是字符串"
hi Conditional     guifg=#F92672                                                "if,then,else,endif,switch等
hi Constant        guifg=#AE81FF                                                "任何常数
hi Debug           guifg=#BCA3A3               gui=bold                         "调试语句
hi Define          guifg=#66D9EF                                                "预处理命令 #define
hi Delimiter       guifg=#8F8F8F                                                "需要注意的字符
hi Float           guifg=#AE81FF                                                "浮点常数:2.3e10
hi Function        guifg=#A6E22E                                                "函数名(也包括:类的方法名)
hi Identifier      guifg=#FD971F                                                "任何变量名
" }}}
" Diffs {{{
hi DiffAdd                       guibg=#0F1D0B                                  "diff 模式: 增加的行 |diff.txt|
hi DiffChange      guifg=#89807D guibg=#322F2D                                  "diff 模式: 改变的行 |diff.txt|
hi DiffDelete      guifg=#960050 guibg=#1E0010                                  "diff 模式: 删除的行 |diff.txt|
hi DiffText                      guibg=#4A4340 gui=bold                  "diff 模式: 改变行里的改动文本 |diff.txt|
" }}}
" Cursor {{{
hi Cursor          guifg=#000000 guibg=#F35FBC                                  "光标所在的字符
hi iCursor         guifg=#000000 guibg=#FDFF00
hi vCursor         guifg=#000000 guibg=#AAF412
" }}}

hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=#FFFFFF guibg=#604A8C
hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=#FFFFFF guibg=#C50048

hi EasyMotionTarget guifg=#E4E500 guibg=bg gui=bold
hi EasyMotionShade guifg=#444444 guibg=bg gui=bold
hi Directory       guifg=#A6E22E                                        "目录名 (还有列表里的其它特殊名字)
hi Error           guifg=#960050 guibg=#1E0010                                  "有错的构造
hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold                         "命令行上的错误信息
hi Exception       guifg=#A6E22E                                        "try,catch,throw
hi Ignore          guifg=#808080 guibg=bg                                       "留空,被隐藏 hl-Ignore

hi Keyword         guifg=#F92672                                        "其他关键字
hi Label           guifg=#E6DB74               gui=none                         "case,default等
hi Macro           guifg=#C4BE89                                      "同 Define
hi SpecialKey      guifg=#66D9EF                                      "":map" 列出的 Meta 和特殊键，也包括文本里不可显示字符的显示和
		                                                                        "'listchars'。
		                                                                        "一般的: 和实际内容显示上有差异的文本。

hi MatchParen      guifg=#E4E400 guibg=#232728 gui=bold                         "如果光标所在或刚刚在它之前的字符是配对的括号一部分的话，它和它的配对。
hi ModeMsg         guifg=#E6DB74                                                "'showmode' 消息 (例如，"-- INSERT --")
hi MoreMsg         guifg=#E6DB74                                                "Fred:见help more-prompt
hi Operator        guifg=#F92672                                                ""sizeof","+","*"等

" Completion Menu {{{
hi Pmenu           guifg=#cccccc guibg=#232728                                  "弹出菜单:普通项目
hi PmenuSel        guifg=#000000 guibg=#AAF412                                  "弹出菜单:选中项目
hi PmenuSbar                     guibg=#131414                                  "弹出菜单:滚动条
hi PmenuThumb      guifg=#777777                                                "弹出菜单:滚动条的拇指
" }}}

hi PreCondit       guifg=#A6E22E                                        "预处理命令 #if,#else,#endif等
hi PreProc         guifg=#A6E22E                                                "通用预处理命令
hi Question        guifg=#66D9EF                                                "Fred:|hit-enter| 提示和 yes/no 问题
hi Repeat          guifg=#F92672                                        "for,do,while等

" marks column
hi SignColumn      guifg=#A6E22E guibg=#151617                                  "Fred:显示signs的列
hi SpecialChar     guifg=#F92672               gui=bold                         "常数中的特殊字符
hi SpecialComment  guifg=#465457               gui=bold                         "注释里的特殊部分
hi Special         guifg=#66D9EF guibg=bg                             "任何特殊符号
hi SpecialKey      guifg=#888A85                                      "同上
hi Statement       guifg=#F92672               gui=bold                         "任何语句
hi StatusLine      guifg=#CD5907 guibg=fg                                       "当前窗口的状态行
hi StatusLineNC    guifg=#808080 guibg=#080808                                  "非当前窗口的状态行
		                                                                        "注意: 如果等于 "StatusLine"，Vim 会使用 "^^^" 指示当前窗口的状态行。
hi StorageClass    guifg=#FD971F                                      "static,register,volatile等
hi Structure       guifg=#66D9EF                                                "struct,union,enum等
hi Tag             guifg=#F92672                                      "可以使用 CTRL-]的项目
hi Title           guifg=#ef5939                                                "":set all"、":autocmd" 等输出的标题
hi Todo            guifg=#FFFFFF guibg=bg      gui=bold                         "需要特殊注意的部分:主要是关键字 TODO FXME 和XXX

hi Typedef         guifg=#66D9EF                                                "typedef定义
hi Type            guifg=#66D9EF               gui=none                         "int,long,char等
hi Underlined      guifg=#808080               gui=underline                    "需要突出的文本,HTML链接

hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold                         "警告消息
hi WildMenu        guifg=#66D9EF guibg=#000000                                  "Fred:'wildmenu'补全的当前配置

hi MyTagListFileName guifg=#F92672 guibg=bg gui=bold                            "TagList的文件名

" Spelling {{{
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl                                  "拼写检查器不能识别的单词。|spell|
		                                                                        "它会和本来应该使用的高亮进行组合。
    hi SpellCap    guisp=#7070F0 gui=undercurl                                  "应该大写字母开头的单词。|spell|
		                                                                        "它会和本来应该使用的高亮进行组合。
    hi SpellLocal  guisp=#70F0F0 gui=undercurl                                  "拼写检查器能识别但只在其它区域使用的单词。|spell|
		                                                                        "它会和本来应该使用的高亮进行组合。
    hi SpellRare   guisp=#FFFFFF gui=undercurl                                  "拼写检查器能识别但很少使用的单词。|spell|
		                                                                        "它会和本来应该使用的高亮进行组合。
endif
" }}}
" Visual Mode {{{
hi VisualNOS  guibg=#403D3D                                                     "Vim 是 "选择区的非拥有者" 时，可视模式的选择区。只有 X11 GUI
		                                                                        "的 |gui-x11| 和 |xterm-clipboard| 才提供此支持
hi Visual     guibg=#403D3D                                                     "可视模式的选择区
" }}}
" Invisible character colors {{{
highlight NonText    guifg=#444444 guibg=bg                                     "窗口尾部的 '~' 和 '@'，'showbreak' 的字符和其它在文本里实际不
		                                                                        "存在的字符 (例如，代替行尾放不下的双宽字符而显示的 ">")。
highlight SpecialKey guifg=#444444 guibg=bg                                     "同上
" }}}

" Support for 256-color terminals {{{
if &t_Co > 255
   hi Boolean         ctermfg=135
   hi Character       ctermfg=144
   hi Number          ctermfg=135
   hi String          ctermfg=144
   hi Conditional     ctermfg=161               cterm=bold
   hi Constant        ctermfg=135               cterm=bold
   hi Cursor          ctermfg=16  ctermbg=253
   hi Debug           ctermfg=225               cterm=bold
   hi Define          ctermfg=81
   hi Delimiter       ctermfg=241

   hi DiffAdd                     ctermbg=24
   hi DiffChange      ctermfg=181 ctermbg=239
   hi DiffDelete      ctermfg=162 ctermbg=53
   hi DiffText                    ctermbg=102 cterm=bold

   hi Directory       ctermfg=118               cterm=bold
   hi Error           ctermfg=219 ctermbg=89
   hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
   hi Exception       ctermfg=118               cterm=bold
   hi Float           ctermfg=135
   hi FoldColumn      ctermfg=67  ctermbg=233
   hi Folded          ctermfg=67  ctermbg=233
   hi Function        ctermfg=118
   hi Identifier      ctermfg=208
   hi Ignore          ctermfg=244 ctermbg=232
   hi IncSearch       ctermfg=193 ctermbg=16

   "hi Keyword         ctermfg=161               cterm=bold
   hi Keyword         ctermfg=161
   hi Label           ctermfg=229               cterm=none
   hi Macro           ctermfg=193
   hi SpecialKey      ctermfg=81
   hi MailHeaderEmail ctermfg=3  ctermbg=233
   hi MailEmail       ctermfg=3  ctermbg=233

   hi MatchParen      ctermfg=16  ctermbg=208 cterm=bold
   hi ModeMsg         ctermfg=229
   hi MoreMsg         ctermfg=229
   hi Operator        ctermfg=161

   " complete menu
   hi Pmenu           ctermfg=81  ctermbg=16
   hi PmenuSel                    ctermbg=244
   hi PmenuSbar                   ctermbg=232
   hi PmenuThumb      ctermfg=81

   hi PreCondit       ctermfg=118               cterm=bold
   hi PreProc         ctermfg=118
   hi Question        ctermfg=81
   hi Repeat          ctermfg=161               cterm=bold
   hi Search          ctermfg=253 ctermbg=66

   " marks column
   hi SignColumn      ctermfg=118 ctermbg=235
   hi SpecialChar     ctermfg=161               cterm=bold
   hi SpecialComment  ctermfg=245               cterm=bold
   hi Special         ctermfg=81  ctermbg=232
   hi SpecialKey      ctermfg=245

   hi Statement       ctermfg=161               cterm=bold
   hi StatusLine      ctermfg=238 ctermbg=253
   hi StatusLineNC    ctermfg=244 ctermbg=232
   hi StorageClass    ctermfg=208
   hi Structure       ctermfg=81
   hi Tag             ctermfg=161
   hi Title           ctermfg=166
   hi Todo            ctermfg=231 ctermbg=232   cterm=bold

   hi Typedef         ctermfg=81
   hi Type            ctermfg=81                cterm=none
   hi Underlined      ctermfg=244               cterm=underline

   hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
   hi VisualNOS                   ctermbg=238
   hi Visual                      ctermbg=235
   hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
   hi WildMenu        ctermfg=81  ctermbg=16

   hi Normal          ctermfg=252 ctermbg=233
   hi Comment         ctermfg=59
   hi CursorLine                  ctermbg=234   cterm=none
   hi CursorColumn                ctermbg=234
   hi ColorColumn                 ctermbg=234
   hi LineNr          ctermfg=250 ctermbg=233
   hi NonText         ctermfg=240 ctermbg=233
end " }}}
