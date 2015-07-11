---
title: SMX
description: Systems management program for UNIX/Linux including user/group, disk, general systems management and server management
author: Darius Anderson
created: 2010 Jul 10
modified: 2011 Jul 7

---

SMX
===

## Systems management program for UNIX/Linux

[![main-menu screen](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/main-screen.JPG)](#smx-main-screen)


SMX is a general systems administration program for UNIX/Linux/*NIX based systems for user/group, disk, general systems management and server management.
Including Apache, MySQL, Samba, DHCP, DNS, MS Active Directory intergration, etc.

It uses a unique OS detection script that allows the program to guess which version or distrobution of Linux it is running on using various files incling
/proc/version and /etc/redhat-version, it currently support all major distrobutions of Linux including: all red hat versions, all debian versions, all ubuntu
versions, and all SuSE versions, and OS X, with support for knoppix, arch, gentoo and BSD support planned in the near future

[![os-detection script](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/os-detection.JPG)](#os-detection)

COMPARISON BETWEEN SYSTEM MANAGEMENT PROGRAMS
=============================================

## Comparison between webmin, chef, cfengine, puppet, spacewalk, and SCCM (System Center Configuration Manager), and SMX, pros and cons of all programs

CHEF
====

[![chef](http://s3.amazonaws.com/opscode-corpside/assets/121/pic-chef-logo.png)](#chef-logo)

An open-source configuration program written in Ruby using pure-Ruby, domain-specific language (DSL) for writing system configuation scripts, also known as
"recipes" that describe how server applications such as Apache, MySQL or Hadoop are to be configured

Pros - Chef does support a wide range of systems including AT&T UNIX, Linux, BSD and Microsoft Windows and relitivly easy to setup and use ether in a stand alone
configuration or in a client/server configuration

Cons - Since Chef is written in Ruby and uses DSL (Domain-Specific Language) for writing its configutation scripts, it almost requires you to know Ruby,
the documentation for it is terrible, it expects you to know Chef before using it, and the examples try and do everything at once

Comparision:

Chef                                                                                                 SMX
----                                                                                                 ---
Supports a wide range of systems from AT&T UNIX, Linux and Windows									 Supports All major Linux versions, and OS X
Uses Ruby and domain-specific language to create configutation scripts								 Written entirely in Bash, easy to learn and extend the program
Works best in client/server mode                                                                     Works in standalone and can be used to manage remote system
Configration engine for chef requires you to know chef before you use it                             easy to learn and use since the program is written in Bash
           								 															 Written in portable language and uses non-specific software 
																									 and uses $(which <software>) to get program path

CFENGINE
========

[![CFEngine](http://media.marketwire.com/attachments/201402/227117_cfengine-log.jpg)](#cfengine-logo)

An open-source configutation manager which is web based and command line based, to provide automated configuration of large-scale systems such as servers, desktops,
imbedded networked devices, and like chef, it too uses configuation scripts to configure how a user were to configure a server or program in its own language, even though, it is very well written, better than chef, and supports a wide range of systems from UNIX and Linux to Windows and in v2 features options for machine learning

Pros - Very well written and designed for a whole slew of systems ranging from small embedded networked devices to corporate servers and desktops, offers a web-based interface as a subsutute for the command-line client, and has support for machine learning, which no other program (except those created for IBM's Watson)
has support for

Cons - It does require some expert knoledge about the OS that CFEngine is being installed on, and also with the web-based management console, since its web-based, it will suffer from all other web-based programs such as invalid or self-signed SSL certificates, insecure login management, etc

Comparision:

CFEngine                                                                                             SMX
--------                                                                                             ---
Largly web-based, could suffer from self-signed SSL certs and may cause firewall problems            Strictly command-line based, allowing only root user access
																									 using id -g (will be switching to sudo -v in the future)
Like Chef, it uses self-made configuration scripts to perform its tasks								 Written completely in Bash script, easy to learn and extend
Configuration language has been described as a "programming language without resonable syntax"       Since it is written in Bash, its a language that sysadmins
																									 allready know, and as such it is easy to work in
Is battle-tested against the most hostile of environments, the college campus network, with users    Amount of users is currently unknown, but it can be run 
up to 50,000 or more																				 anywhere that UNIX/Linux and a set of pre-installed programs
																									 can be run
Does not play well with file integrity checkers such as tripwire

PUPPET
======

[![Puppet](http://www.ammeon.com/wp-content/uploads/2015/05/puppet-labs-logo-300x295.png)](#Puppet-logo)

An open-source configuration manager for Linux/UNIX and Windows-based systems written in Ruby and, like chef, it uses a Ruby DSL to create its configuration
scripts, as such it is system-specific and works in a client/server configuration, and requires connection to a main server, also known as the "puppet master"

Pros - Very well written, used by many Fortune-500 companies such as Mozilla, CERN, Dell, Oracle, Intel and Google to name a few, uses a Ruby DSL to create
its configration scripts and as such it is a high-level, system-specific language, that allows configuration for multiple systems without having to put in
OS specific commands such as rpm, yum and apt

Cons - Like chef, it uses a Ruby DSL to create its configutation scripts, so it almost requires you to know Ruby before you use it, and it requires works in a client/server environment and requires connection to a main server, known as a "puppet master" and if that server goes down you can't configure your systems

Comparision:

Puppet                                                                                               SMX
------                                                                                               ---
like chef, it uses Ruby DSL to create its configuration scripts, requires knoledge of Ruby           Written purly in Bash, a language that is easy to learn 
                                                                                                     and expand, a language that sysadmins know
No need for OS specific commands such as rpm, yum and apt                                            Uses unique OS detection script to "guess" which OS 
                                                                                                     or distrobution to use
Requies connection to main server, known as a "puppet master" if this server goes down, system       
conifguatation is impossible																		 Does not require connection to master server, as each client 
                                                                                                     works independantly of one another

SPACEWALK
=========

[![Spacewalk](http://www.clevernetsystems.com/wp-content/uploads/2014/03/spacewalk-black.png)](#spacewalk-logo)

An open-source systems management program developed by Red Hat that has a web-based interface and a backend to work with Red Hat satellite and Red Hat Proxy server
to work with RHEL, Solaris, Fedora, CentOS, SuSE and Debian based systems, but requires a Red Hat network account which can cost upwards of £2,000 and, like
puppet, it requires a cental server to communicate with, and since its web based, like CFEngine it may suffer from invalid or self-signed SSL certificates
or may require ports to be open in a firewall which can cause problems for sysadmins to justify opening said ports

Pros - Great support for RHEL-based, Debian-based, Ubuntu-based and SuSE-based systems and support for Solaris

Cons - Can't perform tasks such as user admin, disk admin, etc. really is just patch management software that can push out OS updates to registered systems, no
support for OS X, requires connection to main spacewalk server, and like other web-based system management programs, it may suffer from self-signed SSL 
certificates

Comparision:

Spacewalk                                                                                            SMX
---------                                                                                            ---
Requries subscription to Red Hat Network                                                             Fully open-source, requires no licence, exept GPLv2
Requries connection to central spacewalk server, if that system goes down, system config impossible  Does not require Internet connection or connection to master
                                                                                                     server, works independantly of each other
Doesn't perform tasks such as user, disk and other standard sysadmin tasks, is really patch
management software                                                                                  Performs all user/group, disk and other sysadmin tasks such 
                                                                                                     as, server management

SCCM (System Center Configuration Manager)
==========================================

[![SCCM](http://www.theitbros.com/wp-content/2011/03/sccm1.png)](#sccm-logo)

Microsoft System Center Configuration Manager is a systems management software platform for Windows, Linux, OS X and UNIX-based systems as well as mobile OS's
such as Android, iOS and Windows Phone, it provides patch management, remote control, software distrobution, OS deployment and network access protection
requires a 64Bit system running Windows server to run the sccm server, it best works in Windows-only envronments working with Active Directory, can't perform
tasks that other systems configuration managers can perform such as user/group management, disk management, etc

Pros - Great support for Windows, working with Active Directory and other Microsoft clients, performing OS deployment, patch management, and software distrobution

Cons - Requries Windows server to use as sccm main server, can work with non-windows clients (Linux, UNIX and the like) but "preferes" to work with Windows clients
       not very poweful - as it only uses a GUI to perform tasks, and as typical with Microsoft it uses the proprietary model, so users can't change the product
       to suit their needs

Comparision:

SCCM                                                                                                 SMX
----                                                                                                 ---
Requries Windows server to run management console                                                    Can be run on any varient of linux, requires no centeral 
                                                                                                     server
Can't perform task that other systems management programs can                                        can perform all user/group, disk and systems/server mgmt tasks
Follows proprietary software model                                                                   fully open source, requring acceptance of GPLv2 licence


SMX (Systems Management eXecutive)
----------------------------------

[![SMX](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/main-screen.JPG)](#smx-main-screen)

An open-source systems management program, working with Linux and UNIX based systems using an OS detection script to "guess" which version of Linux the system
is running and run OS specific commands for that system, can perform multple tasks such as user/group management, disk management, general server management,
including server management for Apache, MySQL, Samba, DNS, DHCP, etc

Pros - Easy to learn, use, and extend, witten in Bash, a language that sysadmins allready know and work with, can perform tasks such as user/group modifications,
disk administration, general system administration, and server administration for Apache, MySQL, Samba, DNS, DHCP, etc

Cons - Not fully supported by every linux distrobution (knoppix, arch, gentoo and BSD) but will in a future release


Features
========

User management:

[![SMX-user-mgmt](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/user-management.JPG)](#smx-user-mgmt)

Group management:

[![SMX-group-mgmt](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/group-management.JPG)](#smx-group-mgmt)

Password management:

[![SMX-passwd-mgmt](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/passwd-management)](#smx-passwd-mgmt)

Disk management:

[![SMX-disk-mgmt](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/disk-management.JPG)](#smx-disk-mgmt)

Systems management:

[![SMX-sys-mgmt](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/systems-management.JPG)](#smx-sys-mgmt)

Server management:

[![SMX-srv-mgmt](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/server-management.JPG)](#smx-srv-mgmt)

Package management:

[![SMX-pkg-mgmt](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/pkg-management.JPG)](#smx-pkg-mgmt)

System update:

[![SMX-sys-upd](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/system-update.JPG)](#smx-sys-upd)

IP management:

[![SMX-ip-mgmt](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/IP-management.JPG)](#smx-ip-mgmt)

Firewall management:

[![SMX-fire-mgmt](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/fire-management.JPG)](#smx-fire-mgmt)

User management (For OS X):

[![SMX-user-mgmt-osx](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/user-management-OSX.JPG)](#smx-user-mgmt-osx)

Group management (For OS X):

[![SMX-grp-mgmt-osx](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/group-management-OSX.JPG)](#smx-grp-mgmt-osx)

Disk management (For OS X):

[![SMX-disk-mgmt-osx](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/disk-management-OSX.JPG)](#smx-disk-mgmt-osx)

Systems management (For OS X):

[![SMX-sys-mgmt-osx](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/systems-management-OSX.JPG)](#smx-sys-mgmt-osx)

Package management (For OS X):

[![SMX-pkg-mgmt-osx](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/pkg-management-OSX.JPG)](#smx-pkg-mgmt-osx)

IP management (For OS X):

[![SMX-ip-mgmt-osx](https://raw.githubusercontent.com/unixuser011/smx/master/screenshots/IP-management-OSX.JPG)](#smx-ip-mgmt-osx)