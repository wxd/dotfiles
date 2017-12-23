#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Image Tools\n\n"

brew_install "ImageMagick" "imagemagick --with-webp"
brew_install "ImageOptim" "imageoptim" "caskroom/cask" "cask"
brew_install "LICEcap" "licecap" "caskroom/cask" "cask"
brew_install "EXIF tool" "exiftool"
