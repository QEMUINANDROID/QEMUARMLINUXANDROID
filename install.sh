#!/system/bin/sh
#
# 20160501 write.
# 20160616 modify.
# 20161123 modify.
# Email aixiao@aixiao.me.
#

function initialization() {
    bbox="/system/xbin/busybox";
}

function install_(){
    ${bbox} tar -xjvf /sdcard/qemu.tar.bz2 -C /
    ${bbox} mount -o remount,rw /
    ${bbox} mount -o remount,rw /system
    ${bbox} tar -xjvf /sdcard/gnulibc.tar.bz2 -C /
    ${bbox} mount -o remount,ro /system
    ${bbox} mount -o remount,ro /
}

initialization;
install_;
