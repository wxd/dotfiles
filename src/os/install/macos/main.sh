#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode.sh
./homebrew.sh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ask_for_sudo # "Homebrew explicitly invalidates the sudo timestamp"
             # (https://gist.github.com/cowboy/3118588#gistcomment-2016660)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./bash.sh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers \n"

brew_install "Chrome" "google-chrome" "caskroom/cask" "cask"
brew_install "Flash"  "flash-npapi"   "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Git \n\n"
brew_install "Git" "git"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Multimedia \n\n"

brew_install "ImageMagick" "imagemagick"
brew_install "EXIF tool"   "exiftool"
brew_install "FFmpeg"      "ffmpeg"

brew_install "ImageOptim"  "imageoptim" "caskroom/cask" "cask"
brew_install "LICEcap"     "licecap"    "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous tools \n\n"

brew_install "rename"     "rename"
brew_install "ShellCheck" "shellcheck"

brew_install "Spectacle"      "spectacle"      "caskroom/cask" "cask"
brew_install "Sublime Text 3" "sublime-text"   "caskroom/cask" "cask"
brew_install "Transmission"   "transmission"   "caskroom/cask" "cask"
brew_install "Unarchiver"     "the-unarchiver" "caskroom/cask" "cask"
brew_install "VLC"            "vlc"            "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Quick Look\n\n"

brew_install "JSON"     "quicklook-json" "caskroom/cask" "cask"
brew_install "Markdown" "qlmarkdown"     "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Cleanup \n\n"

brew_cleanup

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ask_for_sudo # "Homebrew explicitly invalidates the sudo timestamp"
