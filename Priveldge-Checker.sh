=================================================================================================
LINUX PRIVILEGE ESCALATION CHECKER
=================================================================================================

[*] GETTING BASIC SYSTEM INFO...

[+] Kernel
    Linux version 3.11.0-15-generic (buildd@akateko) (gcc version 4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) ) #25~precise1-Ubuntu SMP Thu Jan 30 17:42:40 UTC 2014

[+] Hostname
    SickOs

[+] Operating System
    Ubuntu 12.04.4 LTS \n \l

[*] GETTING NETWORKING INFO...

[+] Interfaces
    eth0      Link encap:Ethernet  HWaddr 08:00:27:71:f1:c0
    inet addr:192.168.56.102  Bcast:192.168.56.255  Mask:255.255.255.0
    inet6 addr: fe80::a00:27ff:fe71:f1c0/64 Scope:Link
    UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
    RX packets:2888 errors:2 dropped:0 overruns:0 frame:0
    TX packets:900 errors:0 dropped:0 overruns:0 carrier:0
    collisions:0 txqueuelen:1000
    RX bytes:224188 (224.1 KB)  TX bytes:296736 (296.7 KB)
    Interrupt:10 Base address:0xd000
    lo        Link encap:Local Loopback
    inet addr:127.0.0.1  Mask:255.0.0.0
    inet6 addr: ::1/128 Scope:Host
    UP LOOPBACK RUNNING  MTU:65536  Metric:1
    RX packets:40 errors:0 dropped:0 overruns:0 frame:0
    TX packets:40 errors:0 dropped:0 overruns:0 carrier:0
    collisions:0 txqueuelen:0
    RX bytes:5196 (5.1 KB)  TX bytes:5196 (5.1 KB)

[+] Netstat
    Active Internet connections (servers and established)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      -
    tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      -
    tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -
    tcp        0      0 192.168.56.102:53362    192.168.56.103:6969     ESTABLISHED 1659/bash
    tcp        0      0 192.168.56.102:53361    192.168.56.103:6969     ESTABLISHED 1660/bash
    tcp6       0      0 :::22                   :::*                    LISTEN      -
    tcp6       0      0 :::3128                 :::*                    LISTEN      -
    udp        0      0 0.0.0.0:68              0.0.0.0:*                           -
    udp        0      0 0.0.0.0:47816           0.0.0.0:*                           -
    udp6       0      0 :::50214                :::*                                -

[+] Route
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
    192.168.56.0    *               255.255.255.0   U     0      0        0 eth0

[*] GETTING FILESYSTEM INFO...

[+] Mount results
    /dev/sda1 on / type ext4 (rw,errors=remount-ro)
    proc on /proc type proc (rw,noexec,nosuid,nodev)
    sysfs on /sys type sysfs (rw,noexec,nosuid,nodev)
    none on /sys/fs/fuse/connections type fusectl (rw)
    none on /sys/kernel/debug type debugfs (rw)
    none on /sys/kernel/security type securityfs (rw)
    udev on /dev type devtmpfs (rw,mode=0755)
    devpts on /dev/pts type devpts (rw,noexec,nosuid,gid=5,mode=0620)
    tmpfs on /run type tmpfs (rw,noexec,nosuid,size=10%,mode=0755)
    none on /run/lock type tmpfs (rw,noexec,nosuid,nodev,size=5242880)
    none on /run/shm type tmpfs (rw,nosuid,nodev)

[+] fstab entries
    # /etc/fstab: static file system information.
    #
    # Use 'blkid' to print the universally unique identifier for a
    # device; this may be used with UUID= as a more robust way to name devices
    # that works even if disks are added and removed. See fstab(5).
    #
    # <file system> <mount point>   <type>  <options>       <dump>  <pass>
    proc            /proc           proc    nodev,noexec,nosuid 0       0
    # / was on /dev/sda1 during installation
    UUID=5cef95b9-44dd-46a3-9692-5d8129742609 /               ext4    errors=remount-ro 0       1
    # swap was on /dev/sda5 during installation
    UUID=c0879703-22d4-4b52-b727-fc41a04d73c3 none            swap    sw              0       0
    /dev/fd0        /media/floppy0  auto    rw,user,noauto,exec,utf8 0       0

[+] Scheduled cron jobs
    -rw-r--r-- 1 root root  722 Jun 20  2012 /etc/crontab
    /etc/cron.d:
    total 20
    drwxr-xr-x  2 root root 4096 Dec  5  2015 .
    drwxr-xr-x 90 root root 4096 Oct 12 16:07 ..
    -rw-r--r--  1 root root  102 Jun 20  2012 .placeholder
    -rw-r--r--  1 root root   52 Dec  5  2015 automate
    -rw-r--r--  1 root root  544 Jul  2  2015 php5
    /etc/cron.daily:
    total 76
    drwxr-xr-x  2 root root  4096 Sep 22  2015 .
    drwxr-xr-x 90 root root  4096 Oct 12 16:07 ..
    -rw-r--r--  1 root root   102 Jun 20  2012 .placeholder
    -rwxr-xr-x  1 root root   633 Jul 24  2015 apache2
    -rwxr-xr-x  1 root root   219 Apr 10  2012 apport
    -rwxr-xr-x  1 root root 15399 Nov 15  2013 apt
    -rwxr-xr-x  1 root root   314 Apr 19  2013 aptitude
    -rwxr-xr-x  1 root root   502 Mar 31  2012 bsdmainutils
    -rwxr-xr-x  1 root root   256 Oct 14  2013 dpkg
    -rwxr-xr-x  1 root root   372 Oct  5  2011 logrotate
    -rwxr-xr-x  1 root root  1365 Dec 28  2012 man-db
    -rwxr-xr-x  1 root root   606 Aug 17  2011 mlocate
    -rwxr-xr-x  1 root root   249 Sep 13  2012 passwd
    -rwxr-xr-x  1 root root  2417 Jul  2  2011 popularity-contest
    -rwxr-xr-x  1 root root  2947 Jun 20  2012 standard
    -rwxr-xr-x  1 root root   214 Sep 11  2012 update-notifier-common
    /etc/cron.hourly:
    total 12
    drwxr-xr-x  2 root root 4096 Sep 22  2015 .
    drwxr-xr-x 90 root root 4096 Oct 12 16:07 ..
    -rw-r--r--  1 root root  102 Jun 20  2012 .placeholder
    /etc/cron.monthly:
    total 12
    drwxr-xr-x  2 root root 4096 Sep 22  2015 .
    drwxr-xr-x 90 root root 4096 Oct 12 16:07 ..
    -rw-r--r--  1 root root  102 Jun 20  2012 .placeholder
    /etc/cron.weekly:
    total 20
    drwxr-xr-x  2 root root 4096 Sep 22  2015 .
    drwxr-xr-x 90 root root 4096 Oct 12 16:07 ..
    -rw-r--r--  1 root root  102 Jun 20  2012 .placeholder
    -rwxr-xr-x  1 root root  730 Sep 14  2013 apt-xapian-index
    -rwxr-xr-x  1 root root  907 Dec 28  2012 man-db

[+] Writable cron dirs


[*] ENUMERATING USER AND ENVIRONMENTAL INFO...

[+] Logged in User Activity
    17:53:15 up  1:45,  0 users,  load average: 0.00, 0.01, 0.05
    USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU WHAT

[+] Super Users Found:
    root

[+] Environment
    SHLVL=2
    OLDPWD=/usr/lib/cgi-bin
    HTTP_HOST=192.168.56.102
    _=/usr/bin/python
    HTTP_REFERER=() {  :
    }
    HTTP_ACCEPT_ENCODING=identity
    PWD=/var/crash

[+] Root and current user history (depends on privs)

[+] Sudoers (privileged)

[+] All users
    root:x:0:0:root:/root:/bin/bash
    daemon:x:1:1:daemon:/usr/sbin:/bin/sh
    bin:x:2:2:bin:/bin:/bin/sh
    sys:x:3:3:sys:/dev:/bin/sh
    sync:x:4:65534:sync:/bin:/bin/sync
    games:x:5:60:games:/usr/games:/bin/sh
    man:x:6:12:man:/var/cache/man:/bin/sh
    lp:x:7:7:lp:/var/spool/lpd:/bin/sh
    mail:x:8:8:mail:/var/mail:/bin/sh
    news:x:9:9:news:/var/spool/news:/bin/sh
    uucp:x:10:10:uucp:/var/spool/uucp:/bin/sh
    proxy:x:13:13:proxy:/bin:/bin/sh
    www-data:x:33:33:www-data:/var/www:/bin/sh
    backup:x:34:34:backup:/var/backups:/bin/sh
    list:x:38:38:Mailing List Manager:/var/list:/bin/sh
    irc:x:39:39:ircd:/var/run/ircd:/bin/sh
    gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
    nobody:x:65534:65534:nobody:/nonexistent:/bin/sh
    libuuid:x:100:101::/var/lib/libuuid:/bin/sh
    syslog:x:101:103::/home/syslog:/bin/false
    messagebus:x:102:105::/var/run/dbus:/bin/false
    whoopsie:x:103:106::/nonexistent:/bin/false
    landscape:x:104:109::/var/lib/landscape:/bin/false
    sshd:x:105:65534::/var/run/sshd:/usr/sbin/nologin
    sickos:x:1000:1000:sickos,,,:/home/sickos:/bin/bash
    mysql:x:106:114:MySQL Server,,,:/nonexistent:/bin/false

[+] Current User
    www-data

[+] Current User ID
    uid=33(www-data) gid=33(www-data) groups=33(www-data)

[*] ENUMERATING FILE AND DIRECTORY PERMISSIONS/CONTENTS...

[+] World Writeable Directories for User/Group 'Root'
    drwxrwxrwt 2 root root 4096 Oct 12 17:53 /tmp
    drwxrwxrwt 2 root root 40 Oct 12 16:07 /run/shm
    drwxrwxrwt 4 root root 80 Oct 12 16:07 /run/lock
    drwxrwxrwt 2 root root 4096 Jan 10  2014 /var/tmp
    drwx-wx-wt 2 root root 4096 Dec  5  2015 /var/lib/php5
    drwxrwxrwx 3 root root 4096 Dec  6  2015 /var/www
    drwxrwxrwx 4 root root 4096 Dec  6  2015 /var/www/wolfcms/public
    drwxrwxrwx 4 root root 4096 Dec  5  2015 /var/www/wolfcms/public/themes
    drwxrwxrwx 3 root root 4096 Dec  5  2015 /var/www/wolfcms/public/themes/simple
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/public/themes/simple/images
    drwxrwxrwx 3 root root 4096 Dec  5  2015 /var/www/wolfcms/public/themes/wolf
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/public/themes/wolf/images
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/public/images
    drwxrwxrwx 7 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf
    drwxrwxrwx 7 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/app
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/app/controllers
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/app/layouts
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/app/models
    drwxrwxrwx 8 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/app/views
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/app/views/user
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/app/views/snippet
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/app/views/page
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/app/views/login
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/app/views/setting
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/app/views/layout
    drwxrwxrwx 2 root root 12288 Dec  5  2015 /var/www/wolfcms/wolf/icons
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/helpers
    drwxrwxrwx 11 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins
    drwxrwxrwx 5 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/fonts
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/views
    drwxrwxrwx 4 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/views
    drwxrwxrwx 5 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/views
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/images
    drwxrwxrwx 4 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/views
    drwxrwxrwx 4 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images
    drwxrwxrwx 4 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images
    drwxrwxrwx 4 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/views
    drwxrwxrwx 4 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/views
    drwxrwxrwx 3 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n
    drwxrwxrwx 7 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/stylesheets
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/javascripts
    drwxrwxrwx 6 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/themes
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/themes/brown_and_blue
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/themes/Right To Left
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/themes/black_and_white
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/themes/brown_and_green
    drwxrwxrwx 5 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup
    drwxrwxrwx 3 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/sets
    drwxrwxrwx 3 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/sets/default
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/sets/default/images
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/templates
    drwxrwxrwx 4 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins
    drwxrwxrwx 3 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/simple
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/simple/images
    drwxrwxrwx 3 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup/images
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/wolf/admin/images
    drwxrwxrwx 2 root root 4096 Dec  5  2015 /var/www/wolfcms/docs
    drwxrwsrwt 2 root whoopsie 4096 Oct 12 17:53 /var/crash

[+] World Writeable Directories for Users other than Root

