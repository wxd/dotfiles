#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "src/os/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # ' At first you're like "shellcheck is awesome" but then you're
    #   like "wtf are we still using bash" '.
    #
    #  (from: https://twitter.com/astarasikov/status/568825996532707330)

    find \
        ./src/os \
        ./src/shell \
        -type f \
        ! -path './src/shell/curlrc' \
        ! -path './src/shell/inputrc' \
        ! -path './src/shell/screenrc' \
        ! -path './src/shell/wgetrc' \
        ! -path './src/os/preferences/macos/*.applescript' \
        ! -path './src/os/preferences/macos/*.terminal' \
        ! -path './src/os/preferences/macos/RectangleConfig.json' \
        ! -path './src/os/preferences/hosts' \
        ! -path './src/os/preferences/Preferences.sublime-settings' \
        -exec shellcheck \
                -e SC1090 \
                -e SC1091 \
                -e SC2155 \
                -e SC2164 \
        {} +

    print_result $? "Run code through ShellCheck"

}

main
