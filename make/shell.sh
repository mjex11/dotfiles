#!/bin/sh

echo '現在使用しているシェルを確認します'
echo $SHELL

if [[ $(uname -p) == 'arm' ]] ; then
  SHELL_DIR='/opt/homebrew/bin/zsh'
else
  SHELL_DIR='/usr/local/bin/zsh'
fi

if [ -z $(grep $SHELL_DIR /etc/shells) ]; then
  echo ${SHELL_DIR} | sudo tee -a /etc/shells
fi

echo 'ログインシェルを変更します'

sudo chsh -s ${SHELL_DIR}
