# Do everything.
all: init brew link shell vim

# Set initial preference.
init:
	make/init.sh

# Install macOS applications.
brew:
	make/brew.sh

# Link dotfiles.
link:
	make/link.sh

# Set zsh
shell:
	make/shell.sh

# Set Vim preference.
vim:
	make/vim.sh

