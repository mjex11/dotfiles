# M1でbrewを使用する時に必要
if [[ $(uname -p) == 'arm' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# setup zsh-comletions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# ssh接続先によって、背景色を変える(補完を呼び出すのを忘れずに)
alias ssh=$HOME/.ssh/ssh-host-color.sh
compdef _ssh $HOME/.ssh/ssh-host-color.sh=ssh

# alias
alias ls='gls -AF --color=auto'
alias ll='gls -lAFhr --group-directories-first --color=auto'
alias vs='open -a Visual\ Studio\ Code'
alias vi='vim'

# cdしたらls
chpwd () { ls }

# コマンドミスを修正
setopt correct

# ヒープ音を消す
setopt NO_BEEP


# history
setopt histignorealldups # ヒストリーに重複を表示しない
setopt hist_ignore_dups  # 連続した同じコマンドを記録しない
setopt extended_history  # タイムスタンプを記録
setopt share_history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 補完候補に色を付ける
zstyle ':completion:*' list-colors "${LS_COLORS}"
# 選択している補完候補に背景色を付ける
zstyle ':completion:*:default' menu select=2
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# starship
eval "$(starship init zsh)"

source /Users/y.goto/.docker/init-zsh.sh || true # Added by Docker Desktop
export PATH=$HOME/.nodebrew/current/bin:$PATH

eval "$(rbenv init -)"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=/opt/homebrew/opt/postgresql@13/bin:$PATH
