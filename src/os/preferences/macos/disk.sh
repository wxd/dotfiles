#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Disk tweaks\n\n"

execute "defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true" \
    "Prevent Time Machine from prompting to use new hard drives as backup volume"

execute "sudo tmutil disablelocal" "Disable local Time Machine snapshots"

execute "sudo pmset -a hibernatemode 0" \
    "Disable hibernation (speeds up entering sleep mode)"

execute "sudo rm /Private/var/vm/sleepimage && \
            sudo touch /Private/var/vm/sleepimage && \
            sudo chflags uchg /Private/var/vm/sleepimage" \
    "Delete and prevent creation of the sleep image file"

execute "sudo pmset -a sms 0" "Disable the sudden motion sensor"

execute "sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array '/Volumes'" \
    "Disable indexing any mounted volumes that have not been indexed before"
