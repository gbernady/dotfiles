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

# System Preferences > General > Language & Region
defaults write ".GlobalPreferences_m" AppleLanguages -array en-PL pl-PL
defaults write -globalDomain AppleLanguages -array en-PL pl-PL

# System Preferences > Appearance
defaults write -globalDomain AppleInterfaceStyleSwitchesAutomatically -bool true

# System Preferences > Control Centre
defaults write "com.apple.airplay" showInMenuBarIfPresent -bool false
defaults write "com.apple.airplay" "NSStatusItem Visible NowPlaying" -bool false
defaults -currentHost write com.apple.Spotlight MenuItemHidden -int 1
defaults write com.apple.Siri SiriPrefStashedStatusMenuVisible -bool false

# System Preferences > Desktop & Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock mru-spaces -bool false
# defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$myapp</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"

# System Preferences > Lock Screen
defaults -currentHost write com.apple.screensaver idleTime -int 0

# System Preferences > Keyboard
defaults write -globalDomain KeyRepeat -int 5
defaults write -globalDomain InitialKeyRepeat -int 30

# System Preferences > Trackpad
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 2

# Finder > Preferences
defaults write com.apple.finder FXLastSearchScope "SCcf"
defaults write com.apple.finder FXPreferredSearchViewStyle -string "clmv"
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
# defaults write com.apple.finder DesktopViewSettings "" # GroupBy = Kind; IconViewSettings/arrangeBy = dateAdded

for app in "Dock" "Finder"; do
	killall "${app}" > /dev/null 2>&1
done

echo "Done. Note that some changes require a logout/restart to take effect."
