#!/system/bin/sh
#20160501 AIXIAO write.
#Email 1605227279@qq.com

bbox="/system/xbin/busybox"

${bbox} tar -xjvf /sdcard/qemu.tar.bz2 -C /
${bbox} mount -o remount,rw /
${bbox} mount -o remount,rw /system
${bbox} tar -xjvf /sdcard/gnulibc.tar.bz2 -C /
${bbox} mount -o remount,ro /system
${bbox} mount -o remount,ro /
