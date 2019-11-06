mkinitcpio-archlogo
===================

Add colored Arch Linux ASCII art logo to early boot process

## Post-installation instructions
After installing this package you will need to edit your `/etc/mkinitcpio.conf` file in order to get the logo to show on boot.
In your `mkinitcpio.conf` file you will have a line that will look like the following (it may have a few differences):
``
HOOKS=(base udev autodetect modconf block filesystems keyboard fsck)
``
You will need to add `archlogo` to somewhere in this list. e.g.
``
HOOKS=(base udev archlogo autodetect modconf block filesystems keyboard fsck)
``
After doing this you will need to rebuild your initial ramdisk. This can be done by running (as root user):
``
mkinitcpio -p linux
``
> NOTE: `linux` is the name of the kernel. You may need to change this if you are using a custom kernel
