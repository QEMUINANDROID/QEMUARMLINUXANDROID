#!/system/bin/sh
#
# FreeBSD-11.0-RELEASE-i386
# 20170302 AIXIAO write.
# Email aixiao@aixiao.me.
#

#wget https://download.freebsd.org/ftp/releases/VM-IMAGES/11.0-RELEASE/i386/Latest/FreeBSD-11.0-RELEASE-i386.qcow2.xz
#xz -d FreeBSD-11.0-RELEASE-i386.qcow2.xz

#Network
#echo ifconfig_em0="DHCP" >> /etc/defaults/rc.conf
#/etc/netstart
#echo "nameserver 1.2.4.8" > /etc/resolv.conf
#echo "nameserver 210.2.4.8" >> /etc/resolv.conf

function initializate() {
    nicer="-10";
    qemu_parameter="-m 512 -vnc :6900";
    qemu_home="/data/local/aixiao.qemu";
    FreeBSD_11_0_RELEASE_i386_home="/data/local/freebsd";
    FreeBSD_11_0_RELEASE_i386_qcow2="${FreeBSD_11_0_RELEASE_i386_home}/FreeBSD-11.0-RELEASE-i386.qcow2";

    PATH="/sbin:/vendor/bin:/system/sbin:/system/bin:/system/xbin";
    LD_LIBRARY_PATH="/data/data/android.glibc/lib:/vendor/lib:/system/lib:${LD_LIBRARY_PATH}";
    export PATH;
    export LD_LIBRARY_PATH;
}

function start_() {
    nice -n ${nicer} ${qemu_home}/bin/qemu-system-i386 -hda ${FreeBSD_11_0_RELEASE_i386_qcow2} ${qemu_parameter} &
}

initializate;
start_;
