# =========================================================
# 環境変数
# =========================================================
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home


# =========================================================
# Zshの設定
# =========================================================
# 色を使用出来るようにする
autoload -Uz colors
colors

# 日本語ファイル名を表示可能にする
setopt print_eight_bit
 
# cd なしでもディレクトリ移動
setopt auto_cd

# cd [TAB] で以前移動したディレクトリを表示
setopt auto_pushd

# 同時に起動した zsh の間でヒストリを共有する
setopt share_history

# ヒストリ (履歴) を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# 同時に起動した zsh の間でヒストリを共有する
setopt share_history
 
# 直前と同じコマンドの場合はヒストリに追加しない
setopt hist_ignore_dups
 
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
 
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
 
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# [TAB] でパス名の補完候補を表示したあと、
# 続けて [TAB] を押すと候補からパス名を選択できるようになる
zstyle ':completion:*:default' menu select=1

# コマンドのスペルを訂正する
setopt correct

# 拡張 glob を有効にする
setopt extended_glob

# '#' 以降をコメントとして扱う
setopt interactive_comments


# =========================================================
# alias
# =========================================================
alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'


# =========================================================
# zplug
# =========================================================
source ~/.zplug/init.zsh

# Plugin
zplug "b4b4r07/enhancd", use:init.sh
zplug 'dracula/zsh', as:theme

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
