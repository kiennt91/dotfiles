"source ~/.vimrc.bundle
source ~/.vimrc.neobundle

"-------------------------------------------------------------------------------
"" 基本設定 Basics
"-------------------------------------------------------------------------------
let mapleader = ","              " キーマップリーダー
set scrolloff=5                  " スクロール時の余白確保
set textwidth=0                  " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                     " バックアップ取らない
set autoread                     " 他で書き換えられたら自動で読み直す
set noswapfile                   " スワップファイル作らない
set hidden                       " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                     " ビープをならさない
set browsedir=buffer             " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0                  " モードラインは無効

" OSのクリップボードを使用する
set clipboard+=unnamed
" ターミナルでマウスを使用できるようにする
"set mouse=a
"set guioptions+=a
"set ttymouse=xterm2

"ヤンクした文字は、システムのクリップボードに入れる"
set clipboard=unnamed
" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする "
imap <C-p>  <ESC>"*pa

" Ev/Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

set helpfile=$VIMRUNTIME/doc/help.txt

" ファイルタイプ判定をon
filetype plugin on

"-------------------------------------------------------------------------------
" ステータスライン StatusLine
"-------------------------------------------------------------------------------
set laststatus=2 " 常にステータスラインを表示

"カーソルが何行目の何列目に置かれているかを表示する
set ruler

" vim-powerlineでフォントにパッチを当てないなら以下をコメントアウト
"let g:Powerline_symbols = 'fancy'

"ステータスラインに文字コードと改行文字を表示する
" if winwidth(0) >= 120
  " set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %{g:HahHah()}\ %F%=[%{GetB()}]\ %{fugitive#statusline()}\ %l,%c%V%8P
" else
  " set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %{g:HahHah()}\ %f%=[%{GetB()}]\ %{fugitive#statusline()}\ %l,%c%V%8P
" endif

"入力モード時、ステータスラインのカラーを変更
" augroup InsertHook
" autocmd!
" autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=cyan
" autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
" augroup END

"自動的に QuickFix リストを表示する
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin

function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction
" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc

""-------------------------------------------------------------------------------
"" インデント Indent
""-------------------------------------------------------------------------------
set autoindent   " 自動でインデント
""set paste        " ペースト時にautoindentを無効に(onにするとautocomplpop.vimが動かない)
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent      " Cプログラムファイルの自動インデントを始める

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=2 shiftwidth=2 softtabstop=0

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
endif

"-------------------------------------------------------------------------------
" 表示 Apperance
"-------------------------------------------------------------------------------
set showmatch         " 括弧の対応をハイライト
set number            " 行番号表示
set list              " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex      " 印字不可能文字を16進数で表示

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" コマンド実行中は再描画しない
set lazyredraw
" 高速ターミナル接続を行う
set ttyfast


"-------------------------------------------------------------------------------
" カラー関連 Colors
"-------------------------------------------------------------------------------

"if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
"endif

" colorscheme mrkn256
"colorscheme yuroyoro256
colorscheme xoria256
"set background=dark

" ターミナルタイプによるカラー設定
if &term =~ "xterm-256color" || "screen-256color"
  " 256色
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" ハイライト on
syntax enable
" 補完候補の色づけ for vim7
" hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
" hi PmenuSel ctermbg=blue ctermfg=black
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
" hi PmenuSbar ctermbg=0 ctermfg=9
" hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF

"-------------------------------------------------------------------------------
" 移動設定 Move
"-------------------------------------------------------------------------------

" redef C-j to C-g
"imap  IMAP_JumpForward
"nmap  IMAP_JumpForward

" カーソルを表示行で移動する。論理行移動は<C-n>,<C-p>
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up>   gk

" 0, 9で行頭、行末へ
nmap 1 0
nmap 0 ^
nmap 9 $

" insert mode での移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>
" インサートモードでもhjklで移動（Ctrl押すけどね）
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 括弧入力時にカーソル自動移動
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>

"j, kで画面送り
noremap <Space>j <C-f>
noremap <Space>k <C-b>

" spaceで次のbufferへ。back-spaceで前のbufferへ
nmap <Space><Space> ;MBEbn<CR>
nmap <BS><BS> ;MBEbp<CR>

" F2で前のバッファ
map <F2> <ESC>;bp<CR>
" F3で次のバッファ
map <F3> <ESC>;bn<CR>
" F4でバッファを削除する
map <F4> <ESC>:bnext \| bdelete #<CR>
command! Bw :bnext \| bdelete #

"フレームサイズを怠惰に変更する
map <kPlus> <C-W>+
map <kMinus> <C-W>-

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 最後に編集された位置に移動
nnoremap gb '[
nnoremap gp ']

