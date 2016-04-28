# QEMU-ARM-LINUX-ANDROID
QEMU简介:
  QEMU(简称快速仿真器)是一个免费的开源系统管理程序托管执行硬件虚拟化(不要与硬件辅助虚拟化相混淆).
  QEMU是一个托管的虚拟机监控器:它模拟通过动态二进制翻译的CPU,并提供了一组器件模型，使其能够运行各种未修改的客户操作系统.它也可以连同KVM为了以接近原生的速度运行的虚拟机(需要在x86机器上的硬件虚拟化扩展)使用. QEMU还可以完全用于CPU仿真用户级进程,允许编译一个架构的应用程序要在另外一个运行.

我做的工作:
  我负责移植QEMU到ARM LINUX和ANDROID.

安装到ANDROID:
  我没测试是否需要glibc库,最好安装ANMPP.

    tar -xjvf /sdcard/qemu.tar.bz2 -C /
    mount -o remount,rw /
    mount -o remount,rw /stsrem
    tar -xjvf /sdcard/gnulibc.tar.bz2 -C /
    mount -o remount,ro /system
    mount -o remount,ro /

用法:
你需要去:
  https://people.debian.org/~aurel32/qemu/armel/
去下载制作好的debian系统镜像.

    qemu-system-arm -M versatilepb -kernel vmlinuz-3.2.0-4-versatile -initrd initrd.img-3.2.0-4-versatile -hda debian_wheezy_armel_standard.qcow2 -append "root=/dev/sda1"
    或
    qemu-system-arm -M versatilepb -kernel vmlinuz-3.2.0-4-versatile -initrd initrd.img-3.2.0-4-versatile -hda debian_wheezy_armel_standard.qcow2 -append "root=/dev/sda1" -vnc :6900 -redir tcp:2200::22 &
版本:
  gnulibc 2.17.
  qemu 2.5.1.
  
测试机型:
  小米 4 系统:cancro (cm-13 每夜版).
  红米 2 系统:MIUI 7 6.3.3 | 开发版.
  
  
