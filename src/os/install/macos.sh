#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./macos/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./macos/xcode.sh
./macos/homebrew.sh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ask_for_sudo # "Homebrew explicitly invalidates the sudo timestamp"
             # (https://gist.github.com/cowboy/3118588#gistcomment-2016660)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./macos/bash.sh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Command-line tools \n"

brew install \
  azure-cli \
  bat \
  colima \
  cookiecutter \
  coreutils \
  docker \
  docker-buildx \
  docker-completion \
  docker-compose \
  exiftool \
  gawk \
  gcc \
  git \
  git-lfs \
  gnu-getopt \
  gnu-sed \
  graphviz \
  hilite \
  htop \
  jq \
  make \
  moreutils \
  ncdu \
  noti \
  pre-commit \
  pstree \
  python@3.12 \
  rename \
  shellcheck \
  ssh-copy-id \
  tldr \
  watch \
  wget \
  youtube-dl


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   GUI applications \n"

brew install \
  1password \
  1password-cli \
  displaylink \
  firefox \
  google-chrome \
  microsoft-auto-update \
  microsoft-office \
  microsoft-teams \
  pycharm \
  rectangle \
  slack \
  sourcetree \
  sublime-text \
  the-unarchiver \
  vlc


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   QuickLook plug-ins \n"

brew install \
  qlmarkdown \
  quicklook-json


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Fonts \n"

brew tap homebrew/cask-fonts

brew install font-fira-code


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Cleanup \n\n"

execute "brew cleanup" "Homebrew (cleanup)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ask_for_sudo  # "Homebrew explicitly invalidates the sudo timestamp"
