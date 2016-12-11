#!/system/bin/sh
#20160427 AIXIAO write.
#20160616 AIXIAO modify.
#20161209 aixiao modify.
#Email 1605227279@qq.com

function qemu_init(){
    qemu_parameter="-m 256 -vnc :6900 -redir tcp:2222::22"
    #QEMU程序参数.

    qemu_home="/data/local/aixiao.qemu"
    #QEMU程序目录,不要修改.
    
    debian_home="/data/local/armel"
    #DEBIAN系统镜像目录,可以修改.
    
    debian_kernel="${debian_home}/vmlinuz-3.2.0-4-versatile"
    #debian_wheezy_i386内核.
    
    debian_initrd="${debian_home}/initrd.img-3.2.0-4-versatile"
    #debian_wheezy_i386 ram磁盘.
    
    debian_qcow2="${debian_home}/debian_wheezy_armel_standard.qcow2"
    #DEBIAN系统镜像文件.

    PATH="/sbin:/vendor/bin:/system/sbin:/system/bin:/system/xbin"
    LD_LIBRARY_PATH="/data/data/android.glibc/lib:/vendor/lib:/system/lib:${LD_LIBRARY_PATH}"

    export PATH
    export LD_LIBRARY_PATH
}

function qemu_start(){
    ${qemu_home}/bin/qemu-system-arm -M versatilepb -kernel ${debian_kernel} -initrd ${debian_initrd} -hda ${debian_qcow2} -append "root=/dev/sda1" ${qemu_parameter} &
}

qemu_init
qemu_start

#VNC server 6900端口是因为我ANDROID system无法使用5900端口,ssh server使用22端口转发登陆,当然你也可以自己指定.
#如果需要转发端口,继续添加启动参数"-redir tcp:80::80 -redir tcp:443::443".
