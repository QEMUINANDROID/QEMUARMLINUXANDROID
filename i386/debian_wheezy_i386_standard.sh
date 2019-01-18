#!/system/bin/sh
#
# debian_wheezy_i386_standard
# 20161123 AIXIAO write.
# Email aixiao@aixiao.me.
#

function initializate() {
    #优先级.
    nicer="-10";

    #QEMU程序参数.
    qemu_parameter="-m 512 -vnc :6900 -redir tcp:2222::22";

    #QEMU程序目录,不要修改.
    qemu_home="/data/local/aixiao.qemu";

    #DEBIAN系统镜像目录,可以修改.
    debian_home="/data/local/i386";

    #debian_wheezy_i386内核.
    debian_kernel="${debian_home}/vmlinuz-3.2.0-4-686-pae";

    #debian_wheezy_i386 ram磁盘.
    debian_initrd="${debian_home}/initrd.img-3.2.0-4-686-pae";

    #DEBIAN系统镜像文件.
    debian_qcow2="${debian_home}/debian_wheezy_i386_standard.qcow2";

    #PATH环境变量
    PATH="/sbin:/vendor/bin:/system/sbin:/system/bin:/system/xbin";
    #LD_LIBRARY_PATH环境变量.
    LD_LIBRARY_PATH="/data/data/android.glibc/lib:/vendor/lib:/system/lib:${LD_LIBRARY_PATH}";

    export PATH;
    export LD_LIBRARY_PATH;
}

dunction start_() {
    nice -n ${nicer} ${qemu_home}/bin/qemu-system-i386 -kernel ${debian_kernel} -initrd ${debian_initrd} -hda ${debian_qcow2} -append "root=/dev/sda1" ${qemu_parameter} &
}

initializate;
start_;
