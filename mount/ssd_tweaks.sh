#!/bin/bash

sudo -v

# Disable Hibernation 
sudo pmset -a hibernatemode 0 

# Disable Wake from Lid Open
sudo pmset lidwake 0

#  ForceWakeFix
sudo pmset -a sms 0

# Remove SleepImage "Gain 16GB"
sudo rm /var/vm/sleepimage

# Disable Swap "Only use if you have 4GB Ram"
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.dynamic_pager.plist

# Remove Swap 
sudo rm /private/var/vm/swapfile*

# Disable "Writing Hang Reports to Disk"
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.spindump.plist

# Disable DashBoard
defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock 

# Repair Disk Permissions 
diskutil repairPermissions /

# Update share Cache
sudo update_dyld_shared_cache -force

# Rebuild kextcache and use it to boot
sudo kextcache -system-prelinked-kernel && sudo kextcache -system-caches

# Reboot
sudo shutdown -r +1
