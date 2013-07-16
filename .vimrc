syntax enable
set number
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"---------------------ctags----------------------------------------------
set tags=$WORKDIR/tags
set tags+=$HOME/tags
set tags+=/usr/include/tags
set path+=$WORKDIR/incl/

"---------------------vim------------------------------------------------
au BufNewFile,BufRead *.c,*.ec,*.sqc set filetype=c


"================ Tlist设置信息==========================================
let Tlist_Show_One_File = 1 
let Tlist_Exit_OnlyWindow = 1 "如果 taglist 窗口是最后一个窗口，则退出 vim。
let Tlist_Use_Left_Window = 1 "在右侧窗口中显示 taglist 窗口。
let Tlist_Auto_Open=1 "在启动 vim 后，自动打开 taglist 窗口。
let Tlist_File_Fold_Auto_Close=1 "taglist 只显示当前文件 tag，其它文件的tag折叠。

" ---------------------------------------
" FileName   :  .vimrc
" Function   :  设置vim代码编辑器
" LastChange :  2011.10.25 11:08:55
"----------------------------------------
"
imap <F2> <Esc>:set nu<CR>
nmap <F2> <Esc>:set nu<CR>
imap <F3> <Esc>:set nonu<CR>
nmap <F3> <Esc>:set nonu<CR>
imap <F4> <Esc>:TlistOpen<CR>
nmap <F4> <Esc>:TlistOpen<CR>
imap <F5> <Esc>:TlistClsoe<CR>
nmap <F5> <Esc>:TlistClose<CR>

" 添加程序文件主题信息, 按下F9添加... 
function MyTitle()
call setline(1, "/* ---------------------------------------")
call append(line("."), " * Copyright(C)2006 - 2013 ")
call append(line(".")+1, " * FileName  :  ".expand("%"))
call append(line(".")+2, " * CreateInfo:  LinQili@".strftime(" %Y.%m.%d %T"))
call append(line(".")+3, " * ---------------------------------------")
call append(line(".")+4, " * $Revision$")
call append(line(".")+5, " * $Log$")
call append(line(".")+6, " * ---------------------------------------*/")
call append(line(".")+7, " ")
let  fn=expand("%")
let  hlen=strlen(fn)
if   fn[hlen-1]=="h"
let  ffname=substitute(toupper(expand("%")), '\.H', "_H_", "g")
call append(line(".")+8, "#ifndef _".ffname)
call append(line(".")+9, "#define _".ffname)
call append(line(".")+10, " ")
call append(line(".")+11, "#endif /*  _".ffname." */")
endif
endf
imap <F9> <Esc>:call MyTitle()<CR>

" 添加函数注释信息，按下F7添加...
function MyFunComment()
call append(line("."), "/* ")
call append(line(".")+1, " * 功  能:   ")
call append(line(".")+2, " * 输  入:   ")
call append(line(".")+3, " * 输  出:   ")
call append(line(".")+4, " * 返回值:   ")
call append(line(".")+5, " */")
endf
imap <F7> <Esc>:call MyFunComment()<CR>


"set t_Co=256
let g:solarized_degrade=1
colorscheme solarized
let g:solarized_termtrans=1
set background="dark"
"let g:solarized_bold=1
"let g:solarized_contrast="high"
"let g:solarized_termcolors=256

