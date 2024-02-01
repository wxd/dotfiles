#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    || exit 1

# ----------------------------------------------------------------------
# | Helper Functions                                                   |
# ----------------------------------------------------------------------

install_package() {

    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    if ! package_is_installed "$PACKAGE"; then
        execute "sudo apt-get install --allow-unauthenticated -qqy $PACKAGE" "$PACKAGE_READABLE_NAME"
        #                                      suppress output ─┘│
        #            assume "yes" as the answer to all prompts ──┘
    else
        print_success "$PACKAGE_READABLE_NAME"
    fi

}

package_is_installed() {
    dpkg -s "$1" &> /dev/null
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Resynchronize the package index files from their sources.
execute "sudo apt-get update -qqy" "APT (update)"

# Install the newest versions of all packages installed.
execute "export DEBIAN_FRONTEND=\"noninteractive\" \
         && sudo apt-get -o Dpkg::Options::=\"--force-confnew\" upgrade -qqy" \
    "APT (upgrade)"

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

# Remove packages that were automatically installed to satisfy
# dependencies for other packages and are no longer needed.
execute "sudo apt-get autoremove -qqy" "APT (autoremove)"