" 対応する括弧に移動
nnoremap ( %
nnoremap ) %

" 最後に変更されたテキストを選択する
nnoremap gc  `[v`]
vnoremap gc <C-u>normal gc<Enter>
onoremap gc <C-u>normal gc<Enter>

" カーソル位置の単語をyankする
nnoremap vy vawy

" 矩形選択で自由に移動する
set virtualedit+=block

"ビジュアルモード時vで行末まで選択
vnoremap v $h

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" git-diff-aware version of gf commands.
" http://labs.timedia.co.jp/2011/04/git-diff-aware-gf-commands-for-vim.html
nnoremap <expr> gf  <SID>do_git_diff_aware_gf('gf')
nnoremap <expr> gF  <SID>do_git_diff_aware_gf('gF')
nnoremap <expr> <C-w>f  <SID>do_git_diff_aware_gf('<C-w>f')
nnoremap <expr> <C-w><C-f>  <SID>do_git_diff_aware_gf('<C-w><C-f>')
nnoremap <expr> <C-w>F  <SID>do_git_diff_aware_gf('<C-w>F')
nnoremap <expr> <C-w>gf  <SID>do_git_diff_aware_gf('<C-w>gf')
nnoremap <expr> <C-w>gF  <SID>do_git_diff_aware_gf('<C-w>gF')

function! s:do_git_diff_aware_gf(command)
  let target_path = expand('')
  if target_path =~# '^[ab]/'  " with a peculiar prefix of git-diff(1)?
    if filereadable(target_path) || isdirectory(target_path)
      return a:command
    else
      " BUGS: Side effect - Cursor position is changed.
      let [_, c] = searchpos('\f\+', 'cenW')
      return c . '|' . 'v' . (len(target_path) - 2 - 1) . 'h' . a:command
    endif
  else
    return a:command
  endif
endfunction

" insert mode でjjでesc
inoremap jj <Esc>

"-------------------------------------------------------------------------------
" 検索設定 Search
"-------------------------------------------------------------------------------
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト
"Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"選択した文字列を置換
vnoremap /r "xy;%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>

"s*置換後文字列/gでカーソル下のキーワードを置換
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" Ctrl-iでヘルプ
nnoremap <C-i>  :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

" :Gb <args> でGrepBufferする
command! -nargs=1 Gb :GrepBuffer <args>
" カーソル下の単語をGrepBufferする
nnoremap <C-g><C-b> :<C-u>GrepBuffer<Space><C-r><C-w><Enter>

" :Gr でカレントディレクトリ以下を再帰的にgrepする
command! -nargs=1 Gr :Rgrep <args> *<Enter><CR>
" カーソル下の単語をgrepする
nnoremap <silent> <C-g><C-r> :<C-u>Rgrep<Space><C-r><C-w> *<Enter><CR>

let Grep_Skip_Dirs = '.svn .git'
let Grep_Skip_Files = '*.bak *~'

"-------------------------------------------------------------------------------
" 編集関連 Edit
"-------------------------------------------------------------------------------

" insertモードを抜けるとIMEオフ
"set noimdisable
"set iminsert=0 imsearch=0
"set noimcmdline
"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" yeでそのカーソル位置にある単語をレジスタに追加
nmap ye ;let @"=expand("<cword>")<CR>
" Visualモードでのpで選択範囲をレジスタの内容に置き換える
vnoremap p <Esc>;let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Tabキーを空白に変換
set expandtab

" コンマの後に自動的にスペースを挿入
inoremap , ,<Space>
" XMLの閉タグを自動挿入
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap
augroup END

" XMLの閉タグを自動挿入
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END

"  Insert mode中で単語単位/行単位の削除をアンドゥ可能にする
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>


" :Ptでインデントモード切替
command! Pt :set paste!

" インサートモード中にでyankした内容をputする
"inoremap <C-o> <ESC>:<C-U>YRPaste 'p'<CR>i

" y9で行末までヤンク
nmap y9 y$
" y0で行頭までヤンク
nmap y0 y^

" 括弧を自動補完
"inoremap { {}
"inoremap [ []
"inoremap ( ()
"inoremap " ""
"inoremap ' ''
"vnoremap { "zdi^V{z}
"vnoremap [ "zdi^V[z]
"vnoremap ( "zdi^V(z)
"vnoremap " "zdi^V"z^V"
"vnoremap ' "zdi'z'

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
"" 保存時にtabをスペースに変換する
"autocmd BufWritePre * :%s/\t/  /ge

