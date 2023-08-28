#!/bin/zsh

cd "$HOME"

system_type="$(uname -s)"

if [ "$system_type" != "Darwin" ]; then
	echo "Only macOS is supported at the moment"
	exit 1
fi

xcode-select --install
read -p "Press enter to continue when Xcode CLT installation is finished"

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

if ! command -v brew >/dev/null 2>&1; then
	echo "Installing homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ -f "$HOME/.Brewfile" ]; then
	echo "Updating homebrew bundle"
	brew bundle install --global
	brew cleanup --prune-all
fi

if [ -d "$HOME/.iterm2" ]; then
	echo "Setting iTerm preference folder"
	defaults write com.googlecode.iterm2 PrefsCustomFolder "$HOME/.iterm2"
	defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
fi

# set up macOS defaults
# https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh

echo "Done. Note that some changes require a logout/restart to take effect."
