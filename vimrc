set nocompatible              " be iMproved, required  
filetype off                  " required

" set the runtime path to include Vundle and initialize  
set rtp+=~/.vim/bundle/vundle/  
call vundle#rc()  
" alternatively, pass a path where Vundle should install bundles  
"let path = '~/some/path/here'  
"call vundle#rc(path)

syntax on "开启语法高亮
filetype plugin indent on     " required  
" To ignore plugin indent changes, instead use:  
filetype plugin on

"seting
let mapleader=","
set number
set fileencodings=ucs-bom,utf-8,utf-16,gbk,default,latin1 
set ruler "显示当前的行号列号
set background=dark "为深色背景调整配色
set modeline "允许被编辑的文件以注释的形式设置选项

" 设置缩进,参考: http://linux-wiki.cn/wiki/zh-hans/Vim%E4%BB%A3%E7%A0%81%E7%BC%A9%E8%BF%9B%E8%AE%BE%E7%BD%AE
"set ci #开启cindent
set sw=4 "shiftwidth=4
set ts=4
set et
filetype indent on

"key mapping
:map <space> :CtrlPMRU <cr>
:map <C-E> :NERDTreeToggle <cr>

"设置自动补全
"set wildmenu
"set wildmode=longest:full
set completeopt+=longest "让vim的补全菜单行为与一般IDE一致
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 
"回车即选中当前项
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
let g:acp_completeoptPreview = 1 "AutoComplPop插件， 在补全处显示文档（预览）

"change to current path
"autocmd BufEnter * lcd %:p:h

"python
autocmd FileType python setlocal et sta sw=4 sts=4
" 禁止PyFlakes使用QuickFix，这样在按下<F7>时会调用flake8，而有对于代码编辑时的错误仍能得到有效的提示
let g:pyflakes_use_quickfix = 0

"plugin to install
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mattn/emmet-vim' 
Bundle 'terryma/vim-multiple-cursors'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/ZoomWin'
Bundle 'tpope/vim-surround'
Bundle 'jiangmiao/auto-pairs'
Bundle 'vim-scripts/numbered.vim'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'nvie/vim-flake8'
Bundle 'vim-scripts/pythoncomplete'
Bundle 'bling/vim-airline'

Bundle 'xvadim/open_plugin_page'
map <Leader>gh <Plug>OpenPluginPage


"vim-markdown
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'suan/vim-instant-markdown'
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0

"ctrlp配置
let g:ctrlp_custom_ignore = '\v[\/]target$'
