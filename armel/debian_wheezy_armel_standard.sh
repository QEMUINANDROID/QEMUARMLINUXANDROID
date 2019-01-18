#!/system/bin/sh
#
# debian_wheezy_armel_standard
# 20160427 AIXIAO write.
# 20160616 AIXIAO modify.
# 20161209 aixiao modify.
# Email aixiao@aixiao.me.
#

function initializate() {
    #优先级.
    nicer="-10";
    
    #QEMU程序参数.
    qemu_parameter="-m 256 -vnc :6900 -redir tcp:2222::22";

    #QEMU程序目录,不要修改.
    qemu_home="/data/local/aixiao.qemu";

    #DEBIAN系统镜像目录,可以修改.
    debian_home="/data/local/armel";

    #debian_wheezy_armel内核.
    debian_kernel="${debian_home}/vmlinuz-3.2.0-4-versatile";

    #debian_wheezy_armel ram磁盘.
    debian_initrd="${debian_home}/initrd.img-3.2.0-4-versatile";

    #DEBIAN系统镜像文件.
    debian_qcow2="${debian_home}/debian_wheezy_armel_standard.qcow2";

    PATH="/sbin:/vendor/bin:/system/sbin:/system/bin:/system/xbin";
    LD_LIBRARY_PATH="/data/data/android.glibc/lib:/vendor/lib:/system/lib:${LD_LIBRARY_PATH}";

    export PATH;
    export LD_LIBRARY_PATH;
}

function start_() {
    nice -n ${nicer} ${qemu_home}/bin/qemu-system-arm -M versatilepb -kernel ${debian_kernel} -initrd ${debian_initrd} -hda ${debian_qcow2} -append "root=/dev/sda1" ${qemu_parameter} &
}

initializate;
start_;
