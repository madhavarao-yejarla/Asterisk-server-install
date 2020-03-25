#!/bin/bash
clear
SECONDS=0
echo "-----------------------------"
echo "Welcome to asterisk installer"
echo "-----------------------------"
read -p "Do you want to proceed [y] " pass
if test "$pass" != "y"
then
     echo "Exit"
else

echo "We will now install asterisk in your system. Please be patient. It might take a while."    
 setenforce 0
     yum  -y update
 sed -i 's/\(^SELINUX=\).*/\SELINUX=disabled/' /etc/sysconfig/selinux
 sed -i 's/\(^SELINUX=\).*/\SELINUX=disabled/' /etc/selinux/config
 yum -y update
 echo "Completed!"
     echo "Installing required packages.."
     yum  -y groupinstall core base "Development Tools"
 yum -y install lynx tftp-server unixODBC mysql-connector-odbc mariadb-server mariadb httpd ncurses-devel sendmail sendmail-cf sox newt-devel li bxml2-devel libtiff-devel audiofile-devel gtk2-devel subversion kernel-devel git crontabs cronie cronie-anacron wget vim uuid-devel sqlite-devel net-t ools gnutls-devel python-devel texinfo libuuid-devel
 rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
 rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
 yum remove php*
 yum -y install php56w php56w-pdo php56w-mysql php56w-mbstring php56w-pear php56w-process php56w-xml php56w-opcache php56w-ldap php56w-intl php56w- soap
 curl -sL https://rpm.nodesource.com/setup_8.x | bash -
 echo "Completed"
pear install Console_Getopt
service firewalld stop
     echo "Enabling Mysql.."
systemctl enable mariadb.service
     echo "Completed"
     echo "Staring Mysql.."
systemctl start mariadb
     echo "Completed"
	 echo "Adding User.."
adduser asterisk -m -c "Asterisk User"
     echo "Completed"
     echo "Telephony Installation Started.."
cd /usr/src/
echo "Downloading asterisk Telephony System.."
wget http://downloads.asterisk.org/pub/telephony/libpri/libpri-current.tar.gz
wget https://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-14.7.7.tar.gz
wget http://downloads.asterisk.org/pub/telephony/dahdi-linux-complete/dahdi-linux-complete-2.8.0+2.8.0.tar.gz
wget -c https://src.fedoraproject.org/lookaside/pkgs/iksemel/iksemel-1.4.tar.gz/md5/532e77181694f87ad5eb59435d11c1ca/iksemel-1.4.tar.gz
wget -O jansson.tar.gz https://github.com/akheron/jansson/archive/v2.10.tar.gz
wget http://mirror.freepbx.org/modules/packages/freepbx/freepbx-14.0-latest.tgz
 echo "Download completed"
 echo "Installing LIB PRI"
cd /usr/src/
tar xf iksemel-1.4.tar.gz
tar xvfz dahdi-linux-complete*
tar xvfz libpri-current.tar.gz
tar xf jansson.tar.gz
rm -f dahdi-linux-complete-2.8.0+2.8.0.tar.gz libpri-current.tar.gz tar xf jansson.tar.gz
 cd iksemel*
./configure
make
make install
cd /usr/src/dahdi-linux-complete-*
make all
make install
make config
cd /usr/src/libpri-*
make
make install
echo "Installing LIB PRI Completed"
 cd /usrc/src/jansson*
 autoreconf -i
 ./configure --libdir=/usr/lib64
 make
 make install
 echo "jansson for install FreePBX 14"  
echo "Installing Asterisk"

cd /usr/src/
tar xvfz asterisk-*
rm -f asterisk-14.7.7.tar.gz
cd /usr/src/asterisk-*
contrib/scripts/install_prereq install
./configure --libdir=/usr/lib64
contrib/scripts/get_mp3_source.sh

make
make install
make config
ldconfig
 echo "Completed"
    echo "Getting the Sound files.."
cd /var/lib/asterisk/sounds
wget http://downloads.asterisk.org/pub/telephony/sounds/asterisk-core-sounds-en-wav-current.tar.gz
wget http://downloads.asterisk.org/pub/telephony/sounds/asterisk-extra-sounds-en-wav-current.tar.gz
tar xvf asterisk-core-sounds-en-wav-current.tar.gz
rm -f asterisk-core-sounds-en-wav-current.tar.gz
tar xfz asterisk-extra-sounds-en-wav-current.tar.gz
rm -f asterisk-extra-sounds-en-wav-current.tar.gz
# Wideband Audio download
wget http://downloads.asterisk.org/pub/telephony/sounds/asterisk-core-sounds-en-g722-current.tar.gz
wget http://downloads.asterisk.org/pub/telephony/sounds/asterisk-extra-sounds-en-g722-current.tar.gz
tar xfz asterisk-extra-sounds-en-g722-current.tar.gz
rm -f asterisk-extra-sounds-en-g722-current.tar.gz
tar xfz asterisk-core-sounds-en-g722-current.tar.gz
rm -f asterisk-core-sounds-en-g722-current.tar.gz
echo "Completed"
   
cd /usr/src/asterisk-*
menuselect/menuselect --enable res_config_mysql --enable cdr_mysql --enable app_mysql --enable format_mp3  menuselect.makeopts
make
make install
make config
 
sed -i 's/\(^upload_max_filesize = \).*/\120M/' /etc/php.ini
sed -i 's/^\(User\|Group\).*/\1 asterisk/' /etc/httpd/conf/httpd.conf
sed -i 's/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
     echo "Completed"
     echo "Restarting the webserver.."
systemctl restart httpd.service
     echo "Completed"
  echo "####################################" >> /etc/motd
echo "Welcome to asterisk Telephony System" >> /etc/motd
echo "####################################" >> /etc/motd
echo "" >> /etc/motd

echo "Setting up permissions.."
chown asterisk. /var/run/asterisk
chown -R asterisk. /etc/asterisk
chown -R asterisk. /var/{lib,log,spool}/asterisk
chown -R asterisk. /usr/lib64/asterisk
service asterisk start

service firewalld start
firewall-cmd --permanent --zone=public --add-port=22/tcp
firewall-cmd --permanent --zone=public --add-port=5060/udp
firewall-cmd --permanent --zone=public --add-port=10000-20000/udp
firewall-cmd --reload
service firewalld restart

	sudo mv /etc/localtime /etc/localtime.bak
	sudo ln -s /usr/share/zoneinfo/Asia/Kolkata /etc/localtime


local=`hostname -I`
public=`curl bot.whatismyipaddress.com`
clear
echo "asterisk Telephony System is installed."
echo "You can now start using asterisk by accessing http://$public (through Internet)or http://$local (through LAN) on your browser"
echo "Thanks for choosing asterisk Telephony System"
echo "You may contact asterisk Support team at madhava010@hotmail.com any queries"
fi
duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."