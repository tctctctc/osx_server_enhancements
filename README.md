# MAC OS X WEB SERVER/PHP enhancements

There are a lot of opinions with regard to how to get various types of open source web server and applications programming software working with OS X. A lot of these center around installing a package management service such as Homebrew or MacPorts. While this may be the way some folks wish to go, I am not very big on using these as they introduce unnecessary dependencies, applications and libraries that are not necessary in the day to day operation of your web server. My opinion is that you still have configuration you need to do even when using Homebrew or MacPorts and the systems themselves need maintenance and a degree of know how.

My preferred method is to get down and dirty with installing things that need to be installed an nothing more. As such, I’ve learned to extend things on the base version of PHP that come with Mac OS X Server (Yosemite) without the need of package managing services.

Building additional components for your OS 10.10 web server can be pretty simple if you are comfortable around a command line and following a few instructions. This involves just a few more commands than it would take to run a package manager and gives you a lot more control while at the same time understanding a bit more about how your software works.

In my example, I need to accomplish a few basic tasks:

Remove the compiled-in GD installation on Mac OS X’s PHP installation as it does not support the creation of png files which is a must have.
Add the PHP multi-threaded pcntl extension to the command line for processing command line scripts properly programmed to use multi-threaded processes.
Make mcrypt work with the installed PHP (VERY important and almost a deal breaker to running a secure web server on Mac OS X).

To do all of this, we have to over-write the base install of PHP on Mac OS X. I am starting from a base install of Mac OS 10.10 (Yoesmite) running Mac OS X Server version 4.04. The provided version of PHP with this set up is 5.5.14.. Here are the software packages and versions I have downloaded to accomplish these tasks:

php-5.5.14
autoconf-2.69
jpeg-6b
libgd-GD-2_0_33
libmcrypt-2.5.8
libpng-1-6-16
freetype-2.5.5

This repository provides these packages and an installer. The goal is to update the GD extension inside of PHP to support jpeg, gif, and png images along with freetype as a shared object (extension) to PHP as opposed to being compiled. It is also to provide mcrypt which is not provided by default as well as the pcntl extension for multi-threading. Additional modules could be added to this if desired, but these three were the ones most mission critical to my rationale behind creating this repository.

In addition to compiling these resources, it will update your php.ini file to load these extensions.

These extensions were designed to be used in conjunction with OS X Server but that is not require. Notably absent from this is an installer for MySQL which can be obtained and installed from mysql.org directly and installed.

For more information on this repository, please visit:

http://www.michaelbagnall.com/blogs/php-gd-fixing-your-php-server-mac-os-x-without-homebrewmacports
