"--------------------------------------------------------------------
"
" vim用ローカル環境設定ファイル
"                              by shunk1331 v1.0
"--------------------------------------------------------------------
"--------------------------------------------------------------------
"一般
"
" viとの互換を取らない
set nocompatible
" コマンド、検索パターンを50個まで履歴に残す
set history=1000
"ヘルプを日本語化
set helplang=ja
".vimrcの更新を自動で読み込み
set autoread
"
"--------------------------------------------------------------------
"プラグイン管理関連
" NeoBundleで管理してるプラグインを読み込む
source ~/.vimrc.bundle
"--------------------------------------------------------------------
" 検索関連
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索後に最後まで行ったら戻らない
set nowrapscan
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
"--------------------------------------------------------------------
" 装飾関連
"
" 行番号を表示させる
set number
" タイトルをウィンドウ枠に表示
set title
" ルーラーを表示
set ruler
" タブや改行を表示する
set list
" 不可視文字を表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" 入力中のコマンドをステータスに表示する
set showcmd
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" ステータスラインに表示する情報の設定
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=¥%03.3b]\ [HEX=¥%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2				" ステータスラインを2行に
" ステータスラインの色
hi StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white
" ハイライト
if &t_Co > 2 || has("gui_running")
        " シンタックスハイライト
        syntax on
        " 検索結果文字列のハイライトを有効にする
        set hlsearch
endif
"--------------------------------------------------------------------
" 編集、文書関連
"
" backspaceキーの挙動を設定する
" indent        : 行頭の空白の削除を許す
" eol           : 改行の削除を許す
" start         : 挿入モードの開始位置での削除を許す
set backspace=indent,eol,start

" 新しい行と直前の行と同じインデントにする
"set autoindent
" Tab文字を画面上の見た目で何文字幅にされるか設定
set tabstop=4
" cindentやautoindent時に挿入されるタブの幅
set shiftwidth=4
" 新しい行を作った時に高度な自動インデントを行う
set smartindent
" 行頭の余白内でTabを打ち込むと、shiftwidthの数だけインデントする
set smarttab
" Tabキー使用時Tabでは無くホワイトスペースを入れたいときに利用する。
" この値が0以外のときはtabstopの設定が無効になる
set softtabstop=0
" Tab文字を空白に置き換えない
set noexpandtab
" オートインデントを有効にする
"set cindent
" コマンドを補完する
set wildmenu
"--------------------------------------------------------------------
" ファイル関連
"
" バックアップファイルを作成する
set backupdir=/Users/S_Kudou/.vim_backup
"set backupdir=/home/vagrant/.vim_backup
"ファイルの保存ダイアログの初期ディレクトリをバッファファイル位置に指定
"set browsedir=buffer
" クリップボードをWindowsと連携
set clipboard=unnamed
" スワップファイル用のディレクトリ
"set directory=/Users/S_Kudou/.vim_backup
"set directory=/home/vagrant/.vim_backup
" バックアップファイルの拡張子を指定
set backupext=.bk
"--------------------------------------------------------------------
" 国際化関連
"
" 文字コードの設定
" fecesの記述にはeuc-jp(encの値)は一番最後に記述する必要がある
" vimはファイルのオープン時にfencsの値を参照していき
" fencsと値が一致したエンコーディングでファイルをオープンする
" この時、一致しなくともencで指定されたエンコーディングが現れると無条件で
" そのエンコーディングでファイルを開いてしまう為
set encoding=utf-8
set fileencodings=ja_JP.utf-8
"set fileencoding=euc-jp
"set fileencodings=sjis
"set fileencodings=ucs-bom,iso-2022-jp,utf-8,ucs-2le,ucs-2,cp932,euc-jp
"--------------------------------------------------------------------
" マップ定義
"

" 挿入モードでのキーマップ
inoremap <silent> jj <ESC>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-f> <PageDown>
inoremap <C-b> <PageUp>
inoremap <Nul> <Enter>

" 引用符, 括弧の設定
""inoremap { {}<Left>
""inoremap [ []<Left>
""inoremap ( ()<Left>
""inoremap " ""<Left>
""inoremap ' ''<Left>
""inoremap <> <><Left>

"--------------------------------------------------------------------
" オートコマンド
" 今は何もなし

"--------------------------------------------------------------------
" Function定義
"
" GetStatusEx
" ステータス表示用function
function! GetStatusEx()
        let str = ''
        let str = str . '' . &fileformat . ']'
        if has('multi_byte') && &fileencoding != ''
        let str = '[' . &fileencoding . ':' . str
        endif
        return str
endfunction

"--------------------------------------------------------------------
" 入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"--------------------------------------------------------------------
" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile, BufRead * match ZenkakuSpace /　/
"--------------------------------------------------------------------
"プラグイン設定関連
source ~/.vimrc.neocomplete

