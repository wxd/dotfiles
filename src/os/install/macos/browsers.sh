#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install "Chrome" "google-chrome" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install "Flash" "flash-npapi" "caskroom/cask" "cask"
