#!/bin/sh

echo '現在使用しているシェルを確認します'
echo $SHELL

sudo sh -c "echo /usr/local/bin/zsh >> /etc/shells"

echo 'ログインシェルを変更します'
chsh -s /usr/local/bin/zsh

