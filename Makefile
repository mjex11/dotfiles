# Do everything.
all: init brew link shell vim

# Set initial preference.
init:
	shells/init.sh

# Install macOS applications.
brew:
	shells/brew.sh

# Link dotfiles.
link:
	shells/link.sh

# Set zsh
shell:
	shells/shell.sh

# Set Vim preference.
vim:
	shells/vim.sh

