# == Class java
#
# This module manages
# * Java Virtual Machine (JVM)
# * Java Development Kit (JDK)
#
# It provides support for different implementations via subclasses, for example
# * java::openjdk6
# * java::sun6
#
# New implementations should be added via the same mechanism
#
# === Sample Usage
#
# Simple include using default parameters:
#   include java::openjdk6
#     or
#   include java::sun6
#
# Packages can be pinned by setting the version:
#   class { 'java::openjdk6': autoupgrade => '1:1.6.3' }
#
# or set to autoupgrade to latest:
#   class { 'java::openjdk6': autoupgrade => true }
#
# Default behavior is to purge any other JVM/JDK implementation on the server. You can control this behavior as well:
#   class { 'java::sun6': purge_other => false }
#
class java {

    include java::params

    @file { 'sun/java/6/preseed':
      path    => '/var/local/sun-java-6-preseed',
      ensure  => file,
      owner   => root,
      group   => root,
      mode    => '0600',
      content => 'sun-java6-bin shared/accepted-sun-dlj-v1-1 boolean true\n'
    }

    @package {
        'sun/java/6':
            name    => $java::params::sun6_packages,
            tag     => [ java, sun6 ],
            ensure  => present;
        'openjdk/java/6':
            name    => $java::params::openjdk6_packages,
            tag     => [ java, openjdk6 ];
        'oracle/java/7':
            name    => $java::params::oracle7_packages,
            tag     => [ java, oracle7 ],
    }

}
