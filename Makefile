# Do everything.
all: init link brew shell

# Set initial preference.
init:
	make/init.sh

# Link dotfiles.
link:
	make/link.sh

# Install macOS applications.
brew:
	make/brew.sh

# Set zsh
shell:
	make/set_zsh.sh