" 日時の自動入力
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y/%m/%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

" foldは各FiltTypeにお任せる
" set foldmethod=syntax
" 折りたたみは全て展開した状態で開始する
" set foldlevelstart=99
" .vimはmarker
" autocmd FileType vim :set foldmethod=marker

" j でJSONをformat
" http://wozozo.hatenablog.com/entry/2012/02/08/121504
map <Leader>j !python -m json.tool<CR>

" quickfixウィンドウではq/ESCで閉じる
autocmd FileType qf nnoremap <buffer> q :ccl<CR>
autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>

" cwでquickfixウィンドウの表示をtoggleするようにした
function! s:toggle_qf_window()
  for bufnr in range(1,  winnr('$'))
    if getwinvar(bufnr,  '&buftype') ==# 'quickfix'
      execute 'ccl'
      return
    endif
  endfor
  execute 'botright cw'
endfunction
nnoremap  cw :call toggle_qf_window()

"-------------------------------------------------------------------------------
" エンコーディング関連 Encoding
"-------------------------------------------------------------------------------
set ffs=unix,dos,mac  " 改行文字
set encoding=utf-8    " デフォルトエンコーディング

" 文字コード認識はbanyan/recognize_charcode.vimへ

" cvsの時は文字コードをeuc-jpに設定
autocmd FileType cvs :set fileencoding=euc-jp
" 以下のファイルの時は文字コードをutf-8に設定
autocmd FileType svn :set fileencoding=utf-8
autocmd FileType js :set fileencoding=utf-8
autocmd FileType css :set fileencoding=utf-8
autocmd FileType html :set fileencoding=utf-8
autocmd FileType xml :set fileencoding=utf-8
autocmd FileType java :set fileencoding=utf-8
autocmd FileType scala :set fileencoding=utf-8

" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" 指定文字コードで強制的にファイルを開く
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932

"------------------------------------
" 補完・履歴 Complete
"------------------------------------
set wildmenu               " コマンド補完を強化
set wildchar=<tab>         " コマンド補完を開始するキー
set wildmode=list:full     " リスト表示、最長マッチ
set history=1000           " コマンド・検索パターンの履歴数
set complete+=k            " 補完に辞書ファイル追加

"------------------------------------
" neocomplecache.vim
"------------------------------------
" AutoComplPopを無効にする
let g:acp_enableAtStartup = 0
" NeoComplCacheを有効にする
let g:neocomplcache_enable_at_startup = 1
" 補完が自動で開始される文字数
let g:neocomplcache_auto_completion_start_length = 3
" smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplcache_enable_camel_case_completion = 1
" _(アンダーバー)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplcache_min_syntax_length = 3
" neocomplcacheを自動的にロックするバッファ名のパターン
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" -入力による候補番号の表示
let g:neocomplcache_enable_quick_match = 1
" 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
let g:neocomplcache_enable_auto_select = 1
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplcache_max_list = 20

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scala' : $HOME.'/.vim/bundle/vim-scala/dict/scala.dict',
    \ 'java' : $HOME.'/.vim/dict/java.dict',
    \ 'c' : $HOME.'/.vim/dict/c.dict',
    \ 'cpp' : $HOME.'/.vim/dict/cpp.dict',
    \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
    \ 'ocaml' : $HOME.'/.vim/dict/ocaml.dict',
    \ 'perl' : $HOME.'/.vim/dict/perl.dict',
    \ 'php' : $HOME.'/.vim/dict/php.dict',
    \ 'scheme' : $HOME.'/.vim/dict/scheme.dict',
    \ 'vm' : $HOME.'/.vim/dict/vim.dict'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" ユーザー定義スニペット保存ディレクトリ
"let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'

" スニペット
"imap <C-y> <Plug>(neocomplcache_snippets_expand)
"smap <C-k> <Plug>(neocomplcache_snippets_expand)

" 補完を選択しpopupを閉じる
" inoremap <expr><C-y> neocomplcache#close_popup()
" 補完をキャンセルしpopupを閉じる
" inoremap <expr><C-e> neocomplcache#cancel_popup()
" TABで補完できるようにする
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" undo
inoremap <expr><C-g>     neocomplcache#undo_completion()
" 補完候補の共通部分までを補完する
inoremap <expr><C-s> neocomplcache#complete_common_string()
" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" C-kを押すと行末まで削除
" inoremap <C-k> <C-o>D
" C-nでneocomplcache補完
inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" C-pでkeyword補完
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
" 補完候補が出ていたら確定、なければ改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-x><C-o> &filetype == 'vim' ? "\<C-x><C-v><C-p>" : neocomplcache#manual_omni_complete()

