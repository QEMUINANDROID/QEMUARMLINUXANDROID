#!/system/bin/sh
#20160501 AIXIAO write.
#20160616 AIXIAO modify.
#Email 1605227279@qq.com

qemu_install(){
    bbox="/system/xbin/busybox"

    ${bbox} tar -xjvf /sdcard/qemu.tar.bz2 -C /
    ${bbox} mount -o remount,rw /
    ${bbox} mount -o remount,rw /system
    ${bbox} tar -xjvf /sdcard/gnulibc.tar.bz2 -C /
    ${bbox} mount -o remount,ro /system
    ${bbox} mount -o remount,ro /
}

qemu_install
