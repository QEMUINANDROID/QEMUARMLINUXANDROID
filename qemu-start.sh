#!/system/bin/sh
#20160427 AIXIAO write.
#20160616 AIXIAO modify.
#Email 1605227279@qq.com

qemu_init(){
    qemu_home="/data/data/qemu"
    #QEMU程序目录,不要修改.
    debian_home="/data/local"
    #DEBIAN系统镜像目录,可以修改.

    LD_LIBRARY_PATH=/vendor/lib/:/system/lib/:${LD_LIBRARY_PATH}
    export LD_LIBRARY_PATH
}

qemu_start(){
    ${qemu_home}/bin/qemu-system-arm -M versatilepb -kernel ${debian_home}/vmlinuz-3.2.0-4-versatile -initrd ${debian_home}/initrd.img-3.2.0-4-versatile -hda ${debian_home}/debian_wheezy_armel_standard.qcow2 -append "root=/dev/sda1" -vnc :6900 -redir tcp:22::22 &
}

qemu_init
qemu_start
#VNC server 6900端口是因为我ANDROID system无法使用5900端口,ssh server使用22端口转发登陆,当然你也可以自己指定.
#如果需要转发端口,继续添加启动参数"-redir tcp:80::80 -redir tcp:443::443".
