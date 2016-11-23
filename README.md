# QEMUARMLINUX&ANDROID
QEMU简介:
  QEMU(简称快速仿真器)是一个免费的开源系统管理程序托管执行硬件虚拟化(不要与硬件辅助虚拟化相混淆).
  QEMU是一个托管的虚拟机监控器:它模拟通过动态二进制翻译的CPU,并提供了一组器件模型，使其能够运行各种未修改的客户操作系统.它也可以连同KVM为了以接近原生的速度运行的虚拟机(需要在x86机器上的硬件虚拟化扩展)使用. QEMU还可以完全用于CPU仿真用户级进程,允许编译一个架构的应用程序要在另外一个运行.

我做的工作:
  我移植QEMU到ARM LINUX和ANDROID.

安装到ANDROID:
  我没测试是否需要gnulibc库,最好安装ANMPP.
ANMPP官网:http://anmpp.net/

    tar -xjvf /sdcard/qemu.tar.bz2 -C /
    mount -o remount,rw /
    mount -o remount,rw /stsrem
    tar -xjvf /sdcard/gnulibc.tar.bz2 -C /
    mount -o remount,ro /system
    mount -o remount,ro /

用法:
你需要去:
  https://people.debian.org/~aurel32/qemu/
去下载Debian官方ARM构架的debian系统镜像.

    qemu-system-arm -M versatilepb -kernel vmlinuz-3.2.0-4-versatile -initrd initrd.img-3.2.0-4-versatile -hda debian_wheezy_armel_standard.qcow2 -append "root=/dev/sda1"
    或
    qemu-system-arm -M versatilepb -kernel vmlinuz-3.2.0-4-versatile -initrd initrd.img-3.2.0-4-versatile -hda debian_wheezy_armel_standard.qcow2 -append "root=/dev/sda1" -vnc :6900 -redir tcp:22::22 &
版本:
  gnulibc 2.17.
  qemu 2.5.1.
  
测试机型:\n
  小米 4 系统:cancro (cm-13 每夜版),Android Kernel Version:3.4.0. [debian_wheezy_armel].\n
  红米 2 系统:MIUI 7 6.3.3 | 开发版.Android Kernel Version:3.10.28. [debian_wheezy_armel].\n
  OPPO R7 系统:Android version:4.4.4,Android Kernel Version:3.10.28. [debian_wheezy_armel].\n
  
注意:
  QEMU程序直接运行在你的内核之上,与内核息息相关,启动失败与你的ANDROID KERNEL有关.

BUG:
  如果你遇到Bug可以给我发送Email:1605227279@qq.com,或者测试成功的机型告诉我哦.


更新:20160508
  QEMU VERSION 2.6.0-rc4.

更新:20160512
  QEMU VERSION 2.6.0-rc5.

更新:20160514
  QEMU VERSION 2.6.0.

更新:20160907
  QEMU VERSION 2.7.0

更新:20161113
  QEMU VERSION 2.5.1.1.
  QEMU VERSION 2.6.2.

更新:20161117
  QEMU VERSION 2.8.0-rc0.
