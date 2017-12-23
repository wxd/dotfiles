#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode.sh
./homebrew.sh
./bash.sh

./browsers.sh
./git.sh
./image_tools.sh
./misc.sh
./misc_tools.sh
./tmux.sh
./video_tools.sh

./cleanup.sh
