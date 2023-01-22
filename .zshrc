
export LANG=ja_JP.UTF-8
export LANGUAGE=ja

export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

# コマンド(含内部コマンド)入力中にマニュアルを表示できる：M-h
[ -n "`alias run-help`" ] && unalias run-help
autoload -U run-help

umask 022

# alias
if [ -f ~/.zaliases ] ; then
    source ~/.zaliases
fi


unset XTITLE
unset ESC
unset BELL

# Some environment variables
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
export USER=$USERNAME
export HOSTNAME=$HOST

export PATH=$HOME/bin:$PATH
export PATH=$HOME/bin/.pyenv/bin:$PATH
export PYENV_ROOT=$HOME/bin/.pyenv
### bindkey
# bindkey -v             # vi key bindings
bindkey -e               # emacs key bindings

## Bindkey you may think it's usefull
bindkey ' ' magic-space  # also do history expansino on space
bindkey -s "^xs" '\C-e"\C-asu -c "'
#bindkey -s "^xd" "$(date '+-%d_%b')"
bindkey -s "^xd" "$(date '+-%Y%m%d')"
#bindkey -s "^xf" "$(date '+-%D'|sed 's|/||g')"
bindkey -s "^xp" "\$(pwd\)/"
bindkey -s "^xw" "\C-a \$(which \C-e\)\C-a"
bindkey "^[[Z" reverse-menu-complete #Shift-Tabで補完候補を逆順に

# ctrl+j で コマンドの途中からヒストリを呼び出す
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^J" history-beginning-search-backward-end

#if ( which dircolors >& /dev/null ); then
#    if [ -f ~/.dircolors ] ; then
#	eval `dircolors --sh ~/.dircolors`
#    fi
#    export LS_COLORS="${LS_COLORS}:*~=01;42:*#=01;42:*%=01;42"
#else

# lsの色の設定
#export LS_COLORS="\
#*~=32;1:*#=32;1:*%=32;1:\
#*README=31;4:*eadme=31;4:\
#*.c=31:*.cc=31:*.cpp=31:*.C=31:*.cxx=31:*.h=31:*.o=32:*Makefile=31;43:\
#*.html=31:*.htm=31:*.shtml=31:*.tex=31:*.lyx=31:*.mgp=31:*.pl=31:*.for=31:\
#*.tar=01;31:*.tgz=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.rpm=01;31:*.lzh=01;31:*.zip=01;31:\
#*.jpg=35:*.jpeg=35:*.gif=35:*.bmp=35:*.JPG=35:*.JPEG=35:*.GIF=35:*.BMP=35:\
#*.eps=35:*.ppm=35:*.xbm=35:*.xpm=35:*.tif=35:\
#*.mpg=01;37:*.mpeg=01;37:*.avi=01;37:*.MPG=01;37:*.MPEG=01;37:*.AVI=01;37:\
#or=31;7"
#fi

# Color completion.
export ZLS_COLORS=$LS_COLORS
zmodload -ui complist

###
# Set shell options

# 親プロセスが死んでも子プロセスが死なない
setopt nohup

# コマンドを訂正して下さる
setopt correct

# ファイル名も訂正して下さる
setopt correct_all

# 複数のタームで実行したコマンドのヒストリを共有化する
setopt share_history

# 直前と同じコマンドを入力した場合，ヒストリに入れない
setopt hist_ignore_dups

# コマンドの不要な空白を削除してヒストリに登録
setopt hist_reduce_blanks

# historyコマンドをヒストリに登録しない
setopt hist_no_store

setopt hist_ignore_space
# コマンドの開始時間，経過時間をヒストリに保存
setopt extended_history

# エラーの際のビープ音を鳴らさない
setopt no_beep

#「#」 「~」 「^」を特殊文字として使用する
setopt extended_glob
#
# 補完候補をスッキリ表示
setopt list_packed
# directory末尾の/を補完
setopt auto_param_slash
setopt mark_dirs


# cd を省略
setopt auto_cd

# 日本語のファイル名も補完リストで表示
setopt print_eight_bit