" buffer開いたらneoconでcache
autocmd BufReadPost,BufEnter,BufWritePost :NeoComplCacheCachingBuffer <buffer>

" FileType毎のOmni補完を設定
autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c          setlocal omnifunc=ccomplete#Complete
autocmd FileType ruby       setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" autocmd FileType ruby let g:neocomplcache_source_disable = {
  " \ 'include_complete' : 1,
  " \ 'omni_complete' : 1
" \ }
" autocmd FileType ruby let g:neocomplcache_source_disable = {
  " \ 'include_complete' : 1
" \ }

""インクルードパスの指定
"let g:neocomplcache_include_paths = {
"  \ 'cpp'  : '.,/opt/local/include/gcc46/c++,/opt/local/include,/usr/include',
"  \ 'c'    : '.,/usr/include',
"  \ 'ruby' : '.,$HOME/.rvm/rubies/**/lib/ruby/1.8/',
"  \ }
""インクルード文のパターンを指定
"let g:neocomplcache_include_patterns = {
"  \ 'cpp' : '^\s*#\s*include',
"  \ 'ruby' : '^\s*require',
"  \ 'perl' : '^\s*use',
"  \ }
""インクルード先のファイル名の解析パターン
"let g:neocomplcache_include_exprs = {
"  \ 'ruby' : substitute(v:fname,'::','/','g')
"  \ }
"" ファイルを探す際に、この値を末尾に追加したファイルも探す。
"let g:neocomplcache_include_suffixes = {
"  \ 'ruby' : '.rb',
"  \ 'haskell' : '.hs'
"  \ }