[+] World Writable Files
    -rw-rw-rw- 1 root root 0 Oct 12  2016 /sys/kernel/security/apparmor/.access
    -rwxrwxrwx 1 root root 120 Oct  2  2014 /usr/lib/cgi-bin/status
    -rwxrwxrwx 1 root root 403 Dec  5  2015 /var/www/wolfcms/composer.json
    -rwxrwxrwx 1 root root 2405 Dec  5  2015 /var/www/wolfcms/README.md
    -rwxrwxrwx 1 root root 6815 Dec  5  2015 /var/www/wolfcms/index.php
    -rwxrwxrwx 1 root root 3058 Dec  5  2015 /var/www/wolfcms/config.php
    -rwxrwxrwx 1 root root 894 Dec  5  2015 /var/www/wolfcms/favicon.ico
    -rwxrwxrwx 1 root root 4084 Dec  5  2015 /var/www/wolfcms/CONTRIBUTING.md
    -rwxrwxrwx 1 root root 825 Dec  5  2015 /var/www/wolfcms/public/themes/simple/print.css
    -rwxrwxrwx 1 root root 5172 Dec  5  2015 /var/www/wolfcms/public/themes/simple/screen.css
    -rwxrwxrwx 1 root root 1150 Dec  5  2015 /var/www/wolfcms/public/themes/simple/images/favicon.ico
    -rwxrwxrwx 1 root root 825 Dec  5  2015 /var/www/wolfcms/public/themes/wolf/print.css
    -rwxrwxrwx 1 root root 5083 Dec  5  2015 /var/www/wolfcms/public/themes/wolf/screen.css
    -rwxrwxrwx 1 root root 1150 Dec  5  2015 /var/www/wolfcms/public/themes/wolf/images/favicon.ico
    -rwxrwxrwx 1 root root 76381 Dec  5  2015 /var/www/wolfcms/wolf/Framework.php
    -rwxrwxrwx 1 root root 8278 Dec  5  2015 /var/www/wolfcms/wolf/app/controllers/SnippetController.php
    -rwxrwxrwx 1 root root 20954 Dec  5  2015 /var/www/wolfcms/wolf/app/controllers/PageController.php
    -rwxrwxrwx 1 root root 7341 Dec  5  2015 /var/www/wolfcms/wolf/app/controllers/LoginController.php
    -rwxrwxrwx 1 root root 5928 Dec  5  2015 /var/www/wolfcms/wolf/app/controllers/PluginController.php
    -rwxrwxrwx 1 root root 6340 Dec  5  2015 /var/www/wolfcms/wolf/app/controllers/LayoutController.php
    -rwxrwxrwx 1 root root 12120 Dec  5  2015 /var/www/wolfcms/wolf/app/controllers/SettingController.php
    -rwxrwxrwx 1 root root 12898 Dec  5  2015 /var/www/wolfcms/wolf/app/controllers/UserController.php
    -rwxrwxrwx 1 root root 2016 Dec  5  2015 /var/www/wolfcms/wolf/app/cron.php
    -rwxrwxrwx 1 root root 10396 Dec  5  2015 /var/www/wolfcms/wolf/app/layouts/backend.php
    -rwxrwxrwx 1 root root 15015 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/bn-message.php
    -rwxrwxrwx 1 root root 14970 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/lv-message.php
    -rwxrwxrwx 1 root root 16705 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/pt-message.php
    -rwxrwxrwx 1 root root 15305 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/sk-message.php
    -rwxrwxrwx 1 root root 16540 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/ar-message.php
    -rwxrwxrwx 1 root root 15073 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/id-message.php
    -rwxrwxrwx 1 root root 15179 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/ro-message.php
    -rwxrwxrwx 1 root root 15026 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/nl-message.php
    -rwxrwxrwx 1 root root 14355 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/zh_TW-message.php
    -rwxrwxrwx 1 root root 15018 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/sq-message.php
    -rwxrwxrwx 1 root root 14490 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/sl-message.php
    -rwxrwxrwx 1 root root 14800 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/hr-message.php
    -rwxrwxrwx 1 root root 19528 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/ru-message.php
    -rwxrwxrwx 1 root root 15238 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/it-message.php
    -rwxrwxrwx 1 root root 20046 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/th-message.php
    -rwxrwxrwx 1 root root 14720 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/no-message.php
    -rwxrwxrwx 1 root root 15984 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/ja-message.php
    -rwxrwxrwx 1 root root 14246 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/en-message.php
    -rwxrwxrwx 1 root root 15835 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/fr-message.php
    -rwxrwxrwx 1 root root 16646 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/fi-message.php
    -rwxrwxrwx 1 root root 14315 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/et-message.php
    -rwxrwxrwx 1 root root 16415 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/fa_IR-message.php
    -rwxrwxrwx 1 root root 15241 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/lt-message.php
    -rwxrwxrwx 1 root root 15005 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/sv-message.php
    -rwxrwxrwx 1 root root 14642 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/da-message.php
    -rwxrwxrwx 1 root root 19503 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/uk-message.php
    -rwxrwxrwx 1 root root 15238 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/he-message.php
    -rwxrwxrwx 1 root root 14908 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/pt_BR-message.php
    -rwxrwxrwx 1 root root 15203 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/tr-message.php
    -rwxrwxrwx 1 root root 14840 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/pl-message.php
    -rwxrwxrwx 1 root root 16231 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/de-message.php
    -rwxrwxrwx 1 root root 16315 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/es-message.php
    -rwxrwxrwx 1 root root 15123 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/hu-message.php
    -rwxrwxrwx 1 root root 13739 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/zh-message.php
    -rwxrwxrwx 1 root root 20240 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/bg-message.php
    -rwxrwxrwx 1 root root 15112 Dec  5  2015 /var/www/wolfcms/wolf/app/i18n/cs-message.php
    -rwxrwxrwx 1 root root 38413 Dec  5  2015 /var/www/wolfcms/wolf/app/models/Page.php
    -rwxrwxrwx 1 root root 1068 Dec  5  2015 /var/www/wolfcms/wolf/app/models/UserRole.php
    -rwxrwxrwx 1 root root 2408 Dec  5  2015 /var/www/wolfcms/wolf/app/models/Filter.php
    -rwxrwxrwx 1 root root 1630 Dec  5  2015 /var/www/wolfcms/wolf/app/models/PagePart.php
    -rwxrwxrwx 1 root root 2762 Dec  5  2015 /var/www/wolfcms/wolf/app/models/Setting.php
    -rwxrwxrwx 1 root root 1463 Dec  5  2015 /var/www/wolfcms/wolf/app/models/Cron.php
    -rwxrwxrwx 1 root root 2590 Dec  5  2015 /var/www/wolfcms/wolf/app/models/Layout.php
    -rwxrwxrwx 1 root root 32043 Dec  5  2015 /var/www/wolfcms/wolf/app/models/Node.php
    -rwxrwxrwx 1 root root 2917 Dec  5  2015 /var/www/wolfcms/wolf/app/models/Snippet.php
    -rwxrwxrwx 1 root root 849 Dec  5  2015 /var/www/wolfcms/wolf/app/models/PageTag.php
    -rwxrwxrwx 1 root root 2974 Dec  5  2015 /var/www/wolfcms/wolf/app/models/User.php
    -rwxrwxrwx 1 root root 1466 Dec  5  2015 /var/www/wolfcms/wolf/app/models/UserPermission.php
    -rwxrwxrwx 1 root root 1263 Dec  5  2015 /var/www/wolfcms/wolf/app/models/Tag.php
    -rwxrwxrwx 1 root root 1745 Dec  5  2015 /var/www/wolfcms/wolf/app/models/RolePermission.php
    -rwxrwxrwx 1 root root 2681 Dec  5  2015 /var/www/wolfcms/wolf/app/models/Permission.php
    -rwxrwxrwx 1 root root 5499 Dec  5  2015 /var/www/wolfcms/wolf/app/models/SecureToken.php
    -rwxrwxrwx 1 root root 3106 Dec  5  2015 /var/www/wolfcms/wolf/app/models/Behavior.php
    -rwxrwxrwx 1 root root 17187 Dec  5  2015 /var/www/wolfcms/wolf/app/models/Plugin.php
    -rwxrwxrwx 1 root root 12006 Dec  5  2015 /var/www/wolfcms/wolf/app/models/AuthUser.php
    -rwxrwxrwx 1 root root 2846 Dec  5  2015 /var/www/wolfcms/wolf/app/models/Role.php
    -rwxrwxrwx 1 root root 5152 Dec  5  2015 /var/www/wolfcms/wolf/app/main.php
    -rwxrwxrwx 1 root root 2240 Dec  5  2015 /var/www/wolfcms/wolf/app/views/user/index.php
    -rwxrwxrwx 1 root root 5220 Dec  5  2015 /var/www/wolfcms/wolf/app/views/user/edit.php
    -rwxrwxrwx 1 root root 1101 Dec  5  2015 /var/www/wolfcms/wolf/app/views/user/sidebar.php
    -rwxrwxrwx 1 root root 3402 Dec  5  2015 /var/www/wolfcms/wolf/app/views/snippet/index.php
    -rwxrwxrwx 1 root root 4214 Dec  5  2015 /var/www/wolfcms/wolf/app/views/snippet/edit.php
    -rwxrwxrwx 1 root root 1376 Dec  5  2015 /var/www/wolfcms/wolf/app/views/snippet/sidebar.php
    -rwxrwxrwx 1 root root 5145 Dec  5  2015 /var/www/wolfcms/wolf/app/views/page/children.php
    -rwxrwxrwx 1 root root 11711 Dec  5  2015 /var/www/wolfcms/wolf/app/views/page/index.php
    -rwxrwxrwx 1 root root 3497 Dec  5  2015 /var/www/wolfcms/wolf/app/views/page/part_edit.php
    -rwxrwxrwx 1 root root 22196 Dec  5  2015 /var/www/wolfcms/wolf/app/views/page/edit.php
    -rwxrwxrwx 1 root root 4999 Dec  5  2015 /var/www/wolfcms/wolf/app/views/login/login.php
    -rwxrwxrwx 1 root root 3431 Dec  5  2015 /var/www/wolfcms/wolf/app/views/login/forgot.php
    -rwxrwxrwx 1 root root 1641 Dec  5  2015 /var/www/wolfcms/wolf/app/views/404.php
    -rwxrwxrwx 1 root root 15544 Dec  5  2015 /var/www/wolfcms/wolf/app/views/setting/index.php
    -rwxrwxrwx 1 root root 3243 Dec  5  2015 /var/www/wolfcms/wolf/app/views/layout/index.php
    -rwxrwxrwx 1 root root 3161 Dec  5  2015 /var/www/wolfcms/wolf/app/views/layout/edit.php
    -rwxrwxrwx 1 root root 1194 Dec  5  2015 /var/www/wolfcms/wolf/app/views/layout/sidebar.php
    -rwxrwxrwx 1 root root 792 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-deny-disabled-32-ns.png
    -rwxrwxrwx 1 root root 1405 Dec  5  2015 /var/www/wolfcms/wolf/icons/settings-32.png
    -rwxrwxrwx 1 root root 585 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-approve-16.png
    -rwxrwxrwx 1 root root 649 Dec  5  2015 /var/www/wolfcms/wolf/icons/page-32.png
    -rwxrwxrwx 1 root root 985 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-download-32-ns.png
    -rwxrwxrwx 1 root root 374 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-rename-disabled-16-ns.png
    -rwxrwxrwx 1 root root 849 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-deny-disabled-32.png
    -rwxrwxrwx 1 root root 297 Dec  5  2015 /var/www/wolfcms/wolf/icons/plugin-16-ns.png
    -rwxrwxrwx 1 root root 695 Dec  5  2015 /var/www/wolfcms/wolf/icons/book-32.png
    -rwxrwxrwx 1 root root 1371 Dec  5  2015 /var/www/wolfcms/wolf/icons/settings-32-ns.png
    -rwxrwxrwx 1 root root 840 Dec  5  2015 /var/www/wolfcms/wolf/icons/snippet-32.png
    -rwxrwxrwx 1 root root 625 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-deny-16-ns.png
    -rwxrwxrwx 1 root root 635 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-deny-16.png
    -rwxrwxrwx 1 root root 480 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-download-16.png
    -rwxrwxrwx 1 root root 693 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-add-disabled-32.png
    -rwxrwxrwx 1 root root 314 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-delete-disabled-16-ns.png
    -rwxrwxrwx 1 root root 387 Dec  5  2015 /var/www/wolfcms/wolf/icons/download-disabled-16-ns.png
    -rwxrwxrwx 1 root root 398 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-approve-disabled-16-ns.png
    -rwxrwxrwx 1 root root 965 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-upload-32-ns.png
    -rwxrwxrwx 1 root root 980 Dec  5  2015 /var/www/wolfcms/wolf/icons/comment-32.png
    -rwxrwxrwx 1 root root 530 Dec  5  2015 /var/www/wolfcms/wolf/icons/documentation-16-ns.png
    -rwxrwxrwx 1 root root 538 Dec  5  2015 /var/www/wolfcms/wolf/icons/cloud-16.png
    -rwxrwxrwx 1 root root 464 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-download-16-ns.png
    -rwxrwxrwx 1 root root 747 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-envelope-32-ns.png
    -rwxrwxrwx 1 root root 467 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-envelope-16.png
    -rwxrwxrwx 1 root root 516 Dec  5  2015 /var/www/wolfcms/wolf/icons/rss-16-ns.png
    -rwxrwxrwx 1 root root 1138 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-image-32.png
    -rwxrwxrwx 1 root root 939 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-php-32.png
    -rwxrwxrwx 1 root root 460 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-unknown-32-ns.png
    -rwxrwxrwx 1 root root 895 Dec  5  2015 /var/www/wolfcms/wolf/icons/comment-blank-32.png
    -rwxrwxrwx 1 root root 725 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-approve-disabled-32-ns.png
    -rwxrwxrwx 1 root root 1331 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-deny-32.png
    -rwxrwxrwx 1 root root 350 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-delete-disabled-16.png
    -rwxrwxrwx 1 root root 399 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-download-disabled-16.png
    -rwxrwxrwx 1 root root 527 Dec  5  2015 /var/www/wolfcms/wolf/icons/rss-16.png
    -rwxrwxrwx 1 root root 1280 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-deny-32-ns.png
    -rwxrwxrwx 1 root root 660 Dec  5  2015 /var/www/wolfcms/wolf/icons/book-32-ns.png
    -rwxrwxrwx 1 root root 467 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-folder-16-ns.png
    -rwxrwxrwx 1 root root 406 Dec  5  2015 /var/www/wolfcms/wolf/icons/settings-16-ns.png
    -rwxrwxrwx 1 root root 955 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-rename-32-ns.png
    -rwxrwxrwx 1 root root 433 Dec  5  2015 /var/www/wolfcms/wolf/icons/snippet-16-ns.png
    -rwxrwxrwx 1 root root 395 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-upload-disabled-16-ns.png
    -rwxrwxrwx 1 root root 580 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-image-16-ns.png
    -rwxrwxrwx 1 root root 1048 Dec  5  2015 /var/www/wolfcms/wolf/icons/documentation-32.png
    -rwxrwxrwx 1 root root 574 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-open-16-ns.png
    -rwxrwxrwx 1 root root 628 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-image-16.png
    -rwxrwxrwx 1 root root 522 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-php-16-ns.png
    -rwxrwxrwx 1 root root 1218 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-open-32.png
    -rwxrwxrwx 1 root root 389 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-delete-16-ns.png
    -rwxrwxrwx 1 root root 476 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-rename-16.png
    -rwxrwxrwx 1 root root 494 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-add-16.png
    -rwxrwxrwx 1 root root 404 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-unknown-16.png
    -rwxrwxrwx 1 root root 707 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-rename-disabled-32-ns.png
    -rwxrwxrwx 1 root root 1076 Dec  5  2015 /var/www/wolfcms/wolf/icons/rss-32-ns.png
    -rwxrwxrwx 1 root root 507 Dec  5  2015 /var/www/wolfcms/wolf/icons/cloud-16-ns.png
    -rwxrwxrwx 1 root root 798 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-envelope-32.png
    -rwxrwxrwx 1 root root 462 Dec  5  2015 /var/www/wolfcms/wolf/icons/plugin-32-ns.png
    -rwxrwxrwx 1 root root 574 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-archive-16-ns.png
    -rwxrwxrwx 1 root root 406 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-rename-disabled-16.png
    -rwxrwxrwx 1 root root 1129 Dec  5  2015 /var/www/wolfcms/wolf/icons/rss-32.png
    -rwxrwxrwx 1 root root 778 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-delete-32.png
    -rwxrwxrwx 1 root root 781 Dec  5  2015 /var/www/wolfcms/wolf/icons/snippet-32-ns.png
    -rwxrwxrwx 1 root root 359 Dec  5  2015 /var/www/wolfcms/wolf/icons/book-16-ns.png
    -rwxrwxrwx 1 root root 594 Dec  5  2015 /var/www/wolfcms/wolf/icons/page-32-ns.png
    -rwxrwxrwx 1 root root 768 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-download-disabled-32.png
    -rwxrwxrwx 1 root root 537 Dec  5  2015 /var/www/wolfcms/wolf/icons/plugin-32.png
    -rwxrwxrwx 1 root root 458 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-upload-16-ns.png
    -rwxrwxrwx 1 root root 444 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-deny-disabled-16-ns.png
    -rwxrwxrwx 1 root root 858 Dec  5  2015 /var/www/wolfcms/wolf/icons/comment-32-ns.png
    -rwxrwxrwx 1 root root 1109 Dec  5  2015 /var/www/wolfcms/wolf/icons/cloud-32.png
    -rwxrwxrwx 1 root root 1074 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-archive-32.png
    -rwxrwxrwx 1 root root 725 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-upload-disabled-32-ns.png
    -rwxrwxrwx 1 root root 448 Dec  5  2015 /var/www/wolfcms/wolf/icons/comment-blank-16-ns.png
    -rwxrwxrwx 1 root root 481 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-folder-16.png
    -rwxrwxrwx 1 root root 387 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-download-disabled-16-ns.png
    -rwxrwxrwx 1 root root 1025 Dec  5  2015 /var/www/wolfcms/wolf/icons/cloud-32-ns.png
    -rwxrwxrwx 1 root root 424 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-open-disabled-16-ns.png
    -rwxrwxrwx 1 root root 725 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-delete-32-ns.png
    -rwxrwxrwx 1 root root 361 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-add-disabled-16-ns.png
    -rwxrwxrwx 1 root root 582 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-open-16.png
    -rwxrwxrwx 1 root root 453 Dec  5  2015 /var/www/wolfcms/wolf/icons/page-16.png
    -rwxrwxrwx 1 root root 561 Dec  5  2015 /var/www/wolfcms/wolf/icons/layout-16.png
    -rwxrwxrwx 1 root root 774 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-upload-disabled-32.png
    -rwxrwxrwx 1 root root 437 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-open-disabled-16.png
    -rwxrwxrwx 1 root root 535 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-php-16.png
    -rwxrwxrwx 1 root root 577 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-approve-16-ns.png
    -rwxrwxrwx 1 root root 887 Dec  5  2015 /var/www/wolfcms/wolf/icons/layout-32-ns.png
    -rwxrwxrwx 1 root root 737 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-folder-32.png
    -rwxrwxrwx 1 root root 545 Dec  5  2015 /var/www/wolfcms/wolf/icons/documentation-16.png
    -rwxrwxrwx 1 root root 446 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-envelope-16-ns.png
    -rwxrwxrwx 1 root root 384 Dec  5  2015 /var/www/wolfcms/wolf/icons/book-16.png
    -rwxrwxrwx 1 root root 433 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-rename-16-ns.png
    -rwxrwxrwx 1 root root 413 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-approve-disabled-16.png
    -rwxrwxrwx 1 root root 1008 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-archive-32-ns.png
    -rwxrwxrwx 1 root root 1089 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-image-32-ns.png
    -rwxrwxrwx 1 root root 651 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-add-disabled-32-ns.png
    -rwxrwxrwx 1 root root 398 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-add-disabled-16.png
    -rwxrwxrwx 1 root root 838 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-open-disabled-32.png
    -rwxrwxrwx 1 root root 603 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-delete-disabled-32.png
    -rwxrwxrwx 1 root root 771 Dec  5  2015 /var/www/wolfcms/wolf/icons/comment-blank-32-ns.png
    -rwxrwxrwx 1 root root 494 Dec  5  2015 /var/www/wolfcms/wolf/icons/snippet-16.png
    -rwxrwxrwx 1 root root 854 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-add-32-ns.png
    -rwxrwxrwx 1 root root 557 Dec  5  2015 /var/www/wolfcms/wolf/icons/comment-16-ns.png
    -rwxrwxrwx 1 root root 899 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-php-32-ns.png
    -rwxrwxrwx 1 root root 1165 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-approve-32-ns.png
    -rwxrwxrwx 1 root root 704 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-download-disabled-32-ns.png
    -rwxrwxrwx 1 root root 422 Dec  5  2015 /var/www/wolfcms/wolf/icons/settings-16.png
    -rwxrwxrwx 1 root root 999 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-rename-32.png
    -rwxrwxrwx 1 root root 900 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-add-32.png
    -rwxrwxrwx 1 root root 315 Dec  5  2015 /var/www/wolfcms/wolf/icons/plugin-16.png
    -rwxrwxrwx 1 root root 1015 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-upload-32.png
    -rwxrwxrwx 1 root root 1210 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-approve-32.png
    -rwxrwxrwx 1 root root 570 Dec  5  2015 /var/www/wolfcms/wolf/icons/comment-16.png
    -rwxrwxrwx 1 root root 592 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-archive-16.png
    -rwxrwxrwx 1 root root 381 Dec  5  2015 /var/www/wolfcms/wolf/icons/page-16-ns.png
    -rwxrwxrwx 1 root root 459 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-deny-disabled-16.png
    -rwxrwxrwx 1 root root 341 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-unknown-16-ns.png
    -rwxrwxrwx 1 root root 453 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-add-16-ns.png
    -rwxrwxrwx 1 root root 510 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-unknown-32.png
    -rwxrwxrwx 1 root root 704 Dec  5  2015 /var/www/wolfcms/wolf/icons/download-disabled-32-ns.png
    -rwxrwxrwx 1 root root 423 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-delete-16.png
    -rwxrwxrwx 1 root root 917 Dec  5  2015 /var/www/wolfcms/wolf/icons/layout-32.png
    -rwxrwxrwx 1 root root 1019 Dec  5  2015 /var/www/wolfcms/wolf/icons/documentation-32-ns.png
    -rwxrwxrwx 1 root root 558 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-delete-disabled-32-ns.png
    -rwxrwxrwx 1 root root 701 Dec  5  2015 /var/www/wolfcms/wolf/icons/file-folder-32-ns.png
    -rwxrwxrwx 1 root root 766 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-rename-disabled-32.png
    -rwxrwxrwx 1 root root 1041 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-download-32.png
    -rwxrwxrwx 1 root root 1170 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-open-32-ns.png
    -rwxrwxrwx 1 root root 778 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-open-disabled-32-ns.png
    -rwxrwxrwx 1 root root 474 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-upload-16.png
    -rwxrwxrwx 1 root root 407 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-upload-disabled-16.png
    -rwxrwxrwx 1 root root 792 Dec  5  2015 /var/www/wolfcms/wolf/icons/action-approve-disabled-32.png
    -rwxrwxrwx 1 root root 484 Dec  5  2015 /var/www/wolfcms/wolf/icons/comment-blank-16.png
    -rwxrwxrwx 1 root root 512 Dec  5  2015 /var/www/wolfcms/wolf/icons/layout-16-ns.png
    -rwxrwxrwx 1 root root 5467 Dec  5  2015 /var/www/wolfcms/wolf/helpers/Pagination.php
    -rwxrwxrwx 1 root root 118267 Dec  5  2015 /var/www/wolfcms/wolf/helpers/BigInteger.php
    -rwxrwxrwx 1 root root 27953 Dec  5  2015 /var/www/wolfcms/wolf/helpers/Hash.php
    -rwxrwxrwx 1 root root 41129 Dec  5  2015 /var/www/wolfcms/wolf/helpers/Email.php
    -rwxrwxrwx 1 root root 5560 Dec  5  2015 /var/www/wolfcms/wolf/helpers/Gravatar.php
    -rwxrwxrwx 1 root root 25331 Dec  5  2015 /var/www/wolfcms/wolf/helpers/Upload.php
    -rwxrwxrwx 1 root root 5319 Dec  5  2015 /var/www/wolfcms/wolf/helpers/I18n.php
    -rwxrwxrwx 1 root root 21682 Dec  5  2015 /var/www/wolfcms/wolf/helpers/Kses.php
    -rwxrwxrwx 1 root root 32521 Dec  5  2015 /var/www/wolfcms/wolf/helpers/Validate.php
    -rwxrwxrwx 1 root root 7478 Dec  5  2015 /var/www/wolfcms/wolf/helpers/Zip.php
    -rwxrwxrwx 1 root root 21152 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/test.jpg
    -rwxrwxrwx 1 root root 59196 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/fonts/wolf.ttf
    -rwxrwxrwx 1 root root 2203 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/uninstall.php
    -rwxrwxrwx 1 root root 684 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/disable.php
    -rwxrwxrwx 1 root root 1950 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/comment.css
    -rwxrwxrwx 1 root root 7058 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/enable.php
    -rwxrwxrwx 1 root root 10583 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/index.php
    -rwxrwxrwx 1 root root 3910 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/lv-message.php
    -rwxrwxrwx 1 root root 4677 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/pt-message.php
    -rwxrwxrwx 1 root root 3979 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/sk-message.php
    -rwxrwxrwx 1 root root 3962 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/ar-message.php
    -rwxrwxrwx 1 root root 3974 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/id-message.php
    -rwxrwxrwx 1 root root 4161 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/ro-message.php
    -rwxrwxrwx 1 root root 3921 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/nl-message.php
    -rwxrwxrwx 1 root root 3901 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/zh_TW-message.php
    -rwxrwxrwx 1 root root 3865 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/sl-message.php
    -rwxrwxrwx 1 root root 3899 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/hr-message.php
    -rwxrwxrwx 1 root root 5398 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/ru-message.php
    -rwxrwxrwx 1 root root 4109 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/it-message.php
    -rwxrwxrwx 1 root root 4059 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/th-message.php
    -rwxrwxrwx 1 root root 3962 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/no-message.php
    -rwxrwxrwx 1 root root 4471 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/ja-message.php
    -rwxrwxrwx 1 root root 3896 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/en-message.php
    -rwxrwxrwx 1 root root 4409 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/fr-message.php
    -rwxrwxrwx 1 root root 4089 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/fi-message.php
    -rwxrwxrwx 1 root root 3971 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/fa_IR-message.php
    -rwxrwxrwx 1 root root 4123 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/lt-message.php
    -rwxrwxrwx 1 root root 4034 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/sv-message.php
    -rwxrwxrwx 1 root root 5470 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/uk-message.php
    -rwxrwxrwx 1 root root 4066 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/pt_BR-message.php
    -rwxrwxrwx 1 root root 3884 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/tr-message.php
    -rwxrwxrwx 1 root root 3980 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/pl-message.php
    -rwxrwxrwx 1 root root 4299 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/de-message.php
    -rwxrwxrwx 1 root root 4439 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/es-message.php
    -rwxrwxrwx 1 root root 4160 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/hu-message.php
    -rwxrwxrwx 1 root root 3858 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/zh-message.php
    -rwxrwxrwx 1 root root 4059 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/bg-message.php
    -rwxrwxrwx 1 root root 4061 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/i18n/cs-message.php
    -rwxrwxrwx 1 root root 3229 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/Comment.php
    -rwxrwxrwx 1 root root 2583 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/readme.txt
    -rwxrwxrwx 1 root root 5191 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/views/moderation.php
    -rwxrwxrwx 1 root root 4359 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/views/settings.php
    -rwxrwxrwx 1 root root 2631 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/views/documentation.php
    -rwxrwxrwx 1 root root 5127 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/views/index.php
    -rwxrwxrwx 1 root root 2316 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/views/edit.php
    -rwxrwxrwx 1 root root 1743 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/views/sidebar.php
    -rwxrwxrwx 1 root root 5520 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/CommentController.php
    -rwxrwxrwx 1 root root 1567 Dec  5  2015 /var/www/wolfcms/wolf/plugins/comment/image.php
    -rwxrwxrwx 1 root root 2259 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/MultiLangController.php
    -rwxrwxrwx 1 root root 1264 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/enable.php
    -rwxrwxrwx 1 root root 5003 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/index.php
    -rwxrwxrwx 1 root root 2021 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/lv-message.php
    -rwxrwxrwx 1 root root 2270 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/pt-message.php
    -rwxrwxrwx 1 root root 2013 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/sk-message.php
    -rwxrwxrwx 1 root root 2073 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/ar-message.php
    -rwxrwxrwx 1 root root 2058 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/id-message.php
    -rwxrwxrwx 1 root root 2075 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/ro-message.php
    -rwxrwxrwx 1 root root 2051 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/nl-message.php
    -rwxrwxrwx 1 root root 2001 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/zh_TW-message.php
    -rwxrwxrwx 1 root root 2007 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/sl-message.php
    -rwxrwxrwx 1 root root 1972 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/hr-message.php
    -rwxrwxrwx 1 root root 2471 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/ru-message.php
    -rwxrwxrwx 1 root root 2053 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/it-message.php
    -rwxrwxrwx 1 root root 2170 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/th-message.php
    -rwxrwxrwx 1 root root 2001 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/no-message.php
    -rwxrwxrwx 1 root root 2068 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/ja-message.php
    -rwxrwxrwx 1 root root 2007 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/en-message.php
    -rwxrwxrwx 1 root root 2114 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/fr-message.php
    -rwxrwxrwx 1 root root 2110 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/fi-message.php
    -rwxrwxrwx 1 root root 2020 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/fa_IR-message.php
    -rwxrwxrwx 1 root root 2015 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/lt-message.php
    -rwxrwxrwx 1 root root 2045 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/sv-message.php
    -rwxrwxrwx 1 root root 2015 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/da-message.php
    -rwxrwxrwx 1 root root 2606 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/uk-message.php
    -rwxrwxrwx 1 root root 2017 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/he-message.php
    -rwxrwxrwx 1 root root 2075 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/pt_BR-message.php
    -rwxrwxrwx 1 root root 2063 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/tr-message.php
    -rwxrwxrwx 1 root root 2041 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/pl-message.php
    -rwxrwxrwx 1 root root 2180 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/de-message.php
    -rwxrwxrwx 1 root root 2160 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/es-message.php
    -rwxrwxrwx 1 root root 1987 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/hu-message.php
    -rwxrwxrwx 1 root root 1777 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/zh-message.php
    -rwxrwxrwx 1 root root 2242 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/bg-message.php
    -rwxrwxrwx 1 root root 1999 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/i18n/cs-message.php
    -rwxrwxrwx 1 root root 583 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/readme.txt
    -rwxrwxrwx 1 root root 3924 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/views/settings.php
    -rwxrwxrwx 1 root root 3766 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/views/documentation.php
    -rwxrwxrwx 1 root root 1441 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/views/sidebar.php
    -rwxrwxrwx 1 root root 0 Dec  5  2015 /var/www/wolfcms/wolf/plugins/multi_lang/multi_lang.css
    -rwxrwxrwx 1 root root 962 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/uninstall.php
    -rwxrwxrwx 1 root root 2616 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/file_manager.js
    -rwxrwxrwx 1 root root 1545 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/enable.php
    -rwxrwxrwx 1 root root 1880 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/index.php
    -rwxrwxrwx 1 root root 6112 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/pt-message.php
    -rwxrwxrwx 1 root root 5148 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/sk-message.php
    -rwxrwxrwx 1 root root 5200 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/id-message.php
    -rwxrwxrwx 1 root root 5229 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/ro-message.php
    -rwxrwxrwx 1 root root 5422 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/nl-message.php
    -rwxrwxrwx 1 root root 5079 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/zh_TW-message.php
    -rwxrwxrwx 1 root root 5092 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/sl-message.php
    -rwxrwxrwx 1 root root 5175 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/hr-message.php
    -rwxrwxrwx 1 root root 6743 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/ru-message.php
    -rwxrwxrwx 1 root root 5281 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/it-message.php
    -rwxrwxrwx 1 root root 5126 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/no-message.php
    -rwxrwxrwx 1 root root 6059 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/ja-message.php
    -rwxrwxrwx 1 root root 5081 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/en-message.php
    -rwxrwxrwx 1 root root 5774 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/fr-message.php
    -rwxrwxrwx 1 root root 5534 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/fi-message.php
    -rwxrwxrwx 1 root root 5124 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/fa_IR-message.php
    -rwxrwxrwx 1 root root 5133 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/lt-message.php
    -rwxrwxrwx 1 root root 4969 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/sv-message.php
    -rwxrwxrwx 1 root root 5097 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/da-message.php
    -rwxrwxrwx 1 root root 6895 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/uk-message.php
    -rwxrwxrwx 1 root root 5437 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/pt_BR-message.php
    -rwxrwxrwx 1 root root 5060 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/tr-message.php
    -rwxrwxrwx 1 root root 5233 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/pl-message.php
    -rwxrwxrwx 1 root root 5649 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/de-message.php
    -rwxrwxrwx 1 root root 5580 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/es-message.php
    -rwxrwxrwx 1 root root 5332 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/hu-message.php
    -rwxrwxrwx 1 root root 5067 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/zh-message.php
    -rwxrwxrwx 1 root root 5808 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/bg-message.php
    -rwxrwxrwx 1 root root 5252 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/i18n/cs-message.php
    -rwxrwxrwx 1 root root 4482 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/views/settings.php
    -rwxrwxrwx 1 root root 8521 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/views/index.php
    -rwxrwxrwx 1 root root 2853 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/views/view.php
    -rwxrwxrwx 1 root root 1319 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/views/sidebar.php
    -rwxrwxrwx 1 root root 26054 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/FileManagerController.php
    -rwxrwxrwx 1 root root 104 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/file_manager.css
    -rwxrwxrwx 1 root root 1579 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/images/dir.png
    -rwxrwxrwx 1 root root 432 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/images/page_16.png
    -rwxrwxrwx 1 root root 600 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/images/dir_16.png
    -rwxrwxrwx 1 root root 945 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/images/page.png
    -rwxrwxrwx 1 root root 2084 Dec  5  2015 /var/www/wolfcms/wolf/plugins/file_manager/images/upload.png
    -rwxrwxrwx 1 root root 864 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/uninstall.php
    -rwxrwxrwx 1 root root 803 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/enable.php
    -rwxrwxrwx 1 root root 1426 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/index.php
    -rwxrwxrwx 1 root root 1151 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/lv-message.php
    -rwxrwxrwx 1 root root 1381 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/pt-message.php
    -rwxrwxrwx 1 root root 1144 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/sk-message.php
    -rwxrwxrwx 1 root root 1203 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/ar-message.php
    -rwxrwxrwx 1 root root 1221 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/id-message.php
    -rwxrwxrwx 1 root root 1177 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/ro-message.php
    -rwxrwxrwx 1 root root 1204 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/nl-message.php
    -rwxrwxrwx 1 root root 1143 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/zh_TW-message.php
    -rwxrwxrwx 1 root root 1140 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/sl-message.php
    -rwxrwxrwx 1 root root 1158 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/hr-message.php
    -rwxrwxrwx 1 root root 1475 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/ru-message.php
    -rwxrwxrwx 1 root root 1200 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/it-message.php
    -rwxrwxrwx 1 root root 1300 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/th-message.php
    -rwxrwxrwx 1 root root 1159 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/no-message.php
    -rwxrwxrwx 1 root root 1269 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/ja-message.php
    -rwxrwxrwx 1 root root 1137 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/en-message.php
    -rwxrwxrwx 1 root root 1254 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/fr-message.php
    -rwxrwxrwx 1 root root 1185 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/fi-message.php
    -rwxrwxrwx 1 root root 1150 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/fa_IR-message.php
    -rwxrwxrwx 1 root root 1154 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/lt-message.php
    -rwxrwxrwx 1 root root 1177 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/sv-message.php
    -rwxrwxrwx 1 root root 1145 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/da-message.php
    -rwxrwxrwx 1 root root 1487 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/uk-message.php
    -rwxrwxrwx 1 root root 1147 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/he-message.php
    -rwxrwxrwx 1 root root 1207 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/pt_BR-message.php
    -rwxrwxrwx 1 root root 1119 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/tr-message.php
    -rwxrwxrwx 1 root root 1170 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/pl-message.php
    -rwxrwxrwx 1 root root 1303 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/de-message.php
    -rwxrwxrwx 1 root root 1178 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/es-message.php
    -rwxrwxrwx 1 root root 1124 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/hu-message.php
    -rwxrwxrwx 1 root root 1124 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/zh-message.php
    -rwxrwxrwx 1 root root 1464 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/bg-message.php
    -rwxrwxrwx 1 root root 1157 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/i18n/cs-message.php
    -rwxrwxrwx 1 root root 1098 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/readme.txt
    -rwxrwxrwx 1 root root 2557 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/views/settings.php
    -rwxrwxrwx 1 root root 883 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/views/sidebar.php
    -rwxrwxrwx 1 root root 1768 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/ArchiveController.php
    -rwxrwxrwx 1 root root 5840 Dec  5  2015 /var/www/wolfcms/wolf/plugins/archive/archive.php
    -rwxrwxrwx 1 root root 52055 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/classTextile.php
    -rwxrwxrwx 1 root root 1134 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/index.php
    -rwxrwxrwx 1 root root 3913 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/textile.php
    -rwxrwxrwx 1 root root 277 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/pt-message.php
    -rwxrwxrwx 1 root root 283 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/id-message.php
    -rwxrwxrwx 1 root root 268 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/ro-message.php
    -rwxrwxrwx 1 root root 282 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/nl-message.php
    -rwxrwxrwx 1 root root 274 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/zh_TW-message.php
    -rwxrwxrwx 1 root root 284 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/hr-message.php
    -rwxrwxrwx 1 root root 297 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/ru-message.php
    -rwxrwxrwx 1 root root 274 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/it-message.php
    -rwxrwxrwx 1 root root 264 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/no-message.php
    -rwxrwxrwx 1 root root 316 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/ja-message.php
    -rwxrwxrwx 1 root root 268 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/en-message.php
    -rwxrwxrwx 1 root root 277 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/fr-message.php
    -rwxrwxrwx 1 root root 270 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/fi-message.php
    -rwxrwxrwx 1 root root 270 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/sv-message.php
    -rwxrwxrwx 1 root root 320 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/uk-message.php
    -rwxrwxrwx 1 root root 287 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/pt_BR-message.php
    -rwxrwxrwx 1 root root 282 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/tr-message.php
    -rwxrwxrwx 1 root root 263 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/pl-message.php
    -rwxrwxrwx 1 root root 277 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/de-message.php
    -rwxrwxrwx 1 root root 272 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/es-message.php
    -rwxrwxrwx 1 root root 283 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/hu-message.php
    -rwxrwxrwx 1 root root 274 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/zh-message.php
    -rwxrwxrwx 1 root root 322 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/bg-message.php
    -rwxrwxrwx 1 root root 275 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/i18n/cs-message.php
    -rwxrwxrwx 1 root root 907 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/readme.txt
    -rwxrwxrwx 1 root root 1453 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/textile.css
    -rwxrwxrwx 1 root root 898 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/filter_textile.php
    -rwxrwxrwx 1 root root 361 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/paragraph.png
    -rwxrwxrwx 1 root root 743 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/quotes.png
    -rwxrwxrwx 1 root root 537 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/preview.png
    -rwxrwxrwx 1 root root 343 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/link.png
    -rwxrwxrwx 1 root root 310 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/h6.png
    -rwxrwxrwx 1 root root 304 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/h5.png
    -rwxrwxrwx 1 root root 269 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/stroke.png
    -rwxrwxrwx 1 root root 293 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/h4.png
    -rwxrwxrwx 1 root root 276 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/h1.png
    -rwxrwxrwx 1 root root 344 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/list-bullet.png
    -rwxrwxrwx 1 root root 606 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/picture.png
    -rwxrwxrwx 1 root root 859 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/code.png
    -rwxrwxrwx 1 root root 304 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/h2.png
    -rwxrwxrwx 1 root root 304 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/bold.png
    -rwxrwxrwx 1 root root 357 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/list-numeric.png
    -rwxrwxrwx 1 root root 306 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/h3.png
    -rwxrwxrwx 1 root root 223 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/images/italic.png
    -rwxrwxrwx 1 root root 1091 Dec  5  2015 /var/www/wolfcms/wolf/plugins/textile/TextileController.php
    -rwxrwxrwx 1 root root 78695 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/classMarkdown.php
    -rwxrwxrwx 1 root root 981 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/filter_markdown.php
    -rwxrwxrwx 1 root root 1322 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/markdown.css
    -rwxrwxrwx 1 root root 1292 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/index.php
    -rwxrwxrwx 1 root root 349 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/pt-message.php
    -rwxrwxrwx 1 root root 365 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/id-message.php
    -rwxrwxrwx 1 root root 349 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/ro-message.php
    -rwxrwxrwx 1 root root 361 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/nl-message.php
    -rwxrwxrwx 1 root root 308 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/zh_TW-message.php
    -rwxrwxrwx 1 root root 356 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/hr-message.php
    -rwxrwxrwx 1 root root 379 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/ru-message.php
    -rwxrwxrwx 1 root root 351 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/it-message.php
    -rwxrwxrwx 1 root root 347 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/no-message.php
    -rwxrwxrwx 1 root root 357 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/ja-message.php
    -rwxrwxrwx 1 root root 349 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/en-message.php
    -rwxrwxrwx 1 root root 358 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/fr-message.php
    -rwxrwxrwx 1 root root 359 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/fi-message.php
    -rwxrwxrwx 1 root root 353 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/sv-message.php
    -rwxrwxrwx 1 root root 398 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/uk-message.php
    -rwxrwxrwx 1 root root 361 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/pt_BR-message.php
    -rwxrwxrwx 1 root root 363 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/tr-message.php
    -rwxrwxrwx 1 root root 354 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/pl-message.php
    -rwxrwxrwx 1 root root 368 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/de-message.php
    -rwxrwxrwx 1 root root 351 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/es-message.php
    -rwxrwxrwx 1 root root 359 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/hu-message.php
    -rwxrwxrwx 1 root root 354 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/zh-message.php
    -rwxrwxrwx 1 root root 399 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/bg-message.php
    -rwxrwxrwx 1 root root 357 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/i18n/cs-message.php
    -rwxrwxrwx 1 root root 996 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/readme.txt
    -rwxrwxrwx 1 root root 23516 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/smartypants.php
    -rwxrwxrwx 1 root root 4147 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/markdown.php
    -rwxrwxrwx 1 root root 361 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/paragraph.png
    -rwxrwxrwx 1 root root 743 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/quotes.png
    -rwxrwxrwx 1 root root 537 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/preview.png
    -rwxrwxrwx 1 root root 343 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/link.png
    -rwxrwxrwx 1 root root 310 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/h6.png
    -rwxrwxrwx 1 root root 304 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/h5.png
    -rwxrwxrwx 1 root root 269 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/stroke.png
    -rwxrwxrwx 1 root root 293 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/h4.png
    -rwxrwxrwx 1 root root 276 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/h1.png
    -rwxrwxrwx 1 root root 344 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/list-bullet.png
    -rwxrwxrwx 1 root root 606 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/picture.png
    -rwxrwxrwx 1 root root 859 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/code.png
    -rwxrwxrwx 1 root root 304 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/h2.png
    -rwxrwxrwx 1 root root 304 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/bold.png
    -rwxrwxrwx 1 root root 357 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/list-numeric.png
    -rwxrwxrwx 1 root root 306 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/h3.png
    -rwxrwxrwx 1 root root 223 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/images/italic.png
    -rwxrwxrwx 1 root root 979 Dec  5  2015 /var/www/wolfcms/wolf/plugins/markdown/MarkdownController.php
    -rwxrwxrwx 1 root root 1150 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/uninstall.php
    -rwxrwxrwx 1 root root 1152 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/disable.php
    -rwxrwxrwx 1 root root 1156 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/enable.php
    -rwxrwxrwx 1 root root 1583 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/index.php
    -rwxrwxrwx 1 root root 900 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/lv-message.php
    -rwxrwxrwx 1 root root 1005 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/pt-message.php
    -rwxrwxrwx 1 root root 893 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/sk-message.php
    -rwxrwxrwx 1 root root 955 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/ar-message.php
    -rwxrwxrwx 1 root root 956 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/id-message.php
    -rwxrwxrwx 1 root root 914 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/ro-message.php
    -rwxrwxrwx 1 root root 912 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/nl-message.php
    -rwxrwxrwx 1 root root 894 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/zh_TW-message.php
    -rwxrwxrwx 1 root root 893 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/sl-message.php
    -rwxrwxrwx 1 root root 895 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/hr-message.php
    -rwxrwxrwx 1 root root 1137 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/ru-message.php
    -rwxrwxrwx 1 root root 923 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/it-message.php
    -rwxrwxrwx 1 root root 1040 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/th-message.php
    -rwxrwxrwx 1 root root 881 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/no-message.php
    -rwxrwxrwx 1 root root 944 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/ja-message.php
    -rwxrwxrwx 1 root root 891 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/en-message.php
    -rwxrwxrwx 1 root root 930 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/fr-message.php
    -rwxrwxrwx 1 root root 920 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/fi-message.php
    -rwxrwxrwx 1 root root 897 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/fa_IR-message.php
    -rwxrwxrwx 1 root root 893 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/lt-message.php
    -rwxrwxrwx 1 root root 948 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/sv-message.php
    -rwxrwxrwx 1 root root 896 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/da-message.php
    -rwxrwxrwx 1 root root 1249 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/uk-message.php
    -rwxrwxrwx 1 root root 895 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/he-message.php
    -rwxrwxrwx 1 root root 898 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/pt_BR-message.php
    -rwxrwxrwx 1 root root 950 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/tr-message.php
    -rwxrwxrwx 1 root root 910 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/pl-message.php
    -rwxrwxrwx 1 root root 991 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/de-message.php
    -rwxrwxrwx 1 root root 918 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/es-message.php
    -rwxrwxrwx 1 root root 870 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/hu-message.php
    -rwxrwxrwx 1 root root 884 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/zh-message.php
    -rwxrwxrwx 1 root root 1196 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/bg-message.php
    -rwxrwxrwx 1 root root 890 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/i18n/cs-message.php
    -rwxrwxrwx 1 root root 2100 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/SkeletonController.php
    -rwxrwxrwx 1 root root 1572 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/readme.txt
    -rwxrwxrwx 1 root root 1811 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/views/settings.php
    -rwxrwxrwx 1 root root 1181 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/views/documentation.php
    -rwxrwxrwx 1 root root 1221 Dec  5  2015 /var/www/wolfcms/wolf/plugins/skeleton/views/sidebar.php
    -rwxrwxrwx 1 root root 16278 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/BackupRestoreController.php
    -rwxrwxrwx 1 root root 987 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/uninstall.php
    -rwxrwxrwx 1 root root 738 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/disable.php
    -rwxrwxrwx 1 root root 1421 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/enable.php
    -rwxrwxrwx 1 root root 1616 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/index.php
    -rwxrwxrwx 1 root root 8367 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/pt-message.php
    -rwxrwxrwx 1 root root 7684 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/id-message.php
    -rwxrwxrwx 1 root root 7725 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/ro-message.php
    -rwxrwxrwx 1 root root 7976 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/nl-message.php
    -rwxrwxrwx 1 root root 7538 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/zh_TW-message.php
    -rwxrwxrwx 1 root root 7540 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/sl-message.php
    -rwxrwxrwx 1 root root 7590 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/hr-message.php
    -rwxrwxrwx 1 root root 9466 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/ru-message.php
    -rwxrwxrwx 1 root root 7952 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/it-message.php
    -rwxrwxrwx 1 root root 7468 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/no-message.php
    -rwxrwxrwx 1 root root 8406 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/ja-message.php
    -rwxrwxrwx 1 root root 7543 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/en-message.php
    -rwxrwxrwx 1 root root 8477 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/fr-message.php
    -rwxrwxrwx 1 root root 7982 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/fi-message.php
    -rwxrwxrwx 1 root root 7543 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/lt-message.php
    -rwxrwxrwx 1 root root 7895 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/sv-message.php
    -rwxrwxrwx 1 root root 10814 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/uk-message.php
    -rwxrwxrwx 1 root root 7913 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/pt_BR-message.php
    -rwxrwxrwx 1 root root 7699 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/tr-message.php
    -rwxrwxrwx 1 root root 7687 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/pl-message.php
    -rwxrwxrwx 1 root root 8488 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/de-message.php
    -rwxrwxrwx 1 root root 8333 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/es-message.php
    -rwxrwxrwx 1 root root 7632 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/hu-message.php
    -rwxrwxrwx 1 root root 7405 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/zh-message.php
    -rwxrwxrwx 1 root root 7692 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/bg-message.php
    -rwxrwxrwx 1 root root 7610 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/i18n/cs-message.php
    -rwxrwxrwx 1 root root 750 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/readme.txt
    -rwxrwxrwx 1 root root 2821 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/views/restore.php
    -rwxrwxrwx 1 root root 9020 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/views/settings.php
    -rwxrwxrwx 1 root root 1866 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/views/documentation.php
    -rwxrwxrwx 1 root root 2053 Dec  5  2015 /var/www/wolfcms/wolf/plugins/backup_restore/views/sidebar.php
    -rwxrwxrwx 1 root root 1484 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/index.php
    -rwxrwxrwx 1 root root 288 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/pt-message.php
    -rwxrwxrwx 1 root root 258 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/id-message.php
    -rwxrwxrwx 1 root root 283 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/ro-message.php
    -rwxrwxrwx 1 root root 246 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/nl-message.php
    -rwxrwxrwx 1 root root 253 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/zh_TW-message.php
    -rwxrwxrwx 1 root root 255 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/hr-message.php
    -rwxrwxrwx 1 root root 313 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/ru-message.php
    -rwxrwxrwx 1 root root 250 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/it-message.php
    -rwxrwxrwx 1 root root 247 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/no-message.php
    -rwxrwxrwx 1 root root 294 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/ja-message.php
    -rwxrwxrwx 1 root root 233 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/en-message.php
    -rwxrwxrwx 1 root root 251 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/fr-message.php
    -rwxrwxrwx 1 root root 262 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/fi-message.php
    -rwxrwxrwx 1 root root 304 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/fa_IR-message.php
    -rwxrwxrwx 1 root root 229 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/sv-message.php
    -rwxrwxrwx 1 root root 350 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/uk-message.php
    -rwxrwxrwx 1 root root 253 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/pt_BR-message.php
    -rwxrwxrwx 1 root root 254 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/tr-message.php
    -rwxrwxrwx 1 root root 252 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/pl-message.php
    -rwxrwxrwx 1 root root 265 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/de-message.php
    -rwxrwxrwx 1 root root 263 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/es-message.php
    -rwxrwxrwx 1 root root 257 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/hu-message.php
    -rwxrwxrwx 1 root root 235 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/zh-message.php
    -rwxrwxrwx 1 root root 326 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/bg-message.php
    -rwxrwxrwx 1 root root 256 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/i18n/cs-message.php
    -rwxrwxrwx 1 root root 1713 Dec  5  2015 /var/www/wolfcms/wolf/plugins/page_not_found/readme.txt
    -rwxrwxrwx 1 root root 1247 Dec  5  2015 /var/www/wolfcms/wolf/utils.php
    -rwxrwxrwx 1 root root 2395 Dec  5  2015 /var/www/wolfcms/wolf/admin/stylesheets/login.css
    -rwxrwxrwx 1 root root 21593 Dec  5  2015 /var/www/wolfcms/wolf/admin/stylesheets/admin.css
    -rwxrwxrwx 1 root root 959 Dec  5  2015 /var/www/wolfcms/wolf/admin/javascripts/unitpngfix.js
    -rwxrwxrwx 1 root root 228078 Dec  5  2015 /var/www/wolfcms/wolf/admin/javascripts/jquery-ui-1.10.3.min.js
    -rwxrwxrwx 1 root root 93636 Dec  5  2015 /var/www/wolfcms/wolf/admin/javascripts/jquery-1.8.3.min.js
    -rwxrwxrwx 1 root root 13982 Dec  5  2015 /var/www/wolfcms/wolf/admin/javascripts/jquery.ui.nestedSortable.js
    -rwxrwxrwx 1 root root 5421 Dec  5  2015 /var/www/wolfcms/wolf/admin/javascripts/cp-datepicker.js
    -rwxrwxrwx 1 root root 2634 Dec  5  2015 /var/www/wolfcms/wolf/admin/javascripts/wolf.js
    -rwxrwxrwx 1 root root 2435 Dec  5  2015 /var/www/wolfcms/wolf/admin/themes/brown_and_blue/login.css
    -rwxrwxrwx 1 root root 341 Dec  5  2015 /var/www/wolfcms/wolf/admin/themes/brown_and_blue/styles.css
    -rwxrwxrwx 1 root root 2438 Dec  5  2015 /var/www/wolfcms/wolf/admin/themes/Right To Left/login.css
    -rwxrwxrwx 1 root root 9488 Dec  5  2015 /var/www/wolfcms/wolf/admin/themes/Right To Left/styles.css
    -rwxrwxrwx 1 root root 2435 Dec  5  2015 /var/www/wolfcms/wolf/admin/themes/black_and_white/login.css
    -rwxrwxrwx 1 root root 7231 Dec  5  2015 /var/www/wolfcms/wolf/admin/themes/black_and_white/styles.css
    -rwxrwxrwx 1 root root 2438 Dec  5  2015 /var/www/wolfcms/wolf/admin/themes/brown_and_green/login.css
    -rwxrwxrwx 1 root root 8087 Dec  5  2015 /var/www/wolfcms/wolf/admin/themes/brown_and_green/styles.css
    -rwxrwxrwx 1 root root 20839 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/jquery.markitup.js
    -rwxrwxrwx 1 root root 1572 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/sets/default/set.js
    -rwxrwxrwx 1 root root 722 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/sets/default/style.css
    -rwxrwxrwx 1 root root 516 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/sets/default/images/image.png
    -rwxrwxrwx 1 root root 537 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/sets/default/images/preview.png
    -rwxrwxrwx 1 root root 343 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/sets/default/images/link.png
    -rwxrwxrwx 1 root root 667 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/sets/default/images/clean.png
    -rwxrwxrwx 1 root root 269 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/sets/default/images/stroke.png
    -rwxrwxrwx 1 root root 344 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/sets/default/images/list-bullet.png
    -rwxrwxrwx 1 root root 606 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/sets/default/images/picture.png
    -rwxrwxrwx 1 root root 304 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/sets/default/images/bold.png
    -rwxrwxrwx 1 root root 357 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/sets/default/images/list-numeric.png
    -rwxrwxrwx 1 root root 223 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/sets/default/images/italic.png
    -rwxrwxrwx 1 root root 113 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/templates/preview.css
    -rwxrwxrwx 1 root root 406 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/templates/preview.html
    -rwxrwxrwx 1 root root 2515 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/simple/style.css
    -rwxrwxrwx 1 root root 27151 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/simple/images/menu.png
    -rwxrwxrwx 1 root root 258 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/simple/images/handle.png
    -rwxrwxrwx 1 root root 240 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/simple/images/submenu.png
    -rwxrwxrwx 1 root root 3352 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup/style.css
    -rwxrwxrwx 1 root root 254 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup/images/menu.png
    -rwxrwxrwx 1 root root 1659 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup/images/bg-editor-textile.png
    -rwxrwxrwx 1 root root 322 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup/images/bg-container.png
    -rwxrwxrwx 1 root root 258 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup/images/handle.png
    -rwxrwxrwx 1 root root 1529 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup/images/bg-editor-json.png
    -rwxrwxrwx 1 root root 1488 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup/images/bg-editor-wiki.png
    -rwxrwxrwx 1 root root 1534 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup/images/bg-editor-html.png
    -rwxrwxrwx 1 root root 1495 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup/images/bg-editor-xml.png
    -rwxrwxrwx 1 root root 1682 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup/images/bg-editor-dotclear.png
    -rwxrwxrwx 1 root root 1642 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup/images/bg-editor-bbcode.png
    -rwxrwxrwx 1 root root 1745 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup/images/bg-editor.png
    -rwxrwxrwx 1 root root 1783 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup/images/bg-editor-markdown.png
    -rwxrwxrwx 1 root root 240 Dec  5  2015 /var/www/wolfcms/wolf/admin/markitup/skins/markitup/images/submenu.png
    -rwxrwxrwx 1 root root 3017 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/copy.png
    -rwxrwxrwx 1 root root 89 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/icon_cal.gif
    -rwxrwxrwx 1 root root 881 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/drag.gif
    -rwxrwxrwx 1 root root 96 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/icon-remove-disabled.gif
    -rwxrwxrwx 1 root root 301 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/copy-disabled.png
    -rwxrwxrwx 1 root root 2952 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/toolbar-icons.gif
    -rwxrwxrwx 1 root root 1046 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/layout.png
    -rwxrwxrwx 1 root root 1253 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/user.png
    -rwxrwxrwx 1 root root 3255 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/magnify.png
    -rwxrwxrwx 1 root root 945 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/page.png
    -rwxrwxrwx 1 root root 273 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/plus.png
    -rwxrwxrwx 1 root root 256 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/collapse.png
    -rwxrwxrwx 1 root root 1809 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/file.png
    -rwxrwxrwx 1 root root 97 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/drag-disabled.gif
    -rwxrwxrwx 1 root root 259 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/expand.png
    -rwxrwxrwx 1 root root 1112 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/snippet.png
    -rwxrwxrwx 1 root root 1150 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/favicon.ico
    -rwxrwxrwx 1 root root 85 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/icon-rename.gif
    -rwxrwxrwx 1 root root 1849 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/spinner.gif
    -rwxrwxrwx 1 root root 136 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/drag_to_copy.gif
    -rwxrwxrwx 1 root root 135 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/drag_to_sort.gif
    -rwxrwxrwx 1 root root 43 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/clear.gif
    -rwxrwxrwx 1 root root 272 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/minus.png
    -rwxrwxrwx 1 root root 96 Dec  5  2015 /var/www/wolfcms/wolf/admin/images/icon-remove.gif
    -rwxrwxrwx 1 root root 0 Dec  5  2015 /var/www/wolfcms/wolf/index.html
    -rwxrwxrwx 1 root root 0 Dec  5  2015 /var/www/wolfcms/robots.txt
    -rwxrwxrwx 1 root root 35147 Dec  5  2015 /var/www/wolfcms/docs/license.txt
    -rwxrwxrwx 1 root root 2362 Dec  5  2015 /var/www/wolfcms/docs/exception.txt
    -rwxrwxrwx 1 root root 1717 Dec  5  2015 /var/www/wolfcms/docs/install.txt
    -rwxrwxrwx 1 root root 7014 Dec  5  2015 /var/www/wolfcms/docs/updating.txt
    -rwxrwxrwx 1 root root 109 Dec  5  2015 /var/www/connect.py

