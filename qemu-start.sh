#!/system/bin/sh
#20160427 AIXIAO write.
#Email 1605227279@qq.com

qemu_home="/data/data/qemu"
#QEMU程序目录,不要修改.
debian_home="/data/local"
#DEBIAN系统镜像目录,可以修改.

LD_LIBRARY_PATH=/vendor/lib/:/system/lib/:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH

${qemu_home}/bin/qemu-system-arm -M versatilepb -kernel ${debian_home}/vmlinuz-3.2.0-4-versatile -initrd ${debian_home}/initrd.img-3.2.0-4-versatile -hda ${debian_home}/debian_wheezy_armel_standard.qcow2 -append "root=/dev/sda1" -vnc :6900 -redir tcp:2200::22 &
#VNC6900端口是因为我ANDROID无法使用5900端口,ssh使用2200端口转发登陆,当然你也可以自己指定.
