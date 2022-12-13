# Do everything.
all: init link shell brew

# Set initial preference.
init:
    make/init.sh

# Link dotfiles.
link:
    make/link.sh

# Set zsh
shell:
    make/set_zsh.sh

# Install macOS applications.
brew:
    make/brew.sh