""-------------------------------------------------------------------------------
"" プラグインごとの設定 Plugins
""-------------------------------------------------------------------------------
"
""------------------------------------
"" YankRing.vim
""------------------------------------
""" Yankの履歴参照
""nmap ,y ;YRShow<CR>
"
""------------------------------------
"" MiniBufExplorer
""------------------------------------
"""set minibfexp
""let g:miniBufExplMapWindowNavVim=1 "hjklで移動
""let g:miniBufExplSplitBelow=0  " Put new window above
""let g:miniBufExplMapWindowNavArrows=1
""let g:miniBufExplMapCTabSwitchBufs=1
""let g:miniBufExplModSelTarget=1
""let g:miniBufExplSplitToEdge=1
""let g:miniBufExplMaxSize = 10
""
""":MtでMiniBufExplorerの表示トグル
""command! Mt :TMiniBufExplorer
"
""------------------------------------
"" Align
""------------------------------------
"" Alignを日本語環境で使用するための設定
"let g:Align_xstrlen = 3
"
""------------------------------------
"" NERDTree
""------------------------------------
"" 起動ショートカット
""nnoremap <F2> :NERDTree<CR>
"" マウス制御モード
"let NERDTreeMouseMode = 1
"" NERDTree のウィンドウサイズ
"let NERDTreeWinSize = 35
"
""------------------------------------
"" NERD_commenter.vim
""------------------------------------
"" コメントの間にスペースを空ける
"let NERDSpaceDelims = 1
""xでコメントをトグル(NERD_commenter.vim)
"map <Leader>x, c<space>
"
""未対応ファイルタイプのエラーメッセージを表示しない
"let NERDShutUp=1
"
"
"" ------------------------------------
"" grep.vim
""------------------------------------
"" 検索外のディレクトリ、ファイルパターン
"let Grep_Skip_Dirs = '.svn .git .hg'
"let Grep_Skip_Files = '*.bak *~'
"
""------------------------------------
"" surround.vim
""------------------------------------
"" s, ssで選択範囲を指定文字でくくる
"nmap s <Plug>Ysurround
"nmap ss <Plug>Yssurround
"
"let g:surround_{char2nr('e')} = "begin \r end"
"let g:surround_{char2nr('d')} = "do \r end"
"let g:surround_{char2nr("-")} = ":\r"
"
""------------------------------------
"" smartchr.vim
""------------------------------------
""inoremap  = smartchr#loop('=', '==', '=>')
""inoremap  . smartchr#loop('.',  '->', '=>')
"
"" " 演算子の間に空白を入れる
"" inoremap  + smartchr#one_of(' + ', ' ++ ', '+')
"" inoremap  +=  smartchr#one_of(' += ')
"" " inoremap  - smartchr#one_of(' - ', ' -- ', '-')
"" inoremap  -=  smartchr#one_of(' -= ')
"" " inoremap  / smartchr#one_of(' / ', ' // ', '/')
"" inoremap  /=  smartchr#one_of(' /= ')
"" inoremap  * smartchr#one_of(' * ', ' ** ', '*')
"" inoremap  *=  smartchr#one_of(' *= ')
"" inoremap  & smartchr#one_of(' & ', ' && ', '&')
"" inoremap  % smartchr#one_of(' % ', '%')
"" inoremap  =>  smartchr#one_of(' => ')
"" inoremap  <-   smartchr#one_of(' <-  ')
"" inoremap   smartchr#one_of('  ', '  ', '')
"" inoremap  , smartchr#one_of(', ', ',')
"" " 3項演算子の場合は、後ろのみ空白を入れる
"" inoremap  ? smartchr#one_of('? ', '?')
"" " inoremap  : smartchr#one_of(': ', '::', ':')
"
"" " =の場合、単純な代入や比較演算子として入力する場合は前後にスペースをいれる。
"" " 複合演算代入としての入力の場合は、直前のスペースを削除して=を入力
"" inoremap  = search('¥(&¥¥+¥-¥/¥>¥<¥) ¥%#', 'bcn')? '= '  : search('¥(*¥!¥)¥%#', 'bcn') ? '= '  : smartchr#one_of(' = ', ' == ', '=')
"
"" " 下記の文字は連続して現れることがまれなので、二回続けて入力したら改行する
"" inoremap  } smartchr#one_of('}', '}')
"" inoremap  ; smartchr#one_of(';', ';')
"" "()は空白入れる
"" inoremap  ( smartchr#one_of('( ')
"" inoremap  ) smartchr#one_of(' )')
"
"" " if文直後の(は自動で間に空白を入れる
"" inoremap  ( search('¥<¥if¥%#', 'bcn')? ' (': '('
"
"
""------------------------------------
"" Fugitive.vim
""------------------------------------
"nnoremap <Space>gd :<C-u>Gdiff<Enter>
"nnoremap <Space>gs :<C-u>Gstatus<Enter>
"nnoremap <Space>gl :<C-u>Glog<Enter>
"nnoremap <Space>ga :<C-u>Gwrite<Enter>
"nnoremap <Space>gc :<C-u>Gcommit<Enter>
"nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
"nnoremap <Space>gb :<C-u>Gblame<Enter>
"
"
""------------------------------------
"" BufExplorer
""------------------------------------
"""lでBufferList
""nnoremap l :BufExplorer
"
""------------------------------------
"" VTreeExplorer
""------------------------------------
""" 縦に表示する
""let g:treeExplVertical=1
"""tでディレクトリツリー表示
""noremap t :VSTreeExplore
"""分割したウィンドウのサイズ
""let g:treeExplWinSize=30
"
""------------------------------------
"" DumbBuf.vim
""------------------------------------
"""bでBufferList
""let dumbbuf_hotkey = 'b'
""let dumbbuf_mappings = {
""    \ 'n': {
""        \'': { 'opt': '', 'mapto': ':close' }
""    \}
""\}
""let dumbbuf_single_key  = 1
""let dumbbuf_updatetime  = 1    " &updatetimeの最小値
""let dumbbuf_wrap_cursor = 0
""let dumbbuf_remove_marked_when_close = 1
"
""------------------------------------
"" vim-indent-guides
""------------------------------------
"nnoremap <silent> <Space>id :<C-u>IndentGuidesToggle<Enter>
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_start_level = 4
"let g:indent_guides_guide_size = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"if 'dark' == &background
"    hi IndentGuidesOdd  ctermbg=black
"    hi IndentGuidesEven ctermbg=darkgrey
"else
"    hi IndentGuidesOdd  ctermbg=white
"    hi IndentGuidesEven ctermbg=lightgrey
"endif
"let g:indent_guides_enable_on_vim_startup = 1
"
"
""------------------------------------
"" gundo.Vim
""------------------------------------
"" nmap U :<C-u>GundoToggle<CR>
"
""------------------------------------
"" taglist.Vim
""------------------------------------
"" 関数一覧
""set tags=tags
""set tags+=~/.tags
""set tags +=~/src/scala/scala-2.9.2-sources/src/.tags
""set tags +=~/src/scala/play-2.0.2/.tags
"let Tlist_Show_One_File = 1               " 現在編集中のソースのタグしか表示しない
"let Tlist_Exit_OnlyWindow = 1             " taglistのウィンドーが最後のウィンドーならばVimを閉じる
"let Tlist_Use_Right_Window = 1            " 右側でtaglistのウィンドーを表示
"let Tlist_Enable_Fold_Column = 1          " 折りたたみ
""let Tlist_Auto_Open = 1                   " 自動表示
"let Tlist_Auto_Update = 1
"" タグリスト画面の幅
"let Tlist_WinWidth = 40
""map  tl :Tlist        " taglistを開くショットカットキー
""nmap  :CMiniBufExplorer:TrinityToggleTagList:TMiniBufExplorer
""nmap tl :CMiniBufExplorer:TrinityToggleTagList:TMiniBufExplorer
""nnoremap   :TlistToggle
"
"" tags-and-searches の移動
"nnoremap t  <Nop>
"nnoremap tt  <C-]>          " 「飛ぶ」
"nnoremap tj  :<C-u>tag<CR>  " 「進む」
"nnoremap tk  :<C-u>pop<CR>  " 「戻る」
"nnoremap tl  :<C-u>tags<CR> " 履歴一覧
"
""------------------------------------
"" Srcexp
""------------------------------------
""" [Srcexpl] tagsを利用したソースコード閲覧・移動補助機能
""let g:SrcExpl_UpdateTags    = 1         " tagsをsrcexpl起動時に自動で作成（更新）
""let g:SrcExpl_RefreshTime   = 0         " 自動表示するまでの時間(0:off)
""let g:SrcExpl_WinHeight     = 9         " プレビューウインドウの高さ
""let g:SrcExpl_RefreshMapKey = "" " 手動表示のMAP
""let g:SrcExpl_GoBackMapKey  = ""   " 戻る機能のMAP
"" Source Explorerの機能ON/OFF
"" nmap  :CMiniBufExplorer:SrcExplToggle:TMiniBufExplorer
"
""------------------------------------
"" open-blowser.vim
""------------------------------------
"" カーソル下のURLをブラウザで開く
"nmap <Leader>fu <Plug>(openbrowser-open)
"vmap <Leader>fu <Plug>(openbrowser-open)
"" カーソル下のキーワードをググる
"nnoremap <Leader>fs :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
"
""------------------------------------
"" operator-camelize.vim
""------------------------------------
"" camel-caseへの変換
"map <Leader>u <Plug>(operator-camelize)
"map <Leader>U <Plug>(operator-decamelize)
"
""------------------------------------
"" operator-replace.vim
""------------------------------------
"" RwなどでYankしてるもので置き換える
""map R (operator-replace)
"
""------------------------------------
"" smartword.vim
""------------------------------------
"noremap ,w  w
"noremap ,b  b
"noremap ,e  e
"noremap ,ge  ge
"
"map W  <Plug>(smartword-w)
"map B  <Plug>(smartword-b)
"map E  <Plug>(smartword-e)
"map ge  <Plug>(smartword-ge)
"
""------------------------------------
"" camelcasemotion.vim
""------------------------------------
"" <Shift-wbe>でCameCaseやsnake_case単位での単語移動
"map <silent> w <Plug>CamelCaseMotion_w
"map <silent> b <Plug>CamelCaseMotion_b
"map <silent> e <Plug>CamelCaseMotion_e
"
""" text-objectで使用できるように
""omap  iw CamelCaseMotion_iw
""xmap  iw CamelCaseMotion_iw
""omap  ib CamelCaseMotion_ib
""xmap  ib CamelCaseMotion_ib
""omap  ie CamelCaseMotion_ie
""xmap  ie CamelCaseMotion_ie
"
""------------------------------------
"" errormarker.vim
""------------------------------------
""" disable default shortcut mapping and re-define to ec
""let g:errormarker_disablemappings = 1
""nmap   ec :ErrorAtCursor
"
"
"""------------------------------------
"" vimshell
""------------------------------------
"" シェルを起動
""noremap  ,sp :VimShellPop
"" scala REPL を非同期で起動
""nnoremap  ,scala :VimShellInteractive scala
"
"let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
"let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
"let g:vimshell_enable_smart_case = 1
"let g:vimshell_EnableInteractive = 1
"
"" VimShellPop で画面分割したときの高さ
"let g:vimshell_split_height = 47
"
""if has('win32') || has('win64')
""  " Display user name on Windows.
""  let g:vimshell_prompt = $USERNAME."% "
""else
""  " Display user name on Linux.
""  let g:vimshell_prompt = $USER."% "
""
""  call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
""  call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
""  let g:vimshell_execute_file_list['zip'] = 'zipinfo'
""  call vimshell#set_execute_file('tgz,gz', 'gzcat')
""  call vimshell#set_execute_file('tbz,bz2', 'bzcat')
""endif
""
""function! g:my_chpwd(args, context)
""  call vimshell#execute('echo "chpwd"')
""endfunction
""function! g:my_emptycmd(cmdline, context)
""  call vimshell#execute('echo "emptycmd"')
""  return a:cmdline
""endfunction
""function! g:my_preprompt(args, context)
""  call vimshell#execute('echo "preprompt"')
""endfunction
""function! g:my_preexec(cmdline, context)
""  call vimshell#execute('echo "preexec"')
""
""  if a:cmdline =~# '^\s*diff\>'
""    call vimshell#set_syntax('diff')
""  endif
""  return a:cmdline
""endfunction
""
""autocmd FileType vimshell
""\ call vimshell#altercmd#define('g', 'git')
""\| call vimshell#altercmd#define('i', 'iexe')
""\| call vimshell#altercmd#define('l', 'll')
""\| call vimshell#altercmd#define('ll', 'ls -l')
"""\| call vimshell#hook#set('chpwd', ['g:my_chpwd'])
"""\| call vimshell#hook#set('emptycmd', ['g:my_emptycmd'])
"""\| call vimshell#hook#set('preprompt', ['g:my_preprompt'])
"""\| call vimshell#hook#set('preexec', ['g:my_preexec'])
""
""command! Vs :VimShell
"
"------------------------------------
" vimfiler.vim
"------------------------------------
" 起動ショートカット
nnoremap <F5> :VimFiler<CR>
nnoremap <F6> :VimFilerSplit<CR>
" vimfiler をデフォルトのファイルエクスプローラとして使用する。
let g:vimfiler_as_default_explorer = 1
" セーフモードの有効:1/無効:0
let g:vimfiler_safe_mode_by_default = 0
" ディレクトリのコピーコマンド
let g:vimfiler_external_copy_directory_command = 'cp -r $src $dest'
" ファイルのコピーコマンド
let g:vimfiler_external_copy_file_command = 'cp $src $dest'
" 削除コマンド
let g:vimfiler_external_delete_command = 'rm -r $srcs'
" 移動コマンド
let g:vimfiler_external_move_command = 'mv $srcs $dest'
" 関連付け
call vimfiler#set_execute_file('vim', 'vim')


