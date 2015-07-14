#!/bin/bash

cd packages
tar -xzf openssl-0.9.8zg.tar.gz
tar -xzf autoconf-2.69.tar.gz
tar -xzf libtool-2.4.6.tar.gz
tar -xzf freetype-2.5.5.tar.gz
tar -xzf jpegsrc.v6b.tar.gz
tar -xzf libmcrypt-2.5.8.tar.gz
tar -xzf libpng-1.6.16.tar.gz
tar -xzf php-5.5.24.tar.gz
tar -xzf icu4c-4-8-1.tgz 

cd openssl-0.9.8zg
./Configure --openssldir=/usr/local/ssl darwin64-x86_64-cc no-ssl2 no-ssl3 enable-sha
make
make install

cd ../php-5.5.24
./configure '--with-apxs2=/usr/sbin/apxs' '--prefix=/usr' '--mandir=/usr/share/man' '--infodir=/usr/share/info' '--sysconfdir=/private/etc' '--enable-cli' '--with-config-file-path=/etc' '--with-config-file-scan-dir=/Library/Server/Web/Config/php' '--with-libxml-dir=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr' '--with-openssl=/usr/local/ssl' '--with-kerberos=/usr' '--with-zlib=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr' '--enable-bcmath' '--with-bz2=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr' '--enable-calendar' '--disable-cgi' '--with-curl=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr' '--enable-dba' '--with-ndbm=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr' '--enable-exif' '--enable-fpm' '--enable-ftp' '--with-icu-dir=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr' '--with-ldap=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr' '--with-ldap-sasl=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr' '--with-libedit=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr' '--enable-mbstring' '--enable-mbregex' '--with-mysql=mysqlnd' '--with-mysqli=mysqlnd' '--without-pear' '--with-pear=no' '--with-pdo-mysql=mysqlnd' '--with-mysql-sock=/tmp/mysql.sock' '--with-readline=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr' '--enable-shmop' '--with-snmp=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr' '--enable-soap' '--enable-sockets' '--enable-sysvmsg' '--enable-sysvsem' '--enable-sysvshm' '--with-tidy=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr' '--enable-wddx' '--with-xmlrpc' '--with-iconv=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr' '--with-xsl=/usr' '--enable-zip'
make clean
make
make install

cd ../libtool-2.4.6
./configure
make clean
make
make install

cd ../autoconf-2.69
./configure
make clean
make
make install

cd ../icu4c-4-8-1/source
./configure
make clean
make
make install

cd ../../libpng-1.6.16
./configure --enable-shared
make clean
make
make install

cd ../freetype-2.5.5
./configure --enable-shared
make clean
make
make install

cd ../jpeg-6b
./configure --enable-shared --enable-static
ln -s /usr/local/bin/libtool libtool
mkdir -p /usr/local/man/man1
make clean
make
make install

cd ../libmcrypt-2.5.8
./configure --enable-shared
make clean
make
make install

cd ../php-5.5.24/ext/gd
phpize
./configure --with-jpeg-dir=/usr/local --with-freetype-dir=/usr/local --with-png-dir=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr
make clean
make
make install

cd ../mcrypt
phpize
./configure
make clean
make
make install

cd ../pcntl
phpize
./configure
make clean
make
make install

cd ../intl
phpize
./configure
make clean
make
make install


echo "" >> /etc/php.ini
echo "extension=gd.so" >> /etc/php.ini
echo "extension=mcrypt.so" >> /etc/php.ini
echo "extension=pcntl.so" >> /etc/php.ini
echo "extension=intl.so" >> /etc/php.ini
echo "" >> /etc/php.ini

