#!/bin/bash
#
# (1) copy to: ~/bin/ssh-host-color 
# (2) set:     alias ssh=~/bin/ssh-host-color
#
# Inspired from http://talkfast.org/2011/01/10/ssh-host-color
# Inspired from https://dev.classmethod.jp/etc/do-ssh-and-change-bg-color-iterm2
# Fork from https://gist.github.com/773849
#

CMD_SSH=/usr/bin/ssh

set_term_bgcolor(){
  echo -ne '\033]1337;SetColors=bg='$1'\a'
}

# RGB指定
BGCOLOR_PROD=200
BGCOLOR_ST=002
BGCOLOR_CT=202
BGCOLOR_IT=020
BGCOLOR_ET=022
BGCOLOR_OTHER=220
BGCOLOR_BLACK=000

# 環境別に色を設定
if [[ "$@" =~ prod- ]]; then
  set_term_bgcolor $BGCOLOR_PROD
elif [[ "$@" =~ ctl- ]]; then
  set_term_bgcolor $BGCOLOR_PROD
elif [[ "$@" =~ st- ]]; then
  set_term_bgcolor $BGCOLOR_ST
elif [[ "$@" =~ ct- ]]; then
  set_term_bgcolor $BGCOLOR_CT
elif [[ "$@" =~ it- ]]; then
  set_term_bgcolor $BGCOLOR_IT
elif [[ "$@" =~ et- ]]; then
  set_term_bgcolor $BGCOLOR_ET
else
  set_term_bgcolor $BGCOLOR_OTHER
fi

# SSH Connect
$CMD_SSH "$@"

# 元(黒)に戻す
set_term_bgcolor $BGCOLOR_BLACK

