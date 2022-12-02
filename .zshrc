# =========================================================
# 環境変数
# =========================================================
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
export PATH=/Users/hiroyoshi/Library/Python/3.8/bin:$PATH
export PATH="$HOME/.poetry/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export ZPLUG_HOME=~/.zplug

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

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# 補完に色をつける
zstyle ':completion:*' list-colors di=34 ln=35 ex=31

# コマンドのスペルを訂正する
setopt correct

# 拡張 glob を有効にする
setopt extended_glob

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

# *********** vcs_info ***************************
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg
# *********** /vcs_info ***************************

# =========================================================
# alias
# =========================================================
alias ls='ls -G'
alias la='ls -a'
alias ll='ls -lh'
alias ltr='ls -ltr'

alias -g L='| less'
alias -g G='| grep'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias gs='git status --short --branch'
alias gd='git diff'
alias gl='git log --graph --decorate --oneline'
alias gc='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias dev='git checkout develop; git pull origin develop'
alias master='git checkout master; git pull origin master'
alias main='git checkout main; git pull origin main'
alias gcl='git clone'

# cdの後にlsする
cdls ()
{
    \cd "$@" && ls
}
alias cd="cdls"


# =========================================================
# zplug
# =========================================================
source $ZPLUG_HOME/init.zsh

# 1. 先に prezto を初期化
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Plugin
zplug "b4b4r07/enhancd", use:init.sh
zplug 'dracula/zsh', as:theme
zplug "plugins/git",   from:oh-my-zsh
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "mrowa44/emojify", as:command
# history関係
zplug "zsh-users/zsh-history-substring-search"
# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

if ! zplug check; then
    zplug install
fi

zplug load