""------------------------------------
"" unite.vim
""------------------------------------
"" The prefix key.
"nnoremap    [unite]   <Nop>
"nmap    f [unite]
"
"nnoremap [unite]u  :<C-u>Unite -no-split<Space>
"
"" 全部乗せ
"nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -no-split -buffer-name=files buffer file_mru bookmark file<CR>
"" ファイル一覧
"nnoremap <silent> [unite]f  :<C-u>Unite -no-split -buffer-name=files file<CR>
"" バッファ一覧
"nnoremap <silent> [unite]b  :<C-u>Unite -no-split buffer<CR>
"" 常用セット
"nnoremap <silent> [unite]u  :<C-u>Unite -no-split buffer file_mru<CR>
"" 最近使用したファイル一覧
"nnoremap <silent> [unite]m  :<C-u>Unite -no-split file_mru<CR>
"" 現在のバッファのカレントディレクトリからファイル一覧
"nnoremap <silent> [unite]d  :<C-u>UniteWithBufferDir -no-split file<CR>
"
"" nnoremap  [unite]b  :UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file
"
"let g:yankring_zap_keys = ""
""" from basyura/unite-rails
""nnoremap  [unite]rm  :Unite -no-split rails/model
""nnoremap  [unite]rc  :Unite -no-split rails/controller
""nnoremap  [unite]rv  :Unite -no-split rails/view
""nnoremap  [unite]rl  :Unite -no-split rails/lib
""nnoremap  [unite]rj  :Unite -no-split rails/javascript
""nnoremap  [unite]rs  :Unite -no-split rails/spec
"
"autocmd FileType unite call s:unite_my_settings()
"function! s:unite_my_settings()"{{{
"  " Overwrite settings.
"
"  " ESCキーを2回押すと終了する
"  nmap <buffer> <ESC>      <Plug>(unite_exit)
"  nmap <buffer> <ESC><ESC> <Plug>(unite_exit)
"  imap <buffer> jj      <Plug>(unite_insert_leave)
"  nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('preview')<CR>
"  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
"  " Start insert.
"  let g:unite_enable_start_insert = 1
"
"  " ウィンドウを分割して開く
"  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')
"  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')
"
"  " ウィンドウを縦に分割して開く
"  nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
"  inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
"
"endfunction"}}}
"
"let g:unite_source_file_mru_limit = 200
"
"" unite-plugins
"cnoremap UH Unite help<Enter>
"cnoremap UO Unite outline<Enter>
"
"
""------------------------------------
"" quickrun.vim
""------------------------------------
""let g:quickrun_no_default_key_mappings = 1
""nmap r (quickrun)
""let g:quickrun_config = {}
""let g:quickrun_config._ = {'runner' : 'vimproc'}
"""let g:quickrun_config['rspec/bundle'] = {
"""  \ 'type': 'rspec/bundle',
"""  \ 'command': "rspec",
"""  \ 'cmdopt': "-l %{line('.')}",
"""  \ 'exec': "bundle exec %c %o %s ",
"""  \ 'filetype': 'rspec-result'
"""  \}
"""let g:quickrun_config['rspec/normal'] = {
"""  \ 'type': 'rspec/normal',
"""  \ 'command': "rspec",
"""  \ 'cmdopt': "-l %{line('.')}",
"""  \ 'exec': '%c %o %s',
"""  \ 'filetype': 'rspec-result'
"""  \}
"""function! RSpecQuickrun()
"""  let b:quickrun_config = {'type' : 'rspec/bundle'}
"""endfunction
"""autocmd BufReadPost *_spec.rb call RSpecQuickrun()
""
""let g:quickrun_config['markdown'] = {
""  \ 'command': 'pandoc',
""  \ 'exec': ['%c -s -f markdown -t html -o %s:p:r.html %s', 'xdg-open %s:p:r.html', 'sleep 1', 'rm %s:p:r.html'],
""  \ 'tempfile': '{tempname()}.md'
""  \}
"
""------------------------------------
"" Pydiction
""------------------------------------
""let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
"
""------------------------------------
"" Syntastic
""------------------------------------
"" エラー行をsignで表示する
""let g:syntastic_enable_signs = 1
"" 可能ならhighligt表示する
""let g:syntastic_enable_highlighting = 1
"
""------------------------------------
"" toggle.vim
""------------------------------------
"imap <C-A> <Plug>ToggleI
"nmap <C-A> <Plug>ToggleN
"vmap <C-A> <Plug>ToggleV
"
"let g:toggle_pairs = { 'and':'or', 'or':'and', 'if':'unless', 'unless':'if', 'yes':'no', 'no':'yes', 'enable':'disable', 'disable':'enable', 'pick':'reword', 'reword':'fixup', 'fixup':'squash', 'squash':'edit', 'edit':'exec', 'exec':'pick' }
"
""------------------------------------
""" Zen Coding
""------------------------------------
"let g:user_zen_expandabbr_key='<c-y>'
"let g:user_zen_settings = {
"    \'indentation' : '    ',
"    \}
"
""------------------------------------
"" memolist.vim
""------------------------------------
""map mn :MemoNew
""map ml :MemoList
""map mg :MemoGrep
""" ファイルの保存先
""let g:memolist_path = "~/Dropbox/memo"
""let g:memolist_memo_suffix = "md"
""let g:memolist_memo_date = "%Y-%m-%d %H:%M"
"""let g:memolist_memo_date = "epoch"
"""let g:memolist_memo_date = "%D %T"
""let g:memolist_prompt_tags = 1
""let g:memolist_prompt_categories = 1
"""let g:memolist_qfixgrep = 1
""let g:memolist_vimfiler = 1
"
"-------------------------------------------------------------------------------
" その他 Misc
"-------------------------------------------------------------------------------

