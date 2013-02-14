Module: java
============

A module to manage package installation of the JVM / JDK. Tested on Ubuntu.

Usage:
------

To install openjdk:

	include java::openjdk6

To install Sun java 6:

	include java::sun6

To install Oracle java 7:

	include java::oracle7

All classes support parameters such as:

	class { 'java::openjdk6':
		autoupgrade	=> true,
		purge_other	=> true,
	}

