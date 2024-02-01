#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"


function configure_ubuntu() {
  configure_privacy
  configure_terminal
  configure_ui_and_ux
}


function configure_privacy() {
  print_in_purple "\n   Privacy\n\n"

  execute "gsettings set com.canonical.Unity.Lenses remote-content-search 'none'" \
      "Turn off 'Remote Search' so that search terms in Dash do not get sent over the internet"

  execute "gsettings set com.canonical.Unity.ApplicationsLens display-available-apps false" \
      "Disable Dash 'More suggestions' section"
}


function configure_terminal() {
  print_in_purple "\n   Terminal\n\n"

  execute "gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 12'" \
      "Change font size to 12"

  execute "gconftool-2 --set '/apps/gnome-terminal/profiles/Default/use_theme_background' --type bool false && \
           gconftool-2 --set '/apps/gnome-terminal/profiles/Default/use_theme_colors' --type bool false && \
           gconftool-2 --set '/apps/gnome-terminal/profiles/Default/palette' --type string '#070736364242:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3' && \
           gconftool-2 --set '/apps/gnome-terminal/profiles/Default/background_color' --type string '#00002B2B3636' && \
           gconftool-2 --set '/apps/gnome-terminal/profiles/Default/foreground_color' --type string '#65657B7B8383'" \
      "Set custom terminal theme"
}


function configure_ui_and_ux() {
  print_in_purple "\n   UI & UX\n\n"

  execute "gsettings set com.canonical.indicator.bluetooth visible false" \
      "Hide bluetooth icon from the menu bar"

  # execute "gsettings set com.canonical.indicator.sound visible false" \
  #     "Hide volume icon from the menu bar"

  execute "gsettings set com.canonical.indicator.power icon-policy 'charge' && \
           gsettings set com.canonical.indicator.power show-time false" \
      "Hide battery icon from the menu bar when the battery is not in use"

  execute "gsettings set com.canonical.indicator.datetime custom-time-format '%l:%M %p' && \
           gsettings set com.canonical.indicator.datetime time-format 'custom'" \
      "Use custom date format in the menu bar"

  execute "gsettings set org.gnome.desktop.background picture-options 'stretched'" \
      "Set desktop background image options"

  execute "gsettings set org.gnome.libgnomekbd.keyboard layouts \"[ 'us', 'ru' ]\"" \
      "Set keyboard languages"

  execute "gsettings set com.canonical.Unity.Launcher favorites \"[
              'ubiquity-gtkui.desktop',
              'nautilus-home.desktop'
           ]\"" \
      "Set Launcher favorites"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

configure_ubuntu