" $ 記号の入力
inoremap <C-d> $

" [Python用] 指定したディレクトリに存在するファイルが更新された場合、自動で scp する。
"autocmd BufWritePost * :call SyncFile()
"function! SyncFile()
"python << PYTHONEOF
"import vim
"import os
"upload_settings = {
"  "/home/noguchi/workspace/ci1/j7Smph": "scp://noguchi_d@192.168.63.11/usr/x/j7Smph/"
"}
"fullpath = vim.current.buffer.name
"directory,  filename = os.path.dirname(fullpath),  os.path.basename(fullpath)
"if directory in upload_settings:
"    vim.command("silent Nwrite "+upload_settings[directory]+filename)
"PYTHONEOF
"endfunction

" [vim7用] 指定したディレクトリに存在するファイルが更新された場合、自動で scp する。
"autocmd BufWritePost * :call SyncFile()
"function! SyncFile()
"let upload_settings = { "/home/noguchi/workspace/ci1/j7Smph": "scp://noguchi_d@192.168.63.11/usr/x/j7Smph/" }
"let directory = expand("%:p:h")
"if has_key(upload_settings, directory)
"  exec "silent Nwrite ".upload_settings[directory]."%"
"endif
"endfunction

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" ファイルアップロードコマンド
nnoremap <F8> <ESC>:call ScpUpload()<CR>

" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

