#!/usr/bin/env bash

source ./lib/echos.sh

# Close any open System Preference panes, to prevent the from overriding settings we're about to change
running "closing any system preferences to prevent issues with automatic changes"
osascript -e 'tell application "System Preferences" to quit'

# Ask for administrator password upfront
bot "I need you to enter password to instal somethings"
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macOS` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General Settings
###############################################################################

bot "Genetal settings"

# Menubar: hide the Time Machine, Volume, and User icons
running "hide time machine, volume and user icons in menubar"
for domain in ~/Library/Preferences/BuyHost/com.apple.systemuiserver.*;do
    defaults write "${domain}" dontAutoLoad -array \
        "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
        "/System/Library/CoreServices/Menu Extras/Volume.menu" \
        "/System/Library/CoreServices/Menu Extras/User.menu"
done; ok
running "show bluetooth, WiFi, battery and clock on menubar"
defaults write com.apple.systemuiserver -menuExtras -array \
    "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
    "/System/Library/CoreServices/Menu Extras/Battery.menu" \
    "/System/Library/CoreServices/Menu Extras/Clock.menu"; ok

# Set sidebar icon size to medium
running "sidebar icon size to medium"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2; ok

# Automatic show scroll bars
running "automatic show scroll bars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"; ok
# Possible values: `WhenScrolling`, `Always`, `Automatic`

# Disable the over-the-top focus ring animation
running "disable over the top focus ring"
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false; ok

# Increase window resize speed for Cocoa applications
running "reduce window resize time to 0.001"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001; ok

# Expand save panel by default
running "always expand save panel"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true; ok
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true; ok

# Expand print panel by default
running "always expand print panel"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true; ok
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true; ok

# Save to disk (not to iCloud) by default
running "always save to local disk"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false; ok

# Automatically quit printer app once the print jobs complete
running "automatically quit print app when print jobs are complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true; ok

# Disable the “Are you sure you want to open this application?” dialog
running "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false;ok

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
running "remove duplicates in open with menu"
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user; ok

# Disable automatic termination of inactive apps
running "disable automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true; ok

# Disable smart quotes as they’re annoying when typing code
running "disable smart quotes"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false; ok

# Disable smart dashes as they’re annoying when typing code
running "disable smart dashes"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false; ok

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

bot "trackpad, keyboard and accessories configuration"

# Trackpad: enable tap to click for this user and for the login screen
running "enable tap to click for this user and login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1; ok

# Trackpad: map bottom right corner to right-click
running "map bottom right corner to right click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true; ok

# Use scroll gesture with the Ctrl (^) modifier key to zoom
running "use scroll gesture with ctrl (^) modifier  to zoom"
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144; ok

# Follow the keyboard focus while zoomed in
running "follow keyboard focus while zoomed in"
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true; ok

# Disable press-and-hold for keys in favor of key repeat
running "disable press-and-hold accent keys in favor of key repear"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false; ok

# Set a blazingly fast keyboard repeat rate
running "reduce keyboard repeat to 1ms"
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10; ok

# Set language and text formats
# Note: if you’re in the US, replace `INR` with `USD`, `Centimeters` with
# `Inches` and `true` with `false`.
bot "language and text formats"

running "set languages to english, malayalam"
defaults write NSGlobalDomain AppleLanguages -array "en" "ml"; ok
running "set currency to INR"
defaults write NSGlobalDomain AppleLocale -string "en_IN@currency=INR"; ok
running "set measurements to metric units"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true; ok

# Set the timezonel see `sudo systemsetup -listtimezones` for other values
running "set timezone to Asia/Kolkata"
sudo systemsetup -settimezone "Asia/Kolkata" > /dev/null; ok

###############################################################################
# Screen                                                                      #
###############################################################################
bot "Screen configurations"

# Require password immediately after sleep or screen saver begins
running "require password immediately after sleep or screen saver"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0; ok

# Save screenshots to the desktop
running  "Save screenshots to the desktop"
defaults write com.apple.screencapture location -string "${HOME}/Desktop"; ok

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
running "save screenshots in PNG format"
defaults write com.apple.screencapture type -string "png"; ok

# Disable shadow in screenshots
running "disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true; ok

###############################################################################
# Finder                                                                      #
###############################################################################

bot "Finder configurations"

# Finder: disable window animations and Get Info animations
running "disbale window animations and get info animations"
defaults write com.apple.finder DisableAllAnimations -bool true; ok

# Show icons for hard drives, servers, and removable media on the desktop
running "Show icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true; ok
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true; ok
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true; ok
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true; ok

# Finder: show all filename extensions
running "show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true; ok

# Finder: show status bar
running "show status bar"
defaults write com.apple.finder ShowStatusBar -bool true; ok

# When performing a search, search the current folder by default
running "search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"; ok

# Enable spring loading for directories
running "enable spiral loading for directories"
defaults write NSGlobalDomain com.apple.springing.enabled -bool true; ok

# Remove the spring loading delay for directories
running "remove spring loading delay for directories"
defaults write NSGlobalDomain com.apple.springing.delay -float 0; ok

# Avoid creating .DS_Store files on network volumes
running "no .DS_Store files in network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true; ok

# Automatically open a new Finder window when a volume is mounted
running "automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true; ok
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true; ok
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true; ok

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
running "use list view in all finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"; ok

# Remove Dropbox's green checkmark icons in Finder
# file=/Applications/Dropbox.app/Contents/Resources/emblem-dropbox-uptodate.icns
# [ -e "${file}" ] && mv -d "${file}" "${file}.bak"

# Show the ~/Library folder
running "show ~/Library folder"
chflags nohidden ~/Library; ok

# Show the /Volumes folder
running "show /Volumes folder"
sudo chflags nohidden /Volume; ok


# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Privileges -bool true

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################
bot "Dock, Dashboard, and hot corners"

# Enable highlight hover effect for the grid view of a stack (Dock)
running "enable highlight hover effect for the grid view of a stack"
defaults write com.apple.dock mouse-over-hilite-stack -bool true; ok

# Set the icon size of Dock items to 36 pixels
running "set the icon size of Dock items to 36 pixels"
defaults write com.apple.dock tilesize -int 36; ok

# Change minimize/maximize window effect
running "change minimize/maximize effect to scale"
defaults write com.apple.dock mineffect -string "scale"; ok

# Minimize windows into their application’s icon
running "minimize winows into their application's icon"
defaults write com.apple.dock minimize-to-application -bool true; ok

# Enable spring loading for all Dock items
running "enable spring loading for all dock items"
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true; ok

# Show indicator lights for open applications in the Dock
running "show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true; ok

# Speed up Mission Control animations
running "mission control animation to 0.1ms"
defaults write com.apple.dock expose-animation-duration -float 0.1; ok

# Don’t show Dashboard as a Space
running "don't how dashboard as space"
defaults write com.apple.dock dashboard-in-overlay -bool true; ok

# Don’t automatically rearrange Spaces based on most recent use
running "don't automatically rearrange spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false; ok

# Remove the auto-hiding Dock delay
running "remove the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0; ok

# Remove the animation when hiding/showing the Dock
running "remove the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0; ok

# Automatically hide and show the Dock
running "automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true; ok

# Make Dock icons of hidden applications translucent
runnig "make Dock icons of hidden applications translucent"
defaults write com.apple.dock showhidden -bool true; ok

###############################################################################
# Kill affected applications                                                  #
###############################################################################
bot "OK. Note that some of these changes require a logout/restart to take effect. Killing affected applications (so they can reboot)....

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
    "Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
    "iCal" "Terminal"; do
killall "${app}" > /dev/null 2>&1
done