[+] Checking if root's home folder is accessible

[+] SUID/SGID Files and Directories
    -rwsr-xr-- 1 root messagebus 316824 Jun 13  2013 /usr/lib/dbus-1.0/dbus-daemon-launch-helper
    -rwsr-xr-x 1 root root 5564 Dec 13  2011 /usr/lib/eject/dmcrypt-get-device
    -rwsr-xr-x 1 root root 248056 Apr 11  2013 /usr/lib/openssh/ssh-keysign
    -rwsr-xr-x 1 root root 9728 Mar 27  2015 /usr/lib/pt_chown
    -rwxr-sr-x 3 root mail 9684 Oct 18  2011 /usr/bin/mail-lock
    -rwxr-sr-x 3 root mail 9684 Oct 18  2011 /usr/bin/mail-touchlock
    -rwxr-sr-x 3 root mail 9684 Oct 18  2011 /usr/bin/mail-unlock
    -rwsr-xr-x 2 root root 69708 Feb 28  2013 /usr/bin/sudo
    -rwsr-xr-x 2 root root 69708 Feb 28  2013 /usr/bin/sudoedit
    -rwxr-sr-x 1 root shadow 18120 Sep 13  2012 /usr/bin/expiry
    -rwsr-xr-x 1 root root 41284 Sep 13  2012 /usr/bin/passwd
    -rwxr-sr-x 1 root utmp 365260 Jun  6  2011 /usr/bin/screen
    -rwxr-sr-x 1 root crontab 34776 Jun 20  2012 /usr/bin/crontab
    -rwxr-sr-x 1 root tty 9728 Mar 31  2012 /usr/bin/bsd-write
    -rwsr-xr-x 1 root root 56208 Jul 29  2011 /usr/bin/mtr
    -rwsr-xr-x 1 root root 40292 Sep 13  2012 /usr/bin/chfn
    -rwsr-xr-x 1 root root 30896 Sep 13  2012 /usr/bin/newgrp
    -rwxr-sr-x 1 root mail 13892 Jun 28  2013 /usr/bin/dotlockfile
    -rwxr-sr-x 1 root shadow 45284 Sep 13  2012 /usr/bin/chage
    -rwsr-xr-x 1 root root 57956 Sep 13  2012 /usr/bin/gpasswd
    -rwxr-sr-x 1 root ssh 128416 Apr 11  2013 /usr/bin/ssh-agent
    -rwsr-sr-x 1 daemon daemon 42800 Oct 25  2011 /usr/bin/at
    -rwxr-sr-x 1 root tty 18036 Mar 30  2012 /usr/bin/wall
    -rwxr-sr-x 1 root mlocate 34432 Aug 17  2011 /usr/bin/mlocate
    -rwsr-xr-x 1 root root 31748 Sep 13  2012 /usr/bin/chsh
    -rwsr-xr-x 1 root root 14012 Nov  8  2011 /usr/bin/traceroute6.iputils
    drwxrwsr-x 4 root staff 4096 Sep 22  2015 /usr/local/lib/python2.7
    drwxrwsr-x 2 root staff 4096 Sep 22  2015 /usr/local/lib/python2.7/dist-packages
    drwxrwsr-x 2 root staff 4096 Sep 22  2015 /usr/local/lib/python2.7/site-packages
    drwxrwsr-x 7 root staff 4096 Sep 22  2015 /usr/local/share/sgml
    drwxrwsr-x 2 root staff 4096 Sep 22  2015 /usr/local/share/sgml/declaration
    drwxrwsr-x 2 root staff 4096 Sep 22  2015 /usr/local/share/sgml/misc
    drwxrwsr-x 2 root staff 4096 Sep 22  2015 /usr/local/share/sgml/stylesheet
    drwxrwsr-x 2 root staff 4096 Sep 22  2015 /usr/local/share/sgml/entities
    drwxrwsr-x 2 root staff 4096 Sep 22  2015 /usr/local/share/sgml/dtd
    drwxrwsr-x 2 root staff 4096 Dec  5  2015 /usr/local/share/fonts
    drwxrwsr-x 2 root staff 4096 Sep 22  2015 /usr/local/share/ca-certificates
    drwxrwsr-x 6 root staff 4096 Sep 22  2015 /usr/local/share/xml
    drwxrwsr-x 2 root staff 4096 Sep 22  2015 /usr/local/share/xml/declaration
    drwxrwsr-x 2 root staff 4096 Sep 22  2015 /usr/local/share/xml/misc
    drwxrwsr-x 2 root staff 4096 Sep 22  2015 /usr/local/share/xml/schema
    drwxrwsr-x 2 root staff 4096 Sep 22  2015 /usr/local/share/xml/entities
    -rwsr-xr-- 1 root dip 273272 Feb  4  2011 /usr/sbin/pppd
    -rwsr-sr-x 1 libuuid libuuid 17976 Mar 30  2012 /usr/sbin/uuidd
    drwxr-s--- 2 root dip 4096 Sep 22  2015 /etc/chatscripts
    drwxr-s--- 2 root dip 4096 Sep 22  2015 /etc/ppp/peers
    -rwsr-xr-x 1 root root 39116 Nov  8  2011 /bin/ping6
    -rwsr-xr-x 1 root root 67720 Mar 30  2012 /bin/umount
    -rwsr-xr-x 1 root root 31116 Sep 13  2012 /bin/su
    -rwsr-xr-x 1 root root 88760 Mar 30  2012 /bin/mount
    -rwsr-xr-x 1 root root 26252 Mar  2  2012 /bin/fusermount
    -rwsr-xr-x 1 root root 34740 Nov  8  2011 /bin/ping
    -rwxr-sr-x 1 root shadow 30364 Feb  9  2012 /sbin/unix_chkpwd
    drwxrwsr-x 2 libuuid libuuid 4096 Sep 22  2015 /var/lib/libuuid
    drwxr-s--- 2 mysql adm 4096 Dec  6  2015 /var/log/mysql
    drwxr-sr-x 33 man root 4096 Dec  6  2015 /var/cache/man
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/sv
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/sv/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/sv/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/sv/cat8
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/cat6
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/id
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/id/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/id/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/id/cat8
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/cat1
    drwxr-sr-x 4 man root 4096 Dec  6  2015 /var/cache/man/sl
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/sl/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/sl/cat8
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/nl
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/nl/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/nl/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/nl/cat8
    drwxr-sr-x 3 man root 4096 Dec  6  2015 /var/cache/man/gl
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/gl/cat8
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/cat2
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/pl
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/pl/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/pl/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/pl/cat8
    drwxr-sr-x 6 man root 4096 Dec  6  2015 /var/cache/man/cs
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/cs/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/cs/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/cs/cat7
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/cs/cat8
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/cat5
    drwxr-sr-x 6 man root 4096 Dec  6  2015 /var/cache/man/de
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/de/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/de/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/de/cat3
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/de/cat8
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/tr
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/tr/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/tr/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/tr/cat8
    drwxr-sr-x 4 man root 4096 Dec  6  2015 /var/cache/man/fr.UTF-8
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/fr.UTF-8/cat7
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/fr.UTF-8/cat8
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/zh_TW
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/zh_TW/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/zh_TW/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/zh_TW/cat8
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/zh_CN
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/zh_CN/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/zh_CN/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/zh_CN/cat8
    drwxr-sr-x 4 man root 4096 Dec  6  2015 /var/cache/man/fi
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/fi/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/fi/cat8
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/it
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/it/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/it/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/it/cat8
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/ko
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/ko/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/ko/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/ko/cat8
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/ja
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/ja/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/ja/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/ja/cat8
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/pt_BR
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/pt_BR/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/pt_BR/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/pt_BR/cat8
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/ru
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/ru/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/ru/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/ru/cat8
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/cat7
    drwxr-sr-x 4 man root 4096 Dec  6  2015 /var/cache/man/fr.ISO8859-1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/fr.ISO8859-1/cat7
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/fr.ISO8859-1/cat8
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/cat4
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/hu
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/hu/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/hu/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/hu/cat8
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/es
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/es/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/es/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/es/cat8
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/pt
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/pt/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/pt/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/pt/cat8
    drwxr-sr-x 5 man root 4096 Dec  6  2015 /var/cache/man/fr
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/fr/cat1
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/fr/cat5
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/fr/cat8
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/cat3
    drwxr-sr-x 2 man root 4096 Sep 22  2015 /var/cache/man/cat8
    drwxrwsr-x 2 root staff 4096 Jan 10  2014 /var/local
    drwxrwsrwt 2 root whoopsie 4096 Oct 12 17:53 /var/crash
    drwxrwsr-x 2 root mail 4096 Sep 22  2015 /var/mail

