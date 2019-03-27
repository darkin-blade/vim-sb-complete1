" 全部匹配的单词
let g:sbcom1_matched = []
" 算进单词的部分,不包括中文字符
let g:sbcom1_isword = ""
" 不算进单词的部分
let g:sbcom1_issplit = ""

if (exists('g:sbcom1_active')&&(g:sbcom1_active != 0)) " 启动插件
  if (exists('g:sbcom1_trigger')) " 有自定义按键
    au BufEnter * execute("inoremap ".g:sbcom1_trigger." <c-r>=sbcom1#find()<cr>")
  else " 没有自定义按键
    au BufEnter * execute("inoremap <tab> <c-r>=sbcom1#find()<cr>")
  endif
  au BufEnter * call sbcom1#isword()
endif

" 关闭插件
command! SbCom3Off call Sbcom1Toggle(0)
" 开启插件
command! SbCom3On call Sbcom1Toggle(1)

fun! Sbcom1Toggle(para)
  if (a:para == 0) " 关闭插件
    if (exists('g:sbcom1_trigger')) " 有自定义按键
      execute("iunmap ".g:sbcom1_trigger)
    else " 没有自定义按键
      execute("iunmap <tab>")
    endif
  else
    if (exists('g:sbcom1_trigger'))
      execute("inoremap ".g:sbcom1_trigger." <c-r>=sbcom1#find()<cr>")
    else
      execute("inoremap <tab> <c-r>= sbcom1#find()<cr>")
    endif
  endif
endfun