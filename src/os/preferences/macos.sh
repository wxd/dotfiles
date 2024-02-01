#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"


function configure_macos() {
  # Close any open `System Preferences` panes in order to
  # avoid overriding the preferences that are being changed.
  osascript -e 'tell application "System Preferences" to quit'

  configure_app_store
  configure_chrome
  configure_dashboard
  configure_dock
  configure_finder
  configure_keyboard
  configure_language_and_region
  configure_maps
  configure_photos
  configure_safari
  configure_terminal
  configure_text_editors
  configure_trackpad
  configure_ui_and_ux
  configure_disk
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function configure_app_store() {
  print_in_purple "\n   App Store\n\n"

  execute "defaults write com.apple.appstore ShowDebugMenu -bool true" \
      "Enable debug menu"

  execute "defaults write com.apple.commerce AutoUpdate -bool false" \
      "Turn off auto-update"

  execute "defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true" \
      "Enable automatic update check"

  execute "defaults write com.apple.SoftwareUpdate AutomaticDownload -int 0" \
      "Do not download newly available updates in background"

  execute "defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1" \
      "Install System data files and security updates"

  killall "App Store" &> /dev/null
}


function configure_chrome() {
  print_in_purple "\n   Chrome\n\n"

  # execute "defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false" \
  #     "Disable backswipe"

  execute "defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true" \
      "Expand print dialog by default"

  execute "defaults write com.google.Chrome DisablePrintPreview -bool true" \
      "Use system-native print preview dialog"

  killall "Google Chrome" &> /dev/null
}


function configure_dashboard() {
  print_in_purple "\n   Dashboard\n\n"

  execute "defaults write com.apple.dashboard mcx-disabled -bool true" \
      "Disable Dashboard"

  # `killall Dashboard` doesn't actually do anything. To apply the
  # changes for `Dashboard`, `killall Dock` is enough as `Dock` is
  # `Dashboard`'s parent process.
  killall "Dock" &> /dev/null
}


function configure_dock() {
  print_in_purple "\n   Dock\n\n"

  execute "defaults write com.apple.dock autohide -bool true" \
      "Automatically hide/show the Dock"

  execute "defaults write com.apple.dock autohide-delay -float 0.1" \
      "Set a short Dock delay"

  execute "defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true" \
      "Enable spring loading for all Dock items"

  execute "defaults write com.apple.dock expose-animation-duration -float 0.1" \
      "Make all Mission Control related animations faster."

  execute "defaults write com.apple.dock expose-group-by-app -bool false" \
      "Do not group windows by application in Mission Control"

  execute "defaults write com.apple.dock launchanim -bool false" \
      "Disable the opening of an application from the Dock animations."

  execute "defaults write com.apple.dock mineffect -string 'scale'" \
      "Change minimize/maximize window effect"

  execute "defaults write com.apple.dock minimize-to-application -bool true" \
      "Reduce clutter by minimizing windows into their application icons"

  execute "defaults write com.apple.dock mru-spaces -bool false" \
      "Do not automatically rearrange spaces based on most recent use"

  execute "defaults write com.apple.dock persistent-apps -array && \
           defaults write com.apple.dock persistent-others -array " \
      "Wipe all app icons"

  execute "defaults write com.apple.dock show-process-indicators -bool false" \
      "Don't show indicator lights for open applications"

  execute "defaults write com.apple.dock showhidden -bool true" \
      "Make icons of hidden applications translucent"

  execute "defaults write com.apple.dock tilesize -int 128" \
      "Set icon size"

  execute "defaults write com.apple.dock show-recents -bool false" \
      "Don’t show recent applications in Dock"

  killall "Dock" &> /dev/null
}


function configure_finder() {
  print_in_purple "\n   Finder\n\n"

  # execute "defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true && \
  #          defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true && \
  #          defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true" \
  #     "Automatically open a new Finder window when a volume is mounted"

  execute "defaults write com.apple.finder _FXShowPosixPathInTitle -bool true" \
      "Use full POSIX path as window title"

  execute "defaults write com.apple.finder DisableAllAnimations -bool true" \
      "Disable all animations"

  # execute "defaults write com.apple.finder WarnOnEmptyTrash -bool false" \
  #     "Disable the warning before emptying the Trash"

  execute "defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'" \
      "Search the current directory by default"

  execute "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false" \
      "Disable warning when changing a file extension"

  execute "defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'" \
      "Use list view in all Finder windows by default"

  # execute "defaults write com.apple.finder NewWindowTarget -string 'PfDe' && \
  #          defaults write com.apple.finder NewWindowTargetPath -string 'file://$HOME/Desktop/'" \
  #     "Set 'Desktop' as the default location for new Finder windows"

  execute "defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true && \
           defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true && \
           defaults write com.apple.finder ShowMountedServersOnDesktop -bool true && \
           defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true" \
      "Show icons for hard drives, servers, and removable media on the desktop"

  execute "defaults write com.apple.finder ShowRecentTags -bool false" \
      "Do not show recent tags"

  execute "defaults write -g AppleShowAllExtensions -bool true" \
      "Show all filename extensions"

  execute "chflags nohidden ~/Library" "chflags nohidden ~/Library"

  execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:iconSize 72' ~/Library/Preferences/com.apple.finder.plist && \
           /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:iconSize 72' ~/Library/Preferences/com.apple.finder.plist" \
      "Set icon size"

  execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:gridSpacing 1' ~/Library/Preferences/com.apple.finder.plist && \
           /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:gridSpacing 1' ~/Library/Preferences/com.apple.finder.plist" \
      "Set icon grid spacing size"

  execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:textSize 13' ~/Library/Preferences/com.apple.finder.plist && \
           /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:textSize 13' ~/Library/Preferences/com.apple.finder.plist" \
      "Set icon label text size"

  execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:labelOnBottom true' ~/Library/Preferences/com.apple.finder.plist && \
           /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:labelOnBottom true' ~/Library/Preferences/com.apple.finder.plist" \
      "Set icon label position"

  execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:showItemInfo true' ~/Library/Preferences/com.apple.finder.plist && \
           /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:showItemInfo true' ~/Library/Preferences/com.apple.finder.plist" \
      "Show item info"

  execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:arrangeBy none' ~/Library/Preferences/com.apple.finder.plist && \
           /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:arrangeBy none' ~/Library/Preferences/com.apple.finder.plist" \
      "Set sort method"

  killall "Finder" &> /dev/null

  # Starting with Mac OS X Mavericks preferences are cached,
  # so in order for things to get properly set using `PlistBuddy`,
  # the `cfprefsd` process also needs to be killed.
  #
  # https://github.com/alrra/dotfiles/commit/035dda057ddc6013ba21db3d2c30eeb51ba8f200
  killall "cfprefsd" &> /dev/null
}


function configure_keyboard() {
  print_in_purple "\n   Keyboard\n\n"

  execute "defaults write -g AppleKeyboardUIMode -int 3" \
      "Enable full keyboard access for all controls"

  # execute "defaults write -g ApplePressAndHoldEnabled -bool false" \
  #     "Disable press-and-hold in favor of key repeat"

  execute "defaults write -g 'InitialKeyRepeat_Level_Saved' -int 10" \
      "Set delay until repeat"

  execute "defaults write -g KeyRepeat -int 1" \
      "Set the key repeat rate to fast"

  execute "defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false" \
      "Disable automatic capitalization"

  execute "defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false" \
      "Disable automatic correction"

  execute "defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false" \
      "Disable automatic period substitution"

  #  execute "defaults write -g NSAutomaticDashSubstitutionEnabled -bool false" \
  #      "Disable smart dashes"

  #  execute "defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false" \
  #      "Disable smart quotes"
}


function configure_language_and_region() {
  print_in_purple "\n   Language & Region\n\n"

  execute "defaults write -g AppleLanguages -array 'en'" \
      "Set language"

  execute "defaults write -g AppleMeasurementUnits -string 'Centimeters'" \
      "Set measurement units"

  execute "defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false" \
      "Disable auto-correct"
}


function configure_maps() {
  print_in_purple "\n   Maps\n\n"

  execute "defaults write com.apple.Maps LastClosedWindowViewOptions '{
              localizeLabels = 1;   // show labels in English
              mapType = 11;         // show hybrid map
              trafficEnabled = 0;   // do not show traffic
           }'" \
      "Set view options"

  killall "Maps" &> /dev/null
}