[+] Logs containing keyword 'password'

[+] Config files containing keyword 'password'
    /etc/debconf.conf:# World-readable, and accepts everything but passwords.
    /etc/debconf.conf:Reject-Type: password
    /etc/debconf.conf:# Not world readable (the default), and accepts only passwords.
    /etc/debconf.conf:Name: passwords
    /etc/debconf.conf:Accept-Type: password
    /etc/debconf.conf:Filename: /var/cache/debconf/passwords.dat
    /etc/debconf.conf:# databases, one to hold passwords and one for everything else.
    /etc/debconf.conf:Stack: config, passwords
    /etc/debconf.conf:# A remote LDAP database. It is also read-only. The password is really
    /etc/ssl/openssl.cnf:# input_password = secret
    /etc/ssl/openssl.cnf:# output_password = secret
    /etc/ssl/openssl.cnf:challengePassword		= A challenge password
    /etc/ltrace.conf:; pwd.h
    /etc/hdparm.conf:# --security-set-pass Set security password
    /etc/hdparm.conf:# security_pass = password
    /etc/hdparm.conf:# --user-master Select password to use
    /etc/squid3/squid.conf:#	reads a line containing "username password" and replies "OK" or
    /etc/squid3/squid.conf:#	username & password to the helper.
    /etc/squid3/squid.conf:#	verifications, slowing it down. When password verifications are
    /etc/squid3/squid.conf:#	password). There is no default.
    /etc/squid3/squid.conf:#	username:password pair is valid for - in other words how
    /etc/squid3/squid.conf:#	low to force revalidation with short lived passwords.  Note
    /etc/squid3/squid.conf:#	to replay attacks unless you are using an one-time password
    /etc/squid3/squid.conf:#	username & password to the helper.
    /etc/squid3/squid.conf:#	password). There is no default.
    /etc/squid3/squid.conf:#	  password=	The users password (for login= cache_peer option)
    /etc/squid3/squid.conf:#	  # to check username/password combinations (see
    /etc/squid3/squid.conf:#		acl password proxy_auth REQUIRED
    /etc/squid3/squid.conf:#  TAG: sslpassword_program
    /etc/squid3/squid.conf:#	selection of the right password if you have multiple encrypted
    /etc/squid3/squid.conf:#	login=user:password
    /etc/squid3/squid.conf:#			to pass on, but username and password are available
    /etc/squid3/squid.conf:#			password= result tags they may be sent instead.
    /etc/squid3/squid.conf:#			password to the peer. USE WITH CAUTION
    /etc/squid3/squid.conf:#	login=*:password
    /etc/squid3/squid.conf:#			fixed password. This is meant to be used when the peer
    /etc/squid3/squid.conf:#			the login=username:password option above.
    /etc/squid3/squid.conf:#	If you want the anonymous login password to be more informative
    /etc/squid3/squid.conf:#	(taken from the password file) and supplementary group list
    /etc/squid3/squid.conf:#	"password=<password>" to the end of this service declaration.
    /etc/squid3/squid.conf:#	wccp2_service standard 0 password=foo
    /etc/squid3/squid.conf:#	Specify passwords for cachemgr operations.
    /etc/squid3/squid.conf:#	Usage: cachemgr_passwd password action action ...
    /etc/squid3/squid.conf:#	  valid password, others can be performed if not listed here.
    /etc/squid3/squid.conf:#	To disable an action, set the password to "disable".
    /etc/squid3/squid.conf:#	To allow performing an action without a password, set the
    /etc/squid3/squid.conf:#	password to "none".
    /etc/squid3/squid.conf:#	Use the keyword "all" to set the same password for all actions.
    /etc/mysql/my.cnf:# It has been reported that passwords should be enclosed with ticks/quotes
    /etc/iscsi/iscsid.conf:# To set a CHAP username and password for initiator
    /etc/iscsi/iscsid.conf:#node.session.auth.password = password
    /etc/iscsi/iscsid.conf:# To set a CHAP username and password for target(s)
    /etc/iscsi/iscsid.conf:#node.session.auth.password_in = password_in
    /etc/iscsi/iscsid.conf:# To set a discovery session CHAP username and password for the initiator
    /etc/iscsi/iscsid.conf:#discovery.sendtargets.auth.password = password
    /etc/iscsi/iscsid.conf:# To set a discovery session CHAP username and password for target(s)
    /etc/iscsi/iscsid.conf:#discovery.sendtargets.auth.password_in = password_in