# rm で * を使う際に聞き返してこない
setopt rm_star_silent

# ファイル名中の数字を数字としてソート
setopt numeric_glob_sort
# コマンド(含内部コマンド)入力中にマニュアルを表示できる：M-h
# -n "`alias run-help`" ] && unalias run-help
#AUTOLOAD -U run-help

#umask 022

# alias
if [ -f ~/.zaliases ] ; then
    source ~/.zaliases
fi

### prompt
setopt prompt_subst
PROMPTCOLOR=31
ESC=$(print -Pn '\e')
BELL=$(print -Pn '\a')

# タイトルの設定
case $TERM in
dumb|emacs|sun) unset XTITLE ;;
vt100|[Exk]term*|rxvt|cygwin)
	XTITLE=$ESC']2;$TERM %n@%m:%~'$BELL$ESC']1;%m:%.'$BELL
;;
screen)	XTITLE=$ESC'k%n@%m:%.'$ESC\\ ;;
esac

# ターム内のプロンプトの設定
#case $TERM in
#dumb|emacs|sun) PROMPT='%n@%m:%3~ %(!.#.$) ' ;;
#*)
#if ( which sed >& /dev/null )
#then
#    name_s=`echo $USER | sed 's/\(^....\).*$/\1/'`
#    host_s=`echo $HOST | sed 's/\(^...\).*$/\1/'`
#else
#    name_s=`echo $USER`
#    host_s=`echo $HOST`
#fi
#if [ "`hostname`" = "easter" ]
#then
#    PROMPT="$"
#elif [[ $TERM = "cygwin" ]]
#then
#   PROMPT='%{'$XTITLE'[$[31+$RANDOM % 6]m%}$name_s@$host_s:%2~%(!.#.$)%{[m%} '
#    RPROMPT='%{'$XTITLE'[$[31+$RANDOM % 6]m%}$%7~%{[m%} '
#else
#    PROMPT='%{'$XTITLE'[m%}$name_s@$host_s:%4~%(!.#.$) '
#fi
#;;
#esac
RPROMPT='[%n@%B%F{46}%m%f%b]'
PROMPT='%K{28}%F{190}%~%f%k $'

autoload -U compinit
compinit
zstyle ':completion:*' list-colors "${LS_COLORS}" # 補完候補のカラー表示

# syntax highlighting
source ~/bin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=46
ZSH_HIGHLIGHT_STYLES[alias]=fg=46
ZSH_HIGHLIGHT_STYLES[builtin]=fg=46
ZSH_HIGHLIGHT_STYLES[function]=fg=46
ZSH_HIGHLIGHT_STYLES[command]=fg=46

# vcs (show git branch)
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats "[%s:%F{208}%b%f]"
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'


python ~/misx/inshi.py
#eval "$(pyenv init)"
export LS_COLORS="di=93:\
*~=32;1:*#=32;1:*%=32;1:\
*README=31;4:*eadme=31;4:\
*.c=31:*.cc=31:*.cpp=31:*.C=31:*.cxx=31:*.h=31:*.o=32:*Makefile=31;43:\
*.html=31:*.htm=31:*.shtml=31:*.tex=31:*.lyx=31:*.mgp=31:*.pl=31:*.for=31:\
*.tar=01;31:*.tgz=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.rpm=01;31:*.lzh=01;31:*.zip=01;31:\
*.jpg=35:*.jpeg=35:*.gif=35:*.bmp=35:*.JPG=35:*.JPEG=35:*.GIF=35:*.BMP=35:\
*.eps=35:*.ppm=35:*.xbm=35:*.xpm=35:*.tif=35:\
*.mpg=01;37:*.mpeg=01;37:*.avi=01;37:*.MPG=01;37:*.MPEG=01;37:*.AVI=01;37:\
or=31;7"
#
export PYENV_ROOT="$HOME/bin/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH=$PATH:/usr/local/go/bin
eval "$(starship init zsh)"

# kubectl
source <(kubectl completion zsh)
alias k=kubectl
compdef __start_kubectl k