function configure_photos() {
  print_in_purple "\n   Photos\n\n"

  execute "defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true" \
      "Prevent Photos from opening automatically when devices are plugged in"

  killall "Photos" &> /dev/null
}


function configure_safari() {
  print_in_purple "\n   Safari\n\n"

  execute "defaults write com.apple.Safari AutoOpenSafeDownloads -bool false" \
      "Disable opening 'safe' files automatically"

  execute "defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true" \
      "Set backspace key to go to the previous page in history"

  execute "defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
           defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
           defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true" \
      "Enable the 'Develop' menu and the 'Web Inspector'"

  execute "defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false" \
      "Set search type to 'Contains' instead of 'Starts With'"

  execute "defaults write com.apple.Safari HomePage -string 'about:blank'" \
      "Set home page to 'about:blank'"

  execute "defaults write com.apple.Safari IncludeInternalDebugMenu -bool true" \
      "Enable 'Debug' menu"

  execute "defaults write com.apple.Safari ShowFavoritesBar -bool false" \
      "Hide bookmarks bar by default"

  execute "defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true" \
      "Show the full URL in the address bar"

  execute "defaults write com.apple.Safari SuppressSearchSuggestions -bool true && \
           defaults write com.apple.Safari UniversalSearchEnabled -bool false" \
      "Don’t send search queries to Apple"

  execute "defaults write -g WebKitDeveloperExtras -bool true" \
      "Add a context menu item for showing the 'Web Inspector' in web views"

  execute "defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25" \
      "Disable the standard delay in rendering a web page."

  killall "Safari" &> /dev/null
}


