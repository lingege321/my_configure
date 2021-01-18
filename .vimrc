call plug#begin('~/.vim/plugged')
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'morhetz/gruvbox'
"Plug 'majutsushi/tagbar' " awesome tags window
"Plug 'sickill/vim-monokai'
Plug 'rust-lang/rust.vim' " rust lang
Plug 'tomasiser/vim-code-dark'
"Plug 'scrooloose/nerdtree' "nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'universal-ctags/ctags' "ctag -R *
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhartington/oceanic-next'
Plug 'bronson/vim-trailing-whitespace' "highlight the whitespace at trail :FixWhiteSpace to remove the white space
Plug 'easymotion/vim-easymotion'    "quick jump  syntax \w \b \jklh \s
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive' " gv.vim
Plug 'junegunn/gv.vim'    " gv.vim https://github.com/junegunn/gv.vim
"Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi'
Plug 'w0rp/ale'  "need nerd font/ reference: https://github.com/ryanoasis/nerd-fonts
Plug 'scrooloose/nerdcommenter'  " auto add comment
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf.vim'
Plug 'zxqfl/tabnine-vim'
if v:version >= 704
   Plug 'SirVer/ultisnips'    "map functional
   Plug 'honza/vim-snippets'
   Plug 'andymass/vim-matchup'
   "Plug 'myusuf3/numbers.vim'
   "Plug 'vimwiki/vimwiki'
endif
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
"Plug 'ryanoasis/powerline-extra-symbols'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'majutsushi/tagbar'  need 7.3.1058 version
call plug#end()
" nerd font reference : https://github.com/ryanoasis/nerd-fonts/blob/master/readme_tw.md#combinations
"Plug 'google/vim-colorscheme-primary'
"Plug 'flazz/vim-colorschemes'
"Plug 'cocopon/iceberg.vim'
"Plug 'tomasr/molokai'
"Plug 'KeitaNakamura/neodark.vim'
"Plug 'jacoborus/tender.vim'
"Plug 'viatsko/awesome-vscode'
"Plug 'google/vim-colorscheme-primary'
"Plug 'rainglow/jetbrains'
"Plug 'altercation/solarized'
"Plug 'ErichDonGubler/vim-sublime-monokai'
"Plug 'crusoexia/vim-monokai'
"Plug 'Valloric/YouCompleteMe'
"Plug 'rdnetto/YCM-Generator'
"Plug 'vim-scripts/taglist.vim'
"Plug 'eugeii/consolas-powerline-vim'
"Plug 'powerline/powerline'
"Plug 'powerline/fonts'
"Plug 'junegunn/fzf' ,{ 'dir': '~/.fzf', 'do': './install --all' } "fuzzy finder
"Plug 'junegunn/goyo.vim'



set nocompatible
filetype plugin indent on
set wildmode=list:longest
set encoding=utf-8
set nonu
syntax on
set mouse=a
set scrolloff=4
set cursorline
set formatoptions+=r   "註解的下一行 "不要"自動註解
set ruler
set cindent
set sw=4
set expandtab
set tabstop=4
set incsearch
set shiftwidth=4
set backspace=2
set autoindent    " always set autoindenting on
set smartindent
set hidden          "for buffer
set clipboard=unnamedplus
au BufNewFile,BufRead *.cu      set ft=cuda
au BufNewFile,BufRead *.cuh     set ft=cuda
au BufNewFile,BufRead *.c       set ft=cpp
au BufNewFile,BufRead *.cpp     set ft=cpp
au BufNewFile,BufRead *.h       set ft=cpp
au BufNewFile,BufRead *.hpp     set ft=cpp
au BufNewFile,BufRead *.rs      set ft=rust
au BufNewFile,BufRead *.toml    set ft=toml
au BufNewFile,BufRead *.cir     set ft=spice
au BufNewFile,BufRead *cshrc    set ft=csh
au BufNewFile,BufRead *zshrc    set ft=zsh
au BufNewFile,BufRead *.svg     set ft=svg
au BufNewFile,BufRead *.log     set ft=cerr
au BufNewFile,BufRead .hlcolor* set ft=vim
au BufNewFile,BufRead *.svg     set ft=svg
au BufNewFile,BufRead *.log     set ft=cerr
au BufNewFile,BufRead .hlcolor* set ft=vim
au BufNewFile,BufRead *.rs      :setlocal tags=./rusty-tags.vi;/
augroup EditVim
   autocmd!
   autocmd FileType make setlocal noexpandtab
   autocmd FileType cpp    source ~/.vim/.vimrc_cpp
   autocmd FileType rust    source ~/.vim/.vimrc_cpp
   autocmd FileType cuda   source ~/.vim/.vimrc_cpp
   autocmd FileType python source ~/.vim/.vimrc_py
augroup END

set t_Co=256

"set background=dark
""colorscheme molokai
""colorscheme gruvbox
""colorscheme iceberg
"colorscheme tender
"colorscheme codedark
"colorscheme primary
"colorscheme neodark
set history=50    " keep 50 lines of command line history
set hlsearch
set cindent    "use c language indent
set foldmethod=indent   "fold the indent
hi Folded ctermfg=gray ctermbg=black

"""""""""""""""""
"fuzzy finder fzf
"""""""""""""""""
set rtp+=~/.fzf

