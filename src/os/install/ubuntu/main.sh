#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

update
upgrade

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Development essentials \n\n"

install_package "Build Essential"    "build-essential" 
install_package "GnuPG archive keys" "debian-archive-keyring"
install_package "Git"                "git"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Multimedia \n\n"

install_package "ImageMagick" "imagemagick"
install_package "EXIF tool"   "libimage-exiftool-perl"
install_package "VLC"         "vlc"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous tools \n\n"

install_package "cURL"       "curl"
install_package "xclip"      "xclip"
install_package "ShellCheck" "shellcheck"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Cleanup\n\n"

autoremove
