# Device tree to compile twrp for Xiami Mi Play (lotus). 
It has been created by TWRP device tree generator (https://github.com/SebaUbuntu/TWRP-device-tree-generator) with some modification in the recovery.fstab file.

##  Getting Started

You need OMNI sources minimal manifest to build TWRP and at the moment openJDK 8.

Create a working dir and jump in

`mkdir twrp8.1; cd twrp8.1;`

To initialize a shallow clone, which will save even more space, use a command like this:

`repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-8.1`

If not present, create device/xiaomi/lotus folder

`mkdir ./device/xiaomi/lotus`

Move our device tree in that directory

`git clone https://github.com/gokur20/twrp_xiaomi_Mi_Play.git device/xiaomi/lotus`

Then to sync up:

`repo sync`

Then to build:

`. build/envsetup.sh; lunch omni_lotus-eng; mka recoveryimage`
