#!/bin/sh

DOTFILES_DIR="$HOME/dotfiles"

ln -fs "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -fs "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
ln -fs "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -fs "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
ln -fs "$DOTFILES_DIR/ssh-host-color.sh" "$HOME/ssh-host-color.sh"