function configure_terminal() {
  print_in_purple "\n   Terminal\n\n"

  #  execute "defaults write com.apple.terminal FocusFollowsMouse -string true" \
  #      "Make the focus automatically follow the mouse"

  execute "defaults write com.apple.terminal SecureKeyboardEntry -bool true" \
      "Enable 'Secure Keyboard Entry'"

  execute "defaults write com.apple.Terminal ShowLineMarks -int 0" \
      "Hide line marks"

  execute "defaults write com.apple.terminal StringEncodings -array 4" \
      "Only use UTF-8"

  execute "./set_terminal_theme.applescript" \
      "Set custom terminal theme"
}


function configure_text_editors() {
  print_in_purple "\n   TextEdit\n\n"

  execute "defaults write com.apple.TextEdit PlainTextEncoding -int 4 && \
           defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4" \
      "Open and save files as UTF-8 encoded"

  execute "defaults write com.apple.TextEdit RichText 0" \
      "Use plain text mode for new documents"

  killall "TextEdit" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_purple "\n   TextEdit\n\n"

  link "../Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
}


function configure_trackpad() {
  print_in_purple "\n   Trackpad\n\n"

  #  execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true && \
  #           defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1 && \
  #           defaults write -g com.apple.mouse.tapBehavior -int 1 && \
  #           defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1" \
  #      "Enable 'Tap to click'"

  execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true && \
           defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 1 && \
           defaults -currentHost write -g com.apple.trackpad.enableSecondaryClick -bool true && \
           defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0 && \
           defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0 && \
           defaults -currentHost write -g com.apple.trackpad.trackpadCornerClickBehavior -int 0" \
      "Map 'click or tap with two fingers' to the secondary click"
}


