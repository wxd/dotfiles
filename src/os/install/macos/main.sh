#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode.sh
./homebrew.sh

ask_for_sudo # "Homebrew explicitly invalidates the sudo timestamp"
             # (https://gist.github.com/cowboy/3118588#gistcomment-2016660)

./bash.sh

./browsers.sh
./git.sh
./image_tools.sh
./misc.sh
./misc_tools.sh
./tmux.sh
./video_tools.sh

./cleanup.sh

ask_for_sudo # "Homebrew explicitly invalidates the sudo timestamp"
