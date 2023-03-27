#!/bin/sh

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# M1でbrewコマンドを使えるようにする
if [[ $(uname -p) == 'arm' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew cleanup
brew doctor

echo "Homebrewからアプリをインストールします"
brew bundle --file './shells/Brewfile'