function configure_ui_and_ux() {
  print_in_purple "\n   UI & UX\n\n"

  execute "defaults write com.apple.screensaver askForPassword -int 1 && \
           defaults write com.apple.screensaver askForPasswordDelay -int 5" \
     "Require password 5 seconds after sleep or screen saver begins"

  execute "defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false" \
     "Disable Menu bar transparency"

  execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true && \
           defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true" \
     "Avoid creating '.DS_Store' files on network or USB volumes"

  execute "defaults write com.apple.menuextra.battery ShowPercent -string 'YES'" \
      "Show battery percentage from the menu bar"

  execute "sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true" \
      "Show language menu in the top right corner of the boot screen"

  execute "sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName" \
      "Show technical details on clicking the clock in the login window"

  execute "defaults write com.apple.CrashReporter UseUNC 1" \
      "Make crash reports appear as notifications"

  execute "defaults write com.apple.LaunchServices LSQuarantine -bool false" \
      "Disable 'Are you sure you want to open this application?' dialog"

  execute "defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true" \
      "Automatically quit the printer app once the print jobs are completed"

  execute "defaults write com.apple.screencapture disable-shadow -bool true" \
      "Disable shadow in screenshots"

  execute "defaults write com.apple.screencapture location -string '$HOME/Desktop'" \
      "Save screenshots to the Desktop"

  execute "defaults write com.apple.screencapture type -string 'png'" \
      "Save screenshots as PNGs"

  execute "defaults write com.apple.screensaver askForPassword -int 1 && \
           defaults write com.apple.screensaver askForPasswordDelay -int 0"\
      "Require password immediately after into sleep or screen saver mode"

  execute "defaults write -g AppleFontSmoothing -int 2" \
      "Enable subpixel font rendering on non-Apple LCDs"

  execute "defaults write -g AppleShowScrollBars -string 'Always'" \
      "Always show scrollbars"

  execute "defaults write -g NSAutomaticWindowAnimationsEnabled -bool false" \
      "Disable window opening and closing animations."

  execute "defaults write -g NSDisableAutomaticTermination -bool true" \
      "Disable automatic termination of inactive apps"

  execute "defaults write -g NSNavPanelExpandedStateForSaveMode -bool true" \
      "Expand save panel by default"

  execute "defaults write -g NSTableViewDefaultSizeMode -int 2" \
      "Set sidebar icon size to medium"

  execute "defaults write -g NSUseAnimatedFocusRing -bool false" \
      "Disable the over-the-top focus ring animation"

  execute "defaults write -g NSWindowResizeTime -float 0.001" \
      "Accelerated playback when adjusting the window size."

  execute "defaults write -g PMPrintingExpandedStateForPrint -bool true" \
      "Expand print panel by default"

  execute "defaults write -g QLPanelAnimationDuration -float 0" \
      "Disable opening a Quick Look window animations."

  execute "defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false" \
      "Disable resume system-wide"

  execute "defaults write com.apple.screencapture show-thumbnail -bool false" \
      "Do not show Screenshot app thumbnail"

  # execute "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string 'Moreno' && \
  #          sudo scutil --set ComputerName 'moreno' && \
  #          sudo scutil --set HostName 'moreno' && \
  #          sudo scutil --set LocalHostName 'moreno'" \
  #     "Set computer name"

  execute "sudo systemsetup -setrestartfreeze on" \
      "Restart automatically if the computer freezes"

  execute "sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist ControllerPowerState 0 && \
           sudo launchctl unload /System/Library/LaunchDaemons/com.apple.blued.plist && \
           sudo launchctl load /System/Library/LaunchDaemons/com.apple.blued.plist" \
      "Turn Bluetooth off"

  execute "sudo nvram SystemAudioVolume=0" "Disable the sound effects on boot"

  # execute "for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
  #             sudo defaults write \"\${domain}\" dontAutoLoad -array \
  #                 '/System/Library/CoreServices/Menu Extras/TimeMachine.menu' \
  #                 '/System/Library/CoreServices/Menu Extras/Volume.menu'
  #          done \
  #             && sudo defaults write com.apple.systemuiserver menuExtras -array \
  #                 '/System/Library/CoreServices/Menu Extras/Bluetooth.menu' \
  #                 '/System/Library/CoreServices/Menu Extras/AirPort.menu' \
  #                 '/System/Library/CoreServices/Menu Extras/Battery.menu' \
  #                 '/System/Library/CoreServices/Menu Extras/Clock.menu'
  #         " \
  #     "Hide Time Machine and Volume icons from the menu bar"

  killall "SystemUIServer" &> /dev/null
}


function configure_disk() {
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
}


configure_macos
