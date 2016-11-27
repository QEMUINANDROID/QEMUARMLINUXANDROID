#!/system/bin/sh
#20161123 AIXIAO write.
#Email 1605227279@qq.com.

qemu_init(){
    qemu_parameter="-m 512 -vnc :6900 -redir tcp:2222::22"
    #QEMU程序参数.

    qemu_home="/data/local/aixiao.qemu"
    #QEMU程序目录,不要修改.

    debian_home="/data/local/i386"
    #DEBIAN系统镜像目录,可以修改.

    debian_kernel="${debian_home}/vmlinuz-3.2.0-4-686-pae"
    #debian_wheezy_i386内核.

    debian_initrd="${debian_home}/initrd.img-3.2.0-4-686-pae"
    #debian_wheezy_i386 ram磁盘.

    debian_qcow2="${debian_home}/debian_wheezy_i386_standard.qcow2"
    #DEBIAN系统镜像文件.


    PATH="/sbin:/vendor/bin:/system/sbin:/system/bin:/system/xbin"
    #PATH环境变量
    LD_LIBRARY_PATH="/data/data/android.glibc/lib:/vendor/lib:/system/lib:${LD_LIBRARY_PATH}"
    #LD_LIBRARY_PATH环境变量.

    export PATH
    export LD_LIBRARY_PATH
}

qemu_start(){
    ${qemu_home}/bin/qemu-system-i386 -kernel ${debian_kernel} -initrd ${debian_initrd} -hda ${debian_qcow2} -append "root=/dev/sda1" ${qemu_parameter} &
}

qemu_init
qemu_start
#VNC server 6900端口是因为我ANDROID system无法使用5900端口,ssh server使用22端口转发登陆,当然你也可以自己指定.
#如果需要转发端口,继续添加启动参数"-redir tcp:80::80 -redir tcp:443::443".
