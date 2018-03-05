"设置行号
set nu
"设置bundle插件管理,具体插件看~/.vimrc.bundles
if filereadable(expand("~/.vimrc.bundles"))
	source ~/.vimrc.bundles
endif

"用来配置vim下的颜色字体等基本操作,没哟涉及到插件
set background=dark
set t_Co=256
colorscheme molokai
set showmatch
set ruler
set cursorline
set incsearch
set guifont=Courier_new:h20:b:cDEFAULT


"命令插件,\+r直接运行命令
nnoremap <Leader>r :RunInInteractiveShell<space>

"********************************************************************************************************************
"目录插件,按F5可以直接调出目录
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
" " Open a NERDTree打开用F5进行打开
nmap <F5> :NERDTreeToggle<cr>  

"******************************************************************************************************************
"tarbar插件,简单方式浏览文件结构
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>
"这里注意,可能会出现ctags不能出现,可以在终端直接进行安装
"sudo apt-get install ctags
"********************************************************************************************************************
" Highlight current line
" 这里是用来标注光标行和列的地方,可以更加可视化
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

"********************************************************************************************************************
"设置git插件,显示git的相关信息
set laststatus=2 " Always display the status line
set statusline+=%{fugitive#statusline()} "  Git Hotness
let g:signify_vcs_list = [ 'git', 'hg' ]
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
"快捷键 解释 :Git [args] 类似执行git命令一样 :Gstatus 类似git
"status.在列表中使用-添加/移除文件 :Gcommit [args] 类似 git commit :Gmerge
"[args] 类似 git merge :Gpull [args] 类似 git pull :Gpush [args] 类似 git push
":Gvdiff [revision] 类似 git push 但是会切分窗口
"更多详细的操作可以使用 :help fugitive
"Tag支持

"********************************************************************************************************************
"you copleteme 插件配置
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
"TouCompleteMe的详细配置过程
"用插件管理器vundle下载好了之后,开始进行配置
"所有插件的根目录都是在~/.vim/bundle/中,此插件就是在~/.vim/bundle/YouConpleteMe中
"首先创建一个文件夹来存放编译过程产生的文件,不然会使文件夹显得比较冗余和混乱
"第一步
"mkdir ~/.ycm_build       cd ~/.ycm_build
"第二步
"生成makefile文件
"cmake -G Unix Makefiles -DUSE_SYSTEM_BOOST=ON DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
"这里注意,Unix Makefiles打双引号
"第三步
"构建ycm-core  输入命令cmake --build . --target ycm_core --config Release
"第四步,配置文件
"cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim/
"第五步,~/.vimrc中添加文件
"let g:ycm_server_python_interpreter='/usr/bin/python'
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

"************************************************************************************************************
"















