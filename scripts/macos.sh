#!/bin/bash
# Sets reasonable OS X defaults.
#
# Or, in other words, set shit how I like in OS X.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
# More from:
#    https://gist.github.com/brandonb927/3195465
#
# Run ./set-defaults.sh and you'll be good to go.
if [ "$(uname -s)" != "Darwin" ]; then
  exit 0
fi

export TRANSMISSION='/Volumes/WD-Shares/Transmission'
# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 0



###############################################################################
# Transmission                                                                #
###############################################################################

## General

# Automatically size window to fit all transfers
defaults write org.m0k.transmission AutoSize -bool true

# Download & Upload Badges
defaults write org.m0k.transmission BadgeDownloadRate -bool false
defaults write org.m0k.transmission BadgeUploadRate   -bool false

# Prompt user for removal of active transfers only when downloading
defaults write org.m0k.transmission CheckRemoveDownloading -bool true

# Prompt user for quit with active transfers only when downloading
defaults write org.m0k.transmission CheckQuitDownloading -bool true


## Transfers

# Default download location
defaults write org.m0k.transmission DownloadLocationConstant -bool true
defaults write org.m0k.transmission DownloadChoice -string "Constant"
defaults write org.m0k.transmission DownloadFolder -string "${TRANSMISSION}/Downloads"

# Set incomplete downloads location
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${TRANSMISSION}/Downloads/Torrents"

# Hide incomplete downloads folder
mkdir -p "${TRANSMISSION}/Downloads/Torrents"
sudo chflags -h hidden "${TRANSMISSION}/Downloads/Torrents"

# Don’t prompt for confirmation before downloading
defaults write org.m0k.transmission DownloadAsk -bool false

# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Display window when opening a torrent file
defaults write org.m0k.transmission DownloadAskMulti -bool true
defaults write org.m0k.transmission DownloadAskManual -bool true

# Automatic Import
defaults write org.m0k.transmission AutoImport -bool true
defaults write org.m0k.transmission AutoImportDirectory -string "$TRANSMISSION/Downloads/"


## Network

# Randomize port on launch
defaults write org.m0k.transmission RandomPort -bool true


## Startup

# Donate message
defaults write org.m0k.transmission WarningDonate -bool false

# Legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false


## View

# Status bar
defaults write org.m0k.transmission StatusBar -bool true

# Small view
defaults write org.m0k.transmission SmallView -bool true

# Pieces bar
defaults write org.m0k.transmission PiecesBar -bool false

# Pieces bar
defaults write org.m0k.transmission FilterBar -bool true

# Availability
defaults write org.m0k.transmission DisplayProgressBarAvailable -bool false

## Network

# Randomize port on launch
defaults write org.m0k.transmission RandomPort -bool true


## Startup

# Donate message
defaults write org.m0k.transmission WarningDonate -bool false

# Legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false


## View

# Status bar
defaults write org.m0k.transmission StatusBar -bool true

# Small view
defaults write org.m0k.transmission SmallView -bool true

# Pieces bar
defaults write org.m0k.transmission PiecesBar -bool false

# Pieces bar
defaults write org.m0k.transmission FilterBar -bool true

# Availability
defaults write org.m0k.transmission DisplayProgressBarAvailable -bool false

defaults write org.m0k.transmission AutoUpdateBeta -bool true

defaults write org.m0k.transmission EncryptionRequire -bool true
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"

#############################