[+] Shadow File (Privileged)

[*] ENUMERATING PROCESSES AND APPLICATIONS...

[+] Installed Packages
    Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
    Err?=(none)/Reinst-required (Status,Err:
    Name Version
    accountsservice 0.6.15-2ubuntu9.7  and manipulate user account information
    acpid 1:2.0.10-1ubuntu3  Configuration and Power Interface event daemon
    adduser 3.113ubuntu2  and remove users and groups
    apache2 2.2.22-1ubuntu1.10  HTTP Server metapackage
    apache2-mpm-prefork 2.2.22-1ubuntu1.10  HTTP Server - traditional non-threaded model
    apache2-utils 2.2.22-1ubuntu1.10  programs for webservers
    apache2.2-bin 2.2.22-1ubuntu1.10  HTTP Server common binary files
    apache2.2-common 2.2.22-1ubuntu1.10  HTTP Server common files
    apparmor 2.7.102-0ubuntu3.9  parser utility for AppArmor
    apport 2.0.1-0ubuntu17.6  generate crash reports for debugging
    apport-symptoms 0.16.1  scripts for apport
    apt 0.8.16~exp12ubuntu10.16  package manager
    apt-transport-https 0.8.16~exp12ubuntu10.16  download transport for APT
    apt-utils 0.8.16~exp12ubuntu10.16  managment related utility programs
    apt-xapian-index 0.44ubuntu5.1  and search tools for a Xapian index of Debian packages
    aptitude 0.6.6-1ubuntu1.2  package manager (terminal interface only)
    at 3.1.13-1ubuntu1  job execution and batch processing
    base-files 6.5ubuntu6.7  base system miscellaneous files
    base-passwd 3.5.24  base system master password and group files
    bash 4.2-2ubuntu2.1  Bourne Again SHell
    bash-completion 1:1.3-1ubuntu8.1  completion for the bash shell
    bc 1.06.95-2ubuntu1  GNU bc arbitrary precision calculator language
    bind9-host 1:9.8.1.dfsg.P1-4ubuntu0.8  of 'host' bundled with BIND 9.X
    binutils 2.22-6ubuntu1.3  assembler, linker and binary utilities
    bsdmainutils 8.2.3ubuntu1  of more utilities from FreeBSD
    bsdutils 1:2.20.1-1ubuntu3  utilities from 4.4BSD-Lite
    busybox-initramfs 1:1.18.5-1ubuntu4.1  shell setup for initramfs
    busybox-static 1:1.18.5-1ubuntu4.1  rescue shell with tons of builtin utilities
    byobu 5.17-0ubuntu1  text based window manager and shell multiplexer
    bzip2 1.0.6-1  block-sorting file compressor - utilities
    ca-certificates 20111211  CA certificates
    command-not-found 0.2.46ubuntu6  installation of packages in interactive bash sessions
    command-not-found-data 0.2.46ubuntu6  of data files for command-not-found.
    console-setup 1.70ubuntu5  font and keymap setup program
    coreutils 8.13-3ubuntu3.2  core utilities
    cpio 2.11-7ubuntu3  cpio -- a program to manage archives of files
    cpp 4:4.6.3-1ubuntu5  C preprocessor (cpp)
    cpp-4.6 4.6.3-1ubuntu5  C preprocessor
    cron 3.0pl1-120ubuntu4  scheduling daemon
    curl 7.22.0-3ubuntu4.7  a file from an HTTP, HTTPS or FTP server
    dash 0.5.7-2ubuntu2  shell
    dbus 1.4.18-1ubuntu1.4  interprocess messaging system (daemon and utilities)
    debconf 1.5.42ubuntu1  configuration management system
    debconf-i18n 1.5.42ubuntu1  internationalization support for debconf
    debianutils 4.2.1ubuntu2  utilities specific to Debian
    diffutils 1:3.2-1ubuntu1  comparison utilities
    dmidecode 2.11-4  table decoder
    dmsetup 2:1.02.48-4ubuntu7.4  Linux Kernel Device Mapper userspace library
    dnsutils 1:9.8.1.dfsg.P1-4ubuntu0.8  provided with BIND
    dosfstools 3.0.12-1ubuntu1.1  for making and checking MS-DOS FAT filesystems
    dpkg 1.16.1.2ubuntu7.2  package management system
    e2fslibs 1.42-1ubuntu2  file system libraries
    e2fsprogs 1.42-1ubuntu2  file system utilities
    ed 1.5-3  UNIX line editor
    eject 2.1.5+deb1+cvs20081104-9  CDs and operates CD-Changers under Linux
    file 5.09-2  file type using "magic" numbers
    findutils 4.4.2-4ubuntu1  for finding files--find, xargs
    fontconfig-config 2.8.0-3ubuntu9.1  font configuration library - configuration
    fonts-ubuntu-font-family-console 0.80-0ubuntu2  Font Family Linux console fonts, sans-serif monospace
    friendly-recovery 0.2.25  recovery more user-friendly
    ftp 0.17-25  file transfer client
    fuse 2.8.6-2ubuntu2  in Userspace
    gcc 4:4.6.3-1ubuntu5  C compiler
    gcc-4.6 4.6.3-1ubuntu5  C compiler
    gcc-4.6-base 4.6.3-1ubuntu5  the GNU Compiler Collection (base package)
    geoip-database 20111220-1  lookup command line tools that use the GeoIP library (country database)
    gettext-base 0.18.1.1-5ubuntu3  Internationalization utilities for the base system
    gir1.2-glib-2.0 1.32.0-1  data for GLib, GObject, Gio and GModule
    gnupg 1.4.11-3ubuntu2.5  privacy guard - a free PGP replacement
    gpgv 1.4.11-3ubuntu2.5  privacy guard - signature verification tool
    grep 2.10-1  grep, egrep and fgrep
    groff-base 1.21-7  troff text-formatting system (base system components)
    grub-common 1.99-21ubuntu3.18  Unified Bootloader (common files)
    grub-gfxpayload-lists 0.6  gfxpayload blacklist
    grub-pc 1.99-21ubuntu3.18  Unified Bootloader, version 2 (PC/BIOS version)
    grub-pc-bin 1.99-21ubuntu3.18  Unified Bootloader, version 2 (PC/BIOS binaries)
    grub2-common 1.99-21ubuntu3.18  Unified Bootloader (common files for version 2)
    gzip 1.4-1ubuntu2  compression utilities
    hdparm 9.37-0ubuntu3.1  hard disk parameters for high performance
    hostname 3.06ubuntu1  to set/show the host name or domain name
    ifupdown 0.7~beta2ubuntu10  level tools to configure network interfaces
    info 4.13a.dfsg.1-8ubuntu2  GNU Info documentation browser
    initramfs-tools 0.99ubuntu13.4  for generating an initramfs
    initramfs-tools-bin 0.99ubuntu13.4  used by initramfs-tools
    initscripts 2.88dsf-13.10ubuntu11.1  for initializing and shutting down the system
    insserv 1.14.0-2.1ubuntu2  to organize boot sequence using LSB init.d script dependencies
    install-info 4.13a.dfsg.1-8ubuntu2  installed documentation in info format
    installation-report 2.46ubuntu1  installation report
    iproute 20111117-1ubuntu2.1  and traffic control tools
    iptables 1.4.12-1ubuntu5  tools for packet filtering and NAT
    iputils-ping 3:20101006-1ubuntu1  to test the reachability of network hosts
    iputils-tracepath 3:20101006-1ubuntu1  to trace the network path to a remote host
    irqbalance 0.56-1ubuntu4  to balance interrupts for SMP systems
    isc-dhcp-client 4.1.ESV-R4-0ubuntu5.9  DHCP client
    isc-dhcp-common 4.1.ESV-R4-0ubuntu5.9  files used by all the isc-dhcp* packages
    iso-codes 3.31-1  language, territory, currency, script codes and their translations
    kbd 1.15.2-3ubuntu4  console font and keytable utilities
    keyboard-configuration 1.70ubuntu5  keyboard preferences
    klibc-utils 1.5.25-1ubuntu2  utilities built with klibc for early boot
    krb5-locales 1.10+dfsg~beta1-2ubuntu0.3  support for MIT Kerberos
    landscape-common 13.07.3-0ubuntu0.12.04  Landscape administration system client - Common files
    language-pack-en 1:12.04+20140106  updates for language English
    language-pack-en-base 1:12.04+20140106  for language English
    language-selector-common 0.79.4  selector for Ubuntu
    laptop-detect 0.13.7ubuntu2  to detect a laptop
    less 444-1ubuntu1  program similar to more
    libaccountsservice0 0.6.15-2ubuntu9.7  and manipulate user account information - shared libraries
    libacl1 2.2.51-5ubuntu1  control list shared library
    libapache2-mod-php5 5.3.10-1ubuntu3.21  HTML-embedded scripting language (Apache 2 module)
    libapr1 1.4.6-1  Portable Runtime Library
    libaprutil1 1.3.12+dfsg-3  Portable Runtime Utility Library
    libaprutil1-dbd-sqlite3 1.3.12+dfsg-3  Portable Runtime Utility Library - SQLite3 Driver
    libaprutil1-ldap 1.3.12+dfsg-3  Portable Runtime Utility Library - LDAP Driver
    libapt-inst1.4 0.8.16~exp12ubuntu10.16  package format runtime library
    libapt-pkg4.12 0.8.16~exp12ubuntu10.16  managment runtime library
    libasn1-8-heimdal 1.6~git20120311.dfsg.1-2ubuntu0.1  Kerberos - ASN.1 library
    libattr1 1:2.4.46-5ubuntu1  attribute shared library
    libbind9-80 1:9.8.1.dfsg.P1-4ubuntu0.8  Shared Library used by BIND
    libblkid1 2.20.1-1ubuntu3  device id library
    libboost-iostreams1.46.1 1.46.1-7ubuntu3  Library
    libbsd0 0.3.0-2  functions from BSD systems - shared library
    libbz2-1.0 1.0.6-1  block-sorting file compressor library - runtime
    libc-bin 2.15-0ubuntu10.12  GNU C Library: Binaries
    libc-dev-bin 2.15-0ubuntu10.12  GNU C Library: Development binaries
    libc6 2.15-0ubuntu10.12  GNU C Library: Shared libraries
    libc6-dev 2.15-0ubuntu10.12  GNU C Library: Development Libraries and Header Files
    libcap-ng0 0.6.6-1ubuntu1  alternate POSIX capabilities library
    libcap2 1:2.22-1ubuntu3  for getting/setting POSIX.1e capabilities
    libclass-accessor-perl 0.34-1  module that automatically generates accessors
    libclass-isa-perl 0.36-3  the search path for a class's ISA tree
    libcomerr2 1.42-1ubuntu2  error description library
    libcurl3 7.22.0-3ubuntu4.7  file transfer library (OpenSSL)
    libcurl3-gnutls 7.22.0-3ubuntu4.7  file transfer library (GnuTLS)
    libcwidget3 0.5.16-3.1ubuntu1  terminal interface library for C++ (runtime files)
    libdb5.1 5.1.25-11build1  v5.1 Database Libraries [runtime]
    libdbd-mysql-perl 4.020-1build2  database interface to the MySQL database
    libdbi-perl 1.616-1build2  Database Interface (DBI)
    libdbus-1-3 1.4.18-1ubuntu1.4  interprocess messaging system (library)
    libdbus-glib-1-2 0.98-1ubuntu1.1  interprocess messaging system (GLib-based shared library)
    libdevmapper1.02.1 2:1.02.48-4ubuntu7.4  Linux Kernel Device Mapper userspace library
    libdns81 1:9.8.1.dfsg.P1-4ubuntu0.8  Shared Library used by BIND
    libdrm-intel1 2.4.46-1ubuntu0.0.0.1  interface to intel-specific kernel DRM services -- runtime
    libdrm-nouveau1a 2.4.46-1ubuntu0.0.0.1  interface to nouveau-specific kernel DRM services -- runtime
    libdrm-radeon1 2.4.46-1ubuntu0.0.0.1  interface to radeon-specific kernel DRM services -- runtime
    libdrm2 2.4.46-1ubuntu0.0.0.1  interface to kernel DRM services -- runtime
    libedit2 2.11-20080614-3ubuntu2  editline and history libraries
    libelf1 0.152-1ubuntu3  to read and write ELF files
    libept1.4.12 1.0.6~exp1ubuntu1  library for managing Debian package information
    libevent-2.0-5 2.0.16-stable-1  event notification library
    libexpat1 2.0.1-7.2ubuntu1.1  parsing C library - runtime library
    libffi6 3.0.11~rc1-5  Function Interface library runtime
    libfontconfig1 2.8.0-3ubuntu9.1  font configuration library - runtime
    libfreetype6 2.4.8-1ubuntu2.3  2 font engine, shared library files
    libfribidi0 0.19.2-1  Implementation of the Unicode BiDi algorithm
    libfuse2 2.8.6-2ubuntu2  in Userspace (library)
    libgc1c2 1:7.1-8ubuntu0.12.04.1  garbage collector for C and C++
    libgcc1 1:4.6.3-1ubuntu5  support library
    libgcrypt11 1.5.0-3ubuntu0.2  Crypto library - runtime library
    libgd2-xpm 2.0.36~rc1~dfsg-6ubuntu2  Graphics Library version 2
    libgdbm3 1.8.3-10  dbm database routines (runtime version)
    libgeoip1 1.4.8+dfsg-2  IP-to-country resolver library
    libgirepository-1.0-1 1.32.0-1  for handling GObject introspection data (runtime library)
    libglib2.0-0 2.32.4-0ubuntu1  library of C routines
    libgmp10 2:5.0.2+dfsg-2ubuntu1  arithmetic library
    libgnutls26 2.12.14-5ubuntu3.5  TLS library - runtime library
    libgomp1 4.6.3-1ubuntu5  OpenMP (GOMP) support library
    libgpg-error0 1.10-2ubuntu1  for common error values and messages in GnuPG components
    libgpm2 1.20.4-4  Purpose Mouse - shared library
    libgssapi-krb5-2 1.10+dfsg~beta1-2ubuntu0.3  Kerberos runtime libraries - krb5 GSS-API Mechanism
    libgssapi3-heimdal 1.6~git20120311.dfsg.1-2ubuntu0.1  Kerberos - GSSAPI support library
    libhcrypto4-heimdal 1.6~git20120311.dfsg.1-2ubuntu0.1  Kerberos - crypto library
    libheimbase1-heimdal 1.6~git20120311.dfsg.1-2ubuntu0.1  Kerberos - Base library
    libheimntlm0-heimdal 1.6~git20120311.dfsg.1-2ubuntu0.1  Kerberos - NTLM support library
    libhtml-template-perl 2.10-1  for using HTML Templates with Perl
    libhx509-5-heimdal 1.6~git20120311.dfsg.1-2ubuntu0.1  Kerberos - X509 support library
    libidn11 1.23-2  Libidn library, implementation of IETF IDN specifications
    libio-string-perl 1.08-2  IO::File interface for in-core strings
    libisc83 1:9.8.1.dfsg.P1-4ubuntu0.8  Shared Library used by BIND
    libisccc80 1:9.8.1.dfsg.P1-4ubuntu0.8  Channel Library used by BIND
    libisccfg82 1:9.8.1.dfsg.P1-4ubuntu0.8  File Handling Library used by BIND
    libiw30 30~pre9-5ubuntu2  tools - library
    libjpeg-turbo8 1.1.90+svn733-0ubuntu4.4  JPEG compliant runtime library.
    libjpeg8 8c-2ubuntu7  JPEG Group's JPEG runtime library (dependency package)
    libjs-jquery 1.7.1-1ubuntu1  library for dynamic web applications
    libk5crypto3 1.10+dfsg~beta1-2ubuntu0.3  Kerberos runtime libraries - Crypto Library
    libkeyutils1 1.5.2-2  Key Management Utilities (library)
    libklibc 1.5.25-1ubuntu2  libc subset for use with initramfs
    libkrb5-26-heimdal 1.6~git20120311.dfsg.1-2ubuntu0.1  Kerberos - libraries
    libkrb5-3 1.10+dfsg~beta1-2ubuntu0.3  Kerberos runtime libraries
    libkrb5support0 1.10+dfsg~beta1-2ubuntu0.3  Kerberos runtime libraries - Support library
    libldap-2.4-2 2.4.28-1.1ubuntu4.4  libraries
    liblocale-gettext-perl 1.05-7build1  using libc functions for internationalization in Perl
    liblockfile-bin 1.09-3ubuntu0.1  binaries for and cli utilities based on liblockfile
    liblockfile1 1.09-3ubuntu0.1  locking library
    libltdl7 2.4.2-1ubuntu1  system independent dlopen wrapper for GNU libtool
    liblwres80 1:9.8.1.dfsg.P1-4ubuntu0.8  Resolver Library used by BIND
    liblzma5 5.1.1alpha+20110809-3  compression library
    libmagic1 5.09-2  type determination library using "magic" numbers
    libmcrypt4 2.5.8-3.1  Library
    libmount1 2.20.1-1ubuntu3  device id library
    libmpc2 0.9-4  precision complex floating-point library
    libmpfr4 3.1.0-3ubuntu2  precision floating-point computation
    libmysqlclient18 5.5.46-0ubuntu0.12.04.2  database client library
    libncurses5 5.9-4  libraries for terminal handling
    libncursesw5 5.9-4  libraries for terminal handling (wide character support)
    libnet-daemon-perl 0.48-1  module for building portable Perl daemons easily
    libnewt0.52 0.52.11-2ubuntu10  Erik's Windowing Toolkit - text mode windowing with slang
    libnfnetlink0 1.0.0-1  netlink library
    libnih-dbus1 1.0.3-4ubuntu9.1  D-Bus Bindings Library
    libnih1 1.0.3-4ubuntu9.1  Utility Library
    libnl-3-200 3.2.3-2ubuntu2  for dealing with netlink sockets
    libnl-genl-3-200 3.2.3-2ubuntu2  for dealing with netlink sockets - generic netlink
    libp11-kit0 0.12-2ubuntu1  for loading and coordinating access to PKCS#11 modules - runtime
    libpam-modules 1.1.3-7ubuntu2  Authentication Modules for PAM
    libpam-modules-bin 1.1.3-7ubuntu2  Authentication Modules for PAM - helper binaries
    libpam-runtime 1.1.3-7ubuntu2  support for the PAM library
    libpam0g 1.1.3-7ubuntu2  Authentication Modules library
    libparse-debianchangelog-perl 1.2.0-1ubuntu1  Debian changelogs and output them in other formats
    libparted0debian1 2.3-8ubuntu5.1  partition manipulator - shared library
    libpcap0.8 1.1.1-10  interface for user-level packet capture
    libpci3 1:3.1.8-2ubuntu6  PCI Utilities (shared library)
    libpciaccess0 0.12.902-1ubuntu0.2  PCI access library for X
    libpcre3 8.12-4  5 Compatible Regular Expression Library - runtime files
    libpcsclite1 1.7.4-2ubuntu2  to access a smart card using PC/SC (library)
    libpipeline1 1.2.1-1  manipulation library
    libplrpc-perl 0.2020-2  extensions for writing PlRPC servers and clients
    libplymouth2 0.8.2-2ubuntu31.1  boot animation and logger - shared libraries
    libpng12-0 1.2.46-3ubuntu4  library - runtime
    libpolkit-gobject-1-0 0.104-1ubuntu1.1  Authorization API
    libpopt0 1.16-3ubuntu1  for parsing cmdline parameters
    libpython2.7 2.7.3-0ubuntu3.4  Python runtime library (version 2.7)
    libquadmath0 4.6.3-1ubuntu5  Quad-Precision Math Library
    libreadline6 6.2-8  readline and history libraries, run-time libraries
    libroken18-heimdal 1.6~git20120311.dfsg.1-2ubuntu0.1  Kerberos - roken support library
    librtmp0 2.4~20110711.gitc28f1bab-1  for RTMP streams (shared library)
    libsasl2-2 2.1.25.dfsg1-3ubuntu0.1  SASL - authentication abstraction library
    libsasl2-modules 2.1.25.dfsg1-3ubuntu0.1  SASL - pluggable authentication modules
    libselinux1 2.1.0-4.1ubuntu1  runtime shared libraries
    libsigc++-2.0-0c2a 2.2.10-0ubuntu2  Signal Framework for C++ - runtime
    libslang2 2.2.4-3ubuntu1  programming library - runtime version
    libsqlite3-0 3.7.9-2ubuntu1.1  3 shared library
    libss2 1.42-1ubuntu2  interface parsing library
    libssl1.0.0 1.0.1-4ubuntu5.11  shared libraries
    libstdc++6 4.6.3-1ubuntu5  Standard C++ Library v3
    libsub-name-perl 0.05-1build2  for assigning a new name to referenced sub
    libswitch-perl 2.16-2  statement for Perl
    libt1-5 5.1.2-3.4ubuntu1  1 font rasterizer library - runtime
    libtasn1-3 2.10-1ubuntu1.1  ASN.1 structures (runtime)
    libterm-readkey-perl 2.30-4build3  perl module for simple terminal control
    libtext-charwidth-perl 0.04-7build1  display widths of characters on the terminal
    libtext-iconv-perl 1.7-5  between character sets in Perl
    libtext-wrapi18n-perl 0.06-7  substitute of Text::Wrap
    libtimedate-perl 1.2000-1  of modules to manipulate date/time information
    libtinfo5 5.9-4  low-level terminfo library for terminal handling
    libudev0 175-0ubuntu9.4  library
    libusb-0.1-4 2:0.1.12-20  USB programming library
    libusb-1.0-0 2:1.0.9~rc3-2ubuntu1  USB programming library
    libuuid1 2.20.1-1ubuntu3  Unique ID library
    libwind0-heimdal 1.6~git20120311.dfsg.1-2ubuntu0.1  Kerberos - stringprep implementation
    libwrap0 7.6.q-21  Venema's TCP wrappers library
    libx11-6 2:1.4.99.1-0ubuntu2.2  client-side library
    libx11-data 2:1.4.99.1-0ubuntu2.2  client-side library
    libxapian22 1.2.8-1  engine library
    libxau6 1:1.0.6-4  authorisation library
    libxcb1 1.8.1-1ubuntu0.2  C Binding
    libxdmcp6 1:1.1.0-4  Display Manager Control Protocol library
    libxext6 2:1.3.0-3ubuntu0.1  miscellaneous extension library
    libxml2 2.7.8.dfsg-5.1ubuntu4.6  XML library
    libxmuu1 2:1.1.0-3  miscellaneous micro-utility library
    libxpm4 1:3.5.9-4  pixmap library
    linux-firmware 1.79.9  for Linux kernel drivers
    linux-generic-lts-saucy 3.11.0.15.14  Linux kernel image and headers
    linux-headers-3.11.0-15 3.11.0-15.25~precise1  files related to Linux kernel version 3.11.0
    linux-headers-3.11.0-15-generic 3.11.0-15.25~precise1  kernel headers for version 3.11.0 on 32 bit x86 SMP
    linux-headers-generic-lts-saucy 3.11.0.15.14  Linux kernel headers
    linux-image-3.11.0-15-generic 3.11.0-15.25~precise1  kernel image for version 3.11.0 on 32 bit x86 SMP
    linux-image-generic-lts-saucy 3.11.0.15.14  Linux kernel image
    linux-libc-dev 3.2.0-90.128  Kernel Headers for development
    locales 2.13+git20120306-3  files for locale support
    lockfile-progs 0.1.16  for locking and unlocking files and mailboxes
    login 1:4.1.4.2+svn3283-3ubuntu5.1  login tools
    logrotate 3.7.8-6ubuntu5  rotation utility
    lsb-base 4.0-0ubuntu20.3  Standard Base 4.0 init script functionality
    lsb-release 4.0-0ubuntu20.3  Standard Base version reporting utility
    lshw 02.15-2  about hardware configuration
    lsof 4.81.dfsg.1-1build1  open files
    ltrace 0.5.3-2.1ubuntu2  runtime library calls in dynamically linked programs
    makedev 2.3.1-89ubuntu2  device files in /dev
    man-db 2.6.1-2ubuntu1  manual pager
    manpages 3.35-0.1ubuntu1  pages about using a GNU/Linux system
    manpages-dev 3.35-0.1ubuntu1  pages about using GNU/Linux for development
    mawk 1.3.3-17  pattern scanning and text processing language
    memtest86+ 4.20-1.1ubuntu1  real-mode memory tester
    mime-support 3.51-1ubuntu1  files 'mime.types' & 'mailcap', and support programs
    mlocate 0.23.1-1ubuntu2  find files on the filesystem based on their name
    module-init-tools 3.16-1ubuntu2  for managing Linux kernel modules
    mount 2.20.1-1ubuntu3  for mounting and manipulating filesystems
    mountall 2.36.4  mounting tool
    mtr-tiny 0.80-1ubuntu1  screen ncurses traceroute tool
    multiarch-support 2.15-0ubuntu10.5  package to ensure multiarch compatibility
    mysql-client-5.5 5.5.46-0ubuntu0.12.04.2  database client binaries
    mysql-client-core-5.5 5.5.46-0ubuntu0.12.04.2  database core client binaries
    mysql-common 5.5.46-0ubuntu0.12.04.2  database common files, e.g. /etc/mysql/my.cnf
    mysql-server 5.5.46-0ubuntu0.12.04.2  database server (metapackage depending on the latest version)
    mysql-server-5.5 5.5.46-0ubuntu0.12.04.2  database server binaries and system database setup
    mysql-server-core-5.5 5.5.46-0ubuntu0.12.04.2  database server binaries
    nano 2.2.6-1  friendly text editor inspired by Pico
    ncurses-base 5.9-4  terminal type definitions
    ncurses-bin 5.9-4  programs and man pages
    net-tools 1.60-24.1ubuntu2  NET-3 networking toolkit
    netbase 4.47ubuntu1  TCP/IP networking system
    netcat 1.10-39  swiss army knife -- transitional package
    netcat-openbsd 1.89-4ubuntu1  swiss army knife
    netcat-traditional 1.10-39  swiss army knife
    ntfs-3g 1:2012.1.15AR.1-1ubuntu1.2  NTFS driver for FUSE
    ntpdate 1:4.2.6.p3+dfsg-1ubuntu3.1  for setting system time from NTP servers
    openssh-client 1:5.9p1-5ubuntu1.1  shell (SSH) client, for secure access to remote machines
    openssh-server 1:5.9p1-5ubuntu1.1  shell (SSH) server, for secure access from remote machines
    openssl 1.0.1-4ubuntu5.11  Socket Layer (SSL) binary and related cryptographic tools
    os-prober 1.51ubuntu3  to detect other OSes on a set of drives
    parted 2.3-8ubuntu5.1  partition manipulator
    passwd 1:4.1.4.2+svn3283-3ubuntu5.1  and administer password and group data
    patch 2.6.1-3  a diff file to an original
    pciutils 1:3.1.8-2ubuntu6  PCI Utilities
    perl 5.14.2-6ubuntu2.3  Wall's Practical Extraction and Report Language
    perl-base 5.14.2-6ubuntu2.3  Perl system
    perl-modules 5.14.2-6ubuntu2.3  Perl modules
    php5 5.3.10-1ubuntu3.19  HTML-embedded scripting language (metapackage)
    php5-cli 5.3.10-1ubuntu3.21  interpreter for the php5 scripting language
    php5-common 5.3.10-1ubuntu3.21  files for packages built from the php5 source
    php5-gd 5.3.10-1ubuntu3.21  module for php5
    php5-mcrypt 5.3.5-0ubuntu1  module for php5
    php5-mysql 5.3.10-1ubuntu3.21  module for php5
    plymouth 0.8.2-2ubuntu31.1  boot animation and logger - main package
    plymouth-theme-ubuntu-text 0.8.2-2ubuntu31.1  boot animation and logger - ubuntu-logo theme
    popularity-contest 1.53ubuntu1  for your favourite packages automatically
    powermgmt-base 1.31  utils and configs for power management
    ppp 2.4.5-5ubuntu1  Protocol (PPP) - daemon
    pppconfig 2.3.18+nmu3ubuntu1  text menu based utility for configuring ppp
    pppoeconf 1.20ubuntu1  PPPoE/ADSL connections
    procps 1:3.2.8-11ubuntu6.3  file system utilities
    psmisc 22.15-2ubuntu1.1  that use the proc file system
    python 2.7.3-0ubuntu2.2  high-level object-oriented language (default version)
    python-apport 2.0.1-0ubuntu17.6  crash report handling library
    python-apt 0.8.3ubuntu7.2  interface to libapt-pkg
    python-apt-common 0.8.3ubuntu7.2  interface to libapt-pkg (locales)
    python-chardet 2.0.1-2build1  character encoding detector
    python-crypto 2.4.1-1ubuntu0.1  algorithms and protocols for Python
    python-dbus 1.0.0-1ubuntu1  interprocess messaging system (Python interface)
    python-dbus-dev 1.0.0-1ubuntu1  loop integration development files for python-dbus
    python-debian 0.1.21ubuntu1  modules to work with Debian-related data formats
    python-gdbm 2.7.3-1ubuntu1  dbm database support for Python
    python-gi 3.2.2-1~precise  2.x bindings for gobject-introspection libraries
    python-gnupginterface 0.3.2-9.1ubuntu3  interface to GnuPG (GPG)
    python-httplib2 0.7.2-1ubuntu2.1  HTTP client library written for Python
    python-keyring 0.9.2-0ubuntu0.12.04.2  and access your passwords safely
    python-launchpadlib 1.9.12-1  web services client library
    python-lazr.restfulclient 0.12.0-1ubuntu1.1  for lazr.restful-based web services
    python-lazr.uri 1.0.3-1  for parsing, manipulating, and generating URIs
    python-minimal 2.7.3-0ubuntu2.2  subset of the Python language (default version)
    python-newt 0.52.11-2ubuntu10  NEWT module for Python
    python-oauth 1.0.1-3build1  library implementing of the OAuth protocol
    python-openssl 0.12-1ubuntu2.1  wrapper around the OpenSSL library
    python-pam 0.4.2-12.2ubuntu4  Python interface to the PAM library
    python-pkg-resources 0.6.24-1ubuntu1  Discovery and Resource Access using pkg_resources
    python-problem-report 2.0.1-0ubuntu17.6  library to handle problem reports
    python-serial 2.5-2.1build1  - module encapsulating access for the serial port
    python-simplejson 2.3.2-1  fast, extensible JSON encoder/decoder for Python
    python-twisted-bin 11.1.0-1ubuntu2  framework for internet applications
    python-twisted-core 11.1.0-1ubuntu2  framework for internet applications
    python-wadllib 1.3.0-2  library for navigating WADL files
    python-xapian 1.2.8-1  search engine interface for Python
    python-zope.interface 3.6.1-1ubuntu3  for Python
    python2.7 2.7.3-0ubuntu3.4  high-level object-oriented language (version 2.7)
    python2.7-minimal 2.7.3-0ubuntu3.4  subset of the Python language (version 2.7)
    readline-common 6.2-8  readline and history libraries, common files
    resolvconf 1.63ubuntu16  server information handler
    rsync 3.0.9-1ubuntu1  versatile, remote (and local) file-copying tool
    rsyslog 5.8.6-1ubuntu8.6  system and kernel logging daemon
    screen 4.0.3-14ubuntu8  multiplexor with VT100/ANSI terminal emulation
    sed 4.2.1-9  GNU sed stream editor
    sensible-utils 0.0.6ubuntu2  for sensible alternative selection
    sgml-base 1.26+nmu1ubuntu1  infrastructure and SGML catalog file support
    squid 3.1.19-1ubuntu3.12.04.3  transitional package from squid to squid3
    squid-langpack 20111114-1  error pages for Squid
    squid3 3.1.19-1ubuntu3.12.04.3  featured Web Proxy cache (HTTP proxy)
    squid3-common 3.1.19-1ubuntu3.12.04.3  featured Web Proxy cache (HTTP proxy) - common files
    ssh-import-id 2.10-0ubuntu1  retrieve an SSH public key and install it locally
    ssl-cert 1.0.28ubuntu0.1  debconf wrapper for OpenSSL
    strace 4.5.20-2.3ubuntu1  system call tracer
    sudo 1.8.3p1-1ubuntu3.4  limited super user privileges to specific users
    sysv-rc 2.88dsf-13.10ubuntu11.1  runlevel change mechanism
    sysvinit-utils 2.88dsf-13.10ubuntu11.1  utilities
    tar 1.26-4ubuntu1  version of the tar archiving utility
    tasksel 2.88ubuntu9  for selecting tasks for installation on Debian systems
    tasksel-data 2.88ubuntu9  tasks used for installation of Debian systems
    tcpd 7.6.q-21  Venema's TCP wrapper utilities
    tcpdump 4.2.1-1ubuntu2  network traffic analyzer
    telnet 0.17-36build1  telnet client
    time 1.7-23.1  GNU time program for measuring cpu resource usage
    tmux 1.6-1ubuntu1  multiplexer
    ttf-dejavu-core 2.33-2ubuntu1  font family derivate with additional characters
    tzdata 2013g-0ubuntu0.12.04  zone and daylight-saving time data
    ubuntu-keyring 2011.11.21.1  keys of the Ubuntu archive
    ubuntu-minimal 1.267.1  core of Ubuntu
    ubuntu-standard 1.267.1  Ubuntu standard system
    ucf 3.0025+nmu2ubuntu1  Configuration File: preserve user changes to config files.
    udev 175-0ubuntu9.4  device node and kernel event manager
    ufw 0.31.1-1  for managing a Netfilter firewall
    unzip 6.0-4ubuntu2.5  for .zip files
    update-manager-core 1:0.156.14.11  release upgrades
    update-notifier-common 0.119ubuntu8.6  shared between update-notifier and other packages
    upstart 1.5-0ubuntu7.2  init daemon
    ureadahead 0.100.0-12  required files in advance
    usbutils 1:005-1  USB utilities
    util-linux 2.20.1-1ubuntu3  system utilities
    uuid-runtime 2.20.1-1ubuntu3  components for the Universally Unique ID library
    vim 2:7.3.429-2ubuntu2.1  IMproved - enhanced vi editor
    vim-common 2:7.3.429-2ubuntu2.1  IMproved - Common files
    vim-runtime 2:7.3.429-2ubuntu2.1  IMproved - Runtime files
    vim-tiny 2:7.3.429-2ubuntu2.1  IMproved - enhanced vi editor - compact version
    w3m 0.5.3-5ubuntu1.1  browsable pager with excellent tables/frames support
    wget 1.13.4-2ubuntu1  files from the web
    whiptail 0.52.11-2ubuntu10  user-friendly dialog boxes from shell scripts
    whoopsie 0.1.33  crash database submission daemon
    wireless-tools 30~pre9-5ubuntu2  for manipulating Linux Wireless Extensions
    wpasupplicant 0.7.3-6ubuntu2.2  support for WPA and WPA2 (IEEE 802.11i)
    xauth 1:1.0.6-1  authentication utility
    xkb-data 2.5-1ubuntu1.3  Keyboard Extension (XKB) configuration data
    xml-core 0.13  infrastructure and XML catalog file support
    xz-lzma 5.1.1alpha+20110809-3  compression utilities - compatibility commands
    xz-utils 5.1.1alpha+20110809-3  compression utilities
    zlib1g 1:1.2.3.4.dfsg-3ubuntu4  library - runtime

[+] Current processes
    USER PID START TIME COMMAND
    root 1 16:07 0:00 /sbin/init
    root 2 16:07 0:00 [kthreadd]
    root 3 16:07 0:00 [ksoftirqd/0]
    root 5 16:07 0:00 [kworker/0:0H]
    root 7 16:07 0:00 [migration/0]
    root 8 16:07 0:00 [rcu_bh]
    root 9 16:07 0:00 [rcu_sched]
    root 10 16:07 0:00 [watchdog/0]
    root 11 16:07 0:00 [khelper]
    root 12 16:07 0:00 [kdevtmpfs]
    root 13 16:07 0:00 [netns]
    root 14 16:07 0:00 [writeback]
    root 15 16:07 0:00 [kintegrityd]
    root 16 16:07 0:00 [bioset]
    root 17 16:07 0:00 [kworker/u3:0]
    root 18 16:07 0:00 [kblockd]
    root 19 16:07 0:00 [ata_sff]
    root 20 16:07 0:00 [khubd]
    root 21 16:07 0:00 [md]
    root 22 16:07 0:00 [devfreq_wq]
    root 23 16:07 0:00 [kworker/0:1]
    root 25 16:07 0:00 [khungtaskd]
    root 26 16:07 0:00 [kswapd0]
    root 27 16:07 0:00 [ksmd]
    root 28 16:07 0:00 [khugepaged]
    root 29 16:07 0:00 [fsnotify_mark]
    root 30 16:07 0:00 [ecryptfs-kthrea]
    root 31 16:07 0:00 [crypto]
    root 43 16:07 0:00 [kthrotld]
    root 46 16:07 0:00 [dm_bufio_cache]
    root 66 16:07 0:00 [deferwq]
    root 67 16:07 0:00 [charger_manager]
    root 184 16:07 0:00 [scsi_eh_0]
    root 185 16:07 0:00 [scsi_eh_1]
    root 186 16:07 0:00 [scsi_eh_2]
    root 187 16:07 0:00 [scsi_eh_3]
    root 188 16:07 0:00 [scsi_eh_4]
    root 189 16:07 0:00 [scsi_eh_5]
    root 190 16:07 0:00 [scsi_eh_6]
    root 191 16:07 0:00 [scsi_eh_7]
    root 192 16:07 0:00 [scsi_eh_8]
    root 193 16:07 0:00 [scsi_eh_9]
    root 194 16:07 0:00 [scsi_eh_10]
    root 195 16:07 0:00 [scsi_eh_11]
    root 196 16:07 0:00 [scsi_eh_12]
    root 197 16:07 0:00 [scsi_eh_13]
    root 198 16:07 0:00 [scsi_eh_14]
    root 199 16:07 0:00 [scsi_eh_15]
    root 200 16:07 0:00 [scsi_eh_16]
    root 201 16:07 0:00 [scsi_eh_17]
    root 202 16:07 0:00 [scsi_eh_18]
    root 203 16:07 0:00 [scsi_eh_19]
    root 204 16:07 0:00 [scsi_eh_20]
    root 205 16:07 0:00 [scsi_eh_21]
    root 206 16:07 0:00 [scsi_eh_22]
    root 207 16:07 0:00 [scsi_eh_23]
    root 208 16:07 0:00 [scsi_eh_24]
    root 209 16:07 0:00 [scsi_eh_25]
    root 210 16:07 0:00 [scsi_eh_26]
    root 211 16:07 0:00 [scsi_eh_27]
    root 212 16:07 0:00 [scsi_eh_28]
    root 213 16:07 0:00 [scsi_eh_29]
    root 215 16:07 0:00 [mpt_poll_0]
    root 216 16:07 0:00 [mpt/0]
    root 241 16:07 0:00 [kworker/u2:28]
    root 242 16:07 0:00 [kworker/u2:29]
    root 245 16:07 0:00 [scsi_eh_30]
    root 356 16:07 0:00 [jbd2/sda1-8]
    root 357 16:07 0:00 [ext4-rsv-conver]
    root 358 16:07 0:00 [ext4-unrsv-conv]
    root 455 16:07 0:00 upstart-udev-bridge
    root 458 16:07 0:00 /sbin/udevd
    102 582 16:07 0:00 dbus-daemon
    syslog 585 16:07 0:00 rsyslogd
    root 666 16:07 0:00 dhclient3
    root 705 16:07 0:00 /usr/sbin/sshd
    root 749 16:07 0:00 /sbin/udevd
    root 775 16:07 0:00 [kpsmoused]
    root 785 16:07 0:00 upstart-socket-bridge
    root 786 16:07 0:00 [kworker/0:2]
    root 801 16:07 0:00 /sbin/udevd
    root 899 16:07 0:00 /sbin/getty
    root 905 16:07 0:00 /sbin/getty
    root 914 16:07 0:00 /sbin/getty
    root 918 16:07 0:00 /sbin/getty
    root 923 16:07 0:00 /sbin/getty
    root 949 16:07 0:00 acpid
    root 950 16:07 0:00 cron
    daemon 951 16:07 0:00 atd
    proxy 958 16:07 0:00 /usr/sbin/squid3
    whoopsie 982 16:07 0:00 whoopsie
    proxy 1007 16:07 0:00 (unlinkd)
    mysql 1021 16:07 0:01 /usr/sbin/mysqld
    root 1027 16:07 0:00 /usr/sbin/apache2
    www-data 1058 16:07 0:00 /usr/sbin/apache2
    www-data 1059 16:07 0:00 /usr/sbin/apache2
    www-data 1060 16:07 0:00 /usr/sbin/apache2
    www-data 1061 16:07 0:00 /usr/sbin/apache2
    www-data 1062 16:07 0:00 /usr/sbin/apache2
    root 1096 16:07 0:00 /sbin/getty
    www-data 1237 16:08 0:00 /usr/sbin/apache2
    www-data 1659 17:21 0:00 /bin/bash
    www-data 1660 17:21 0:00 /bin/bash
    www-data 2952 17:53 0:00 python
    www-data 4057 17:53 0:00 /bin/sh
    www-data 4058 17:53 0:00 ps
    www-data 4059 17:53 0:00 awk

[+] Apache Version and Modules
    Server version: Apache/2.2.22 (Ubuntu)
    Server built:   Jul 24 2015 17:25:42
    Loaded Modules:
    core_module (static)
    log_config_module (static)
    logio_module (static)
    mpm_prefork_module (static)
    http_module (static)
    so_module (static)
    alias_module (shared)
    auth_basic_module (shared)
    authn_file_module (shared)
    authz_default_module (shared)
    authz_groupfile_module (shared)
    authz_host_module (shared)
    authz_user_module (shared)
    autoindex_module (shared)
    cgi_module (shared)
    deflate_module (shared)
    dir_module (shared)
    env_module (shared)
    mime_module (shared)
    negotiation_module (shared)
    php5_module (shared)
    reqtimeout_module (shared)
    setenvif_module (shared)
    status_module (shared)
    Compiled in modules:
    core.c
    mod_log_config.c
    mod_logio.c
    prefork.c
    http_core.c
    mod_so.c

[+] Apache Config File
    #
    # Based upon the NCSA server configuration files originally by Rob McCool.
    #
    # This is the main Apache server configuration file.  It contains the
    # configuration directives that give the server its instructions.
    # See http://httpd.apache.org/docs/2.2/ for detailed information about
    # the directives.
    #
    # Do NOT simply read the instructions in here without understanding
    # what they do.  They're here only as hints or reminders.  If you are unsure
    # consult the online docs. You have been warned.
    #
    # The configuration directives are grouped into three basic sections:
    #  1. Directives that control the operation of the Apache server process as a
    #     whole (the 'global environment').
    #  2. Directives that define the parameters of the 'main' or 'default' server,
    #     which responds to requests that aren't handled by a virtual host.
    #     These directives also provide default values for the settings
    #     of all virtual hosts.
    #  3. Settings for virtual hosts, which allow Web requests to be sent to
    #     different IP addresses or hostnames and have them handled by the
    #     same Apache server process.
    #
    # Configuration and logfile names: If the filenames you specify for many
    # of the server's control files begin with "/" (or "drive:/" for Win32), the
    # server will use that explicit path.  If the filenames do *not* begin
    # with "/", the value of ServerRoot is prepended -- so "foo.log"
    # with ServerRoot set to "/etc/apache2" will be interpreted by the
    # server as "/etc/apache2/foo.log".
    #
    ### Section 1: Global Environment
    #
    # The directives in this section affect the overall operation of Apache,
    # such as the number of concurrent requests it can handle or where it
    # can find its configuration files.
    #
    #
    # ServerRoot: The top of the directory tree under which the server's
    # configuration, error, and log files are kept.
    #
    # NOTE!  If you intend to place this on an NFS (or otherwise network)
    # mounted filesystem then please read the LockFile documentation (available
    # at <URL:http://httpd.apache.org/docs/2.2/mod/mpm_common.html#lockfile>);
    # you will save yourself a lot of trouble.
    #
    # Do NOT add a slash at the end of the directory path.
    #
    #ServerRoot "/etc/apache2"
    #
    # The accept serialization lock file MUST BE STORED ON A LOCAL DISK.
    #
    LockFile ${APACHE_LOCK_DIR}/accept.lock
    #
    # PidFile: The file in which the server should record its process
    # identification number when it starts.
    # This needs to be set in /etc/apache2/envvars
    #
    PidFile ${APACHE_PID_FILE}
    #
    # Timeout: The number of seconds before receives and sends time out.
    #
    Timeout 300
    #
    # KeepAlive: Whether or not to allow persistent connections (more than
    # one request per connection). Set to "Off" to deactivate.
    #
    KeepAlive On
    #
    # MaxKeepAliveRequests: The maximum number of requests to allow
    # during a persistent connection. Set to 0 to allow an unlimited amount.
    # We recommend you leave this number high, for maximum performance.
    #
    MaxKeepAliveRequests 100
    #
    # KeepAliveTimeout: Number of seconds to wait for the next request from the
    # same client on the same connection.
    #
    KeepAliveTimeout 5
    ##
    ## Server-Pool Size Regulation (MPM specific)
    ##
    # prefork MPM
    # StartServers: number of server processes to start
    # MinSpareServers: minimum number of server processes which are kept spare
    # MaxSpareServers: maximum number of server processes which are kept spare
    # MaxClients: maximum number of server processes allowed to start
    # MaxRequestsPerChild: maximum number of requests a server process serves
    <IfModule mpm_prefork_module>
    StartServers          5
    MinSpareServers       5
    MaxSpareServers      10
    MaxClients          150
    MaxRequestsPerChild   0
    </IfModule>
    # worker MPM
    # StartServers: initial number of server processes to start
    # MinSpareThreads: minimum number of worker threads which are kept spare
    # MaxSpareThreads: maximum number of worker threads which are kept spare
    # ThreadLimit: ThreadsPerChild can be changed to this maximum value during a
    #              graceful restart. ThreadLimit can only be changed by stopping
    #              and starting Apache.
    # ThreadsPerChild: constant number of worker threads in each server process
    # MaxClients: maximum number of simultaneous client connections
    # MaxRequestsPerChild: maximum number of requests a server process serves
    <IfModule mpm_worker_module>
    StartServers          2
    MinSpareThreads      25
    MaxSpareThreads      75
    ThreadLimit          64
    ThreadsPerChild      25
    MaxClients          150
    MaxRequestsPerChild   0
    </IfModule>
    # event MPM
    # StartServers: initial number of server processes to start
    # MinSpareThreads: minimum number of worker threads which are kept spare
    # MaxSpareThreads: maximum number of worker threads which are kept spare
    # ThreadsPerChild: constant number of worker threads in each server process
    # MaxClients: maximum number of simultaneous client connections
    # MaxRequestsPerChild: maximum number of requests a server process serves
    <IfModule mpm_event_module>
    StartServers          2
    MinSpareThreads      25
    MaxSpareThreads      75
    ThreadLimit          64
    ThreadsPerChild      25
    MaxClients          150
    MaxRequestsPerChild   0
    </IfModule>
    # These need to be set in /etc/apache2/envvars
    User ${APACHE_RUN_USER}
    Group ${APACHE_RUN_GROUP}
    #
    # AccessFileName: The name of the file to look for in each directory
    # for additional configuration directives.  See also the AllowOverride
    # directive.
    #
    AccessFileName .htaccess
    #
    # The following lines prevent .htaccess and .htpasswd files from being
    # viewed by Web clients.
    #
    <Files ~ "^\.ht">
    Order allow,deny
    Deny from all
    Satisfy all
    </Files>
    #
    # DefaultType is the default MIME type the server will use for a document
    # if it cannot otherwise determine one, such as from filename extensions.
    # If your server contains mostly text or HTML documents, "text/plain" is
    # a good value.  If most of your content is binary, such as applications
    # or images, you may want to use "application/octet-stream" instead to
    # keep browsers from trying to display binary files as though they are
    # text.
    #
    # It is also possible to omit any default MIME type and let the
    # client's browser guess an appropriate action instead. Typically the
    # browser will decide based on the file's extension then. In cases
    # where no good assumption can be made, letting the default MIME type
    # unset is suggested  instead of forcing the browser to accept
    # incorrect  metadata.
    #
    DefaultType None
    #
    # HostnameLookups: Log the names of clients or just their IP addresses
    # e.g., www.apache.org (on) or 204.62.129.132 (off).
    # The default is off because it'd be overall better for the net if people
    # had to knowingly turn this feature on, since enabling it means that
    # each client request will result in AT LEAST one lookup request to the
    # nameserver.
    #
    HostnameLookups Off
    # ErrorLog: The location of the error log file.
    # If you do not specify an ErrorLog directive within a <VirtualHost>
    # container, error messages relating to that virtual host will be
    # logged here.  If you *do* define an error logfile for a <VirtualHost>
    # container, that host's errors will be logged there and not here.
    #
    ErrorLog ${APACHE_LOG_DIR}/error.log
    #
    # LogLevel: Control the number of messages logged to the error_log.
    # Possible values include: debug, info, notice, warn, error, crit,
    # alert, emerg.
    #
    LogLevel warn
    # Include module configuration:
    Include mods-enabled/*.load
    Include mods-enabled/*.conf
    # Include all the user configurations:
    Include httpd.conf
    # Include ports listing
    Include ports.conf
    #
    # The following directives define some format nicknames for use with
    # a CustomLog directive (see below).
    # If you are behind a reverse proxy, you might want to change %h into %{X-Forwarded-For}i
    #
    LogFormat "%v:%p %h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" vhost_combined
    LogFormat "%h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" combined
    LogFormat "%h %l %u %t \"%r\" %>s %O" common
    LogFormat "%{Referer}i -> %U" referer
    LogFormat "%{User-agent}i" agent
    # Include of directories ignores editors' and dpkg's backup files,
    # see README.Debian for details.
    # Include generic snippets of statements
    Include conf.d/
    # Include the virtual host configurations:
    Include sites-enabled/

[+] Sudo Version (Check out http://www.exploit-db.com/search/?action=search&filter_page=1&filter_description=sudo)
    Sudo version 1.8.3p1
    Sudoers policy plugin version 1.8.3p1
    Sudoers file grammar version 40
    Sudoers I/O plugin version 1.8.3p1

[*] IDENTIFYING PROCESSES AND PACKAGES RUNNING AS ROOT OR OTHER SUPERUSER...

    root 17 16:07 0:00 [kworker/u3:0]
    root 16 16:07 0:00 [bioset]
    root 7 16:07 0:00 [migration/0]
    root 775 16:07 0:00 [kpsmoused]
    root 195 16:07 0:00 [scsi_eh_11]
    root 46 16:07 0:00 [dm_bufio_cache]
    root 20 16:07 0:00 [khubd]
    root 21 16:07 0:00 [md]
    root 43 16:07 0:00 [kthrotld]
    root 5 16:07 0:00 [kworker/0:0H]
    root 14 16:07 0:00 [writeback]
    root 786 16:07 0:00 [kworker/0:2]
    root 19 16:07 0:00 [ata_sff]
    root 923 16:07 0:00 /sbin/getty
    root 918 16:07 0:00 /sbin/getty
    root 212 16:07 0:00 [scsi_eh_28]
    root 202 16:07 0:00 [scsi_eh_18]
    root 185 16:07 0:00 [scsi_eh_1]
    root 25 16:07 0:00 [khungtaskd]
    root 188 16:07 0:00 [scsi_eh_4]
    root 785 16:07 0:00 upstart-socket-bridge
    root 186 16:07 0:00 [scsi_eh_2]
    root 242 16:07 0:00 [kworker/u2:29]
    root 914 16:07 0:00 /sbin/getty
    root 18 16:07 0:00 [kblockd]
    root 200 16:07 0:00 [scsi_eh_16]
    root 2 16:07 0:00 [kthreadd]
    root 801 16:07 0:00 /sbin/udevd
    root 1027 16:07 0:00 /usr/sbin/apache2
        Possible Related Packages: 
             apache2 2.2.22-1ubuntu1.10  HTTP Server metapackage
             apache2-mpm-prefork 2.2.22-1ubuntu1.10  HTTP Server - traditional non-threaded model
             apache2-utils 2.2.22-1ubuntu1.10  programs for webservers
             apache2.2-bin 2.2.22-1ubuntu1.10  HTTP Server common binary files
             apache2.2-common 2.2.22-1ubuntu1.10  HTTP Server common files
             libapache2-mod-php5 5.3.10-1ubuntu3.21  HTML-embedded scripting language (Apache 2 module)
    root 206 16:07 0:00 [scsi_eh_22]
    root 241 16:07 0:00 [kworker/u2:28]
    root 187 16:07 0:00 [scsi_eh_3]
    root 196 16:07 0:00 [scsi_eh_12]
    root 210 16:07 0:00 [scsi_eh_26]
    root 184 16:07 0:00 [scsi_eh_0]
    root 27 16:07 0:00 [ksmd]
    root 203 16:07 0:00 [scsi_eh_19]
    root 191 16:07 0:00 [scsi_eh_7]
    root 193 16:07 0:00 [scsi_eh_9]
    root 23 16:07 0:00 [kworker/0:1]
    root 455 16:07 0:00 upstart-udev-bridge
    root 204 16:07 0:00 [scsi_eh_20]
    root 192 16:07 0:00 [scsi_eh_8]
    root 356 16:07 0:00 [jbd2/sda1-8]
    root 245 16:07 0:00 [scsi_eh_30]
    root 201 16:07 0:00 [scsi_eh_17]
    root 213 16:07 0:00 [scsi_eh_29]
    root 194 16:07 0:00 [scsi_eh_10]
    root 950 16:07 0:00 cron
        Possible Related Packages: 
             cron 3.0pl1-120ubuntu4  scheduling daemon
    root 666 16:07 0:00 dhclient3
    root 358 16:07 0:00 [ext4-unrsv-conv]
    root 11 16:07 0:00 [khelper]
    root 8 16:07 0:00 [rcu_bh]
    root 205 16:07 0:00 [scsi_eh_21]
    root 28 16:07 0:00 [khugepaged]
    root 209 16:07 0:00 [scsi_eh_25]
    root 22 16:07 0:00 [devfreq_wq]
    root 66 16:07 0:00 [deferwq]
    root 357 16:07 0:00 [ext4-rsv-conver]
    root 12 16:07 0:00 [kdevtmpfs]
    root 30 16:07 0:00 [ecryptfs-kthrea]
    root 9 16:07 0:00 [rcu_sched]
    root 208 16:07 0:00 [scsi_eh_24]
    root 190 16:07 0:00 [scsi_eh_6]
    root 211 16:07 0:00 [scsi_eh_27]
    root 215 16:07 0:00 [mpt_poll_0]
    root 199 16:07 0:00 [scsi_eh_15]
    root 749 16:07 0:00 /sbin/udevd
    root 3 16:07 0:00 [ksoftirqd/0]
    root 705 16:07 0:00 /usr/sbin/sshd
    root 1 16:07 0:00 /sbin/init
        Possible Related Packages: 
             busybox-initramfs 1:1.18.5-1ubuntu4.1  shell setup for initramfs
             initramfs-tools 0.99ubuntu13.4  for generating an initramfs
             initramfs-tools-bin 0.99ubuntu13.4  used by initramfs-tools
             initscripts 2.88dsf-13.10ubuntu11.1  for initializing and shutting down the system
             insserv 1.14.0-2.1ubuntu2  to organize boot sequence using LSB init.d script dependencies
             libklibc 1.5.25-1ubuntu2  libc subset for use with initramfs
             lsb-base 4.0-0ubuntu20.3  Standard Base 4.0 init script functionality
             module-init-tools 3.16-1ubuntu2  for managing Linux kernel modules
             ncurses-base 5.9-4  terminal type definitions
             sysvinit-utils 2.88dsf-13.10ubuntu11.1  utilities
             upstart 1.5-0ubuntu7.2  init daemon
    root 905 16:07 0:00 /sbin/getty
    root 189 16:07 0:00 [scsi_eh_5]
    root 10 16:07 0:00 [watchdog/0]
    root 13 16:07 0:00 [netns]
    root 15 16:07 0:00 [kintegrityd]
    root 67 16:07 0:00 [charger_manager]
    root 198 16:07 0:00 [scsi_eh_14]
    root 207 16:07 0:00 [scsi_eh_23]
    root 458 16:07 0:00 /sbin/udevd
    root 197 16:07 0:00 [scsi_eh_13]
    root 949 16:07 0:00 acpid
        Possible Related Packages: 
             acpid 1:2.0.10-1ubuntu3  Configuration and Power Interface event daemon
    root 29 16:07 0:00 [fsnotify_mark]
    root 216 16:07 0:00 [mpt/0]
    root 26 16:07 0:00 [kswapd0]
    root 899 16:07 0:00 /sbin/getty
    root 31 16:07 0:00 [crypto]
    root 1096 16:07 0:00 /sbin/getty

[*] ENUMERATING INSTALLED LANGUAGES/TOOLS FOR SPLOIT BUILDING...

[+] Installed Tools
    /usr/bin/awk
    /usr/bin/perl
    /usr/bin/python
    /usr/bin/gcc
    /usr/bin/cc
    /usr/bin/vi
    /usr/bin/vim
    /usr/bin/find
    /bin/netcat
    /bin/nc
    /usr/bin/wget
    /usr/bin/ftp

[+] Related Shell Escape Sequences...

    vi-->	:!bash
    vi-->	:set shell=/bin/bash:shell
    vi-->	:!bash
    vi-->	:set shell=/bin/bash:shell
    awk-->	awk 'BEGIN {system("/bin/bash")}'
    find-->	find / -exec /usr/bin/awk 'BEGIN {system("/bin/bash")}' \;
    perl-->	perl -e 'exec "/bin/bash";'

[*] FINDING RELEVENT PRIVILEGE ESCALATION EXPLOITS...

    Note: Exploits relying on a compile/scripting language not detected on this system are marked with a '**' but should still be tested!

    The following exploits are ranked higher in probability of success because this script detected a related running process, OS, or mounted file system
    - MySQL 4.x/5.0 User-Defined Function Local Privilege Escalation Exploit || http://www.exploit-db.com/exploits/1518 || Language=c

    The following exploits are applicable to this kernel version and should be investigated as well
    - Kernel ia32syscall Emulation Privilege Escalation || http://www.exploit-db.com/exploits/15023 || Language=c
    - Sendpage Local Privilege Escalation || http://www.exploit-db.com/exploits/19933 || Language=ruby**
    - CAP_SYS_ADMIN to Root Exploit 2 (32 and 64-bit) || http://www.exploit-db.com/exploits/15944 || Language=c
    - CAP_SYS_ADMIN to root Exploit || http://www.exploit-db.com/exploits/15916 || Language=c
    - MySQL 4.x/5.0 User-Defined Function Local Privilege Escalation Exploit || http://www.exploit-db.com/exploits/1518 || Language=c
    - open-time Capability file_ns_capable() Privilege Escalation || http://www.exploit-db.com/exploits/25450 || Language=c
    - open-time Capability file_ns_capable() - Privilege Escalation Vulnerability || http://www.exploit-db.com/exploits/25307 || Language=c

Finished
=================================================================================================