map <F2>       <ESC>:NERDTree<CR>
map <F3>       <ESC>:NERDTreeClose<CR>
map <F6>       <ESC>:!ctags -R *<CR>
map <C-Left>   <ESC>:vertical res -3<CR>
map <C-Right>  <ESC>:vertical res +3<CR>
map <C-Up>     <ESC>:res +3<CR>
map <C-Down>   <ESC>:res -3<CR>
map <Leader>   <Plug>(easymotion-prefix)
map <Leader>q  <Plug>(easymotion-w)
map <Leader>h  <Plug>(easymotion-linebackward)
map <Leader>l  <Plug>(easymotion-lineforward)
map <Leader>.  <Plug>(easymotion-repeat)
xmap <Leader>a <Plug>(EasyAlign))
"yank to clipbloar
nnoremap <C-c> 0wv$<Left>"+y<Esc>0wv$<Left>"*y
"vnoremap <C-c> '+y<Esc>'*y 
vmap <C-c> :w! ~/.vimbuffer \| !cat ~/.vimbuffer \| clip.exe <CR><CR>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
vnoremap //    I//<Esc>
nnoremap be    bvey0/<C-r>0<CR>
nnoremap bn    :bn<CR>
nnoremap bp    :bp<CR>

"*****************************************************************************************"
" neodark.vim
"*****************************************************************************************"
"let g:neodark#background = '#202020'
"let g:neodark#use_256color = 1

"*****************************************************************************************"
if !exists('g:airline_symbols')
   let g:airline_symbols={}
endif
"for airline
"set status line"
set laststatus=2
"enable powerline-fonts"
let g:airline#extensions#tabline#buffer_nr_show = 1
"enable tabline"
let g:airline#extensions#tabline#enabled = 1
"set left separator"
"set left separator which are not editting"

"show buffer number"
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline_theme='codedark'
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#formatter = 'unique_tail'

"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
"let g:airline#extensions#tabline#right_sep = ''
"let g:airline#extensions#tabline#right_alt_sep = ''                                                                                                                                       "let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#left_sep = "\ue0b4"
let g:airline#extensions#tabline#left_alt_sep = "\ue0b5"
let g:airline#extensions#tabline#right_sep = "\ue0b6"
let g:airline#extensions#tabline#right_alt_sep = "\ue0b7"
let g:airline_left_sep = "\ue0b4"
let g:airline_left_alt_sep = "\ue0b5"
let g:airline_right_sep = "\ue0b6"
let g:airline_right_alt_sep = "\ue0b7"
let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
let g:airline_symbols.readonly = "\uf084"
let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = " \ue75c"
let g:airline_symbols.paste = 'ρ'
let g:airline_theme='ayu_mirage'
let g:airline#extensions#whitespace#mixed_indent_algo=1

"*****************************************************************************************"
"*****************************************************************************************"
" For YouCompleteMe
"*****************************************************************************************"
set completeopt=longest,menu                                 "補全方式與IDE一致(不會跳出上方預覽)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif      "離開insert mode後自動關閉上方預覽視窗
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_global_ycm_extra_conf = 'uhome/home/lingege32/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
"*****************************************************************************************"
"For vim matchup
"*****************************************************************************************"
let g:loaded_matchit =1
"*****************************************************************************************"
"For ale.vim
"*****************************************************************************************"
"始终开启标志列
let g:ale_sign_column_always = 0
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = "\uf1e2"
"let g:ale_sign_error = "\uf1e2\uf1e2"
"let g:ale_sign_error = "\uf00d"
let g:ale_sign_warning = "\uf0e7"
"let g:ale_sign_warning = "\uf0e7\uf0e7"                                                                                                                                                    "在vim自带的状态栏中整合ale
let g:ale_statusline_format = ["\uf1e2%d", "\uf0e7%d", "✔ OK"]
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

"ale linter
"let g:ale_linters = {'c': ['gcc'], 'cpp': [ 'g++'], 'rust': ['analyzer']}
let g:ale_linters = {'c': ['gcc'], 'cpp': [ 'g++'], 'rust': ['rls']}
"let g:ale_linters = {'c': ['gcc'], 'cpp': [ 'g++']}
let g:ale_rust_rls_executable = '/home/lingege32/.cargo/bin/rls'
let g:ale_rust_rls_toolchain = ''
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++20'
let g:ale_cpp_cc_options = '-Wall -O2 -std=c++20'
"*****************************************************************************************"
"For vimWiki.vim
"*****************************************************************************************"
hi VimwikiHeader1  ctermfg=1
hi VimwikiHeader2 ctermfg=2
hi VimwikiHeader3 ctermfg=3
hi VimwikiHeader4 ctermfg=4
hi VimwikiHeader5 ctermfg=5
hi VimwikiHeader6 ctermfg=6
"*****************************************************************************************"
"  For nerd commenter
"*****************************************************************************************"
map // <plug>NERDCommenterToggle

"*****************************************************************************************"
"  For indent line
"*****************************************************************************************"
let g:indentLine_char_list = ['|', '¦', '┆', '┊']




let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', ' ~/.vim/plugged/vim-snippets/UltiSnips', 'UltiSnips']

function! s:p(bang, ...)
  let preview_window = get(g:, 'fzf_preview_window', a:bang && &columns >= 80 || &columns >= 120 ? 'right': '')
  if len(preview_window)
    return call('fzf#vim#with_preview', add(copy(a:000), preview_window))
  endif
  return {}
endfunction
command! -bang -nargs=* RG call fzf#vim#grep("rg -g !'*tags.vi' --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, s:p(<bang>0), <bang>0)',

source $HOME/.vim/.hlcolorVScode
"source $HOME/.vim/.hlcolorOcean
"source $HOME/.vim/.hlcolor2
set formatoptions-=o   "註解的下一行 "不要"自動註解

