Intro
=====

This default configuration will allow you to start experimenting with the
buildroot environment for the most rockchip devices. With the current configuration
it will bring-up the board, and allow access through the serial console.

This configuration uses mainline ATF, U-Boot( with rkbin ) and kernel.

How to build
============
    $ # example
    $ make friendlyarm_nanopi_r76s_defconfig
    $ make

How to write the SD card
========================

Once the build process is finished you will have an image called "sdcard.img"
in the output/images/ directory.

Copy the bootable "sdcard.img" onto an SD card with "dd":

  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
  $ sudo sync

Insert the micro SDcard in your board and power it up. The console
is available on UART2 on the GPIO connector, 1500000bps 8N1.

How to write the emmc
========================

There are some ways to flash image to emmc

1. If the board has an system, you can boot to uboot ( press ctrl+c ),and connect the board to your computer, then exec 

  $ ums 0 mmc 0 

  And then you will find a /dev/sdX device on your computer. Copy the bootable "sdcard.img" onto an SD card with "dd":

  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
  $ sudo syn

2. Using RK_DEVTOOL.

How to login
========================
1. Connect to the network cable with dhcp, then find the ip address of the board.
2. Connect to the wlan SSID: buildroot (IP: 192.168.254.1)
3. ----------ssh----------
    Username: root
    Password: password
