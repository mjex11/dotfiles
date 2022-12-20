#!/bin/sh

DOTFILES_DIR="$HOME/dotfiles"

ln -snfv "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -snfv "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
ln -snfv "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -snfv "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
ln -snfv "$DOTFILES_DIR/hammerspoon_init.lua" "$HOME/.hammerspoon/init.lua"

