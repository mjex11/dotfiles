#!/bin/sh

echo "deinをインストールします"
if [ -e $HOME/.cache/dein/repos/github.com/Shougo/dein.vim ];then
  sh -c "$(curl -fssl https://raw.githubusercontent.com/shougo/dein.vim/master/bin/installer.sh)"
fi

