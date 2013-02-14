# == Class java::sun6
#
# This module manages Java from Sun version 6
#
# === Parameters
#
# [*autoupgrade*]
#   Optional. Boolean or version to stick to. Default: false
#
# [*purge_other*]
#   Optional. Boolean if all other Java implementations should be purged. Default: true
#
# === Requires
#
# === Sample Usage
#
# include java::sun6
#
class java::sun6 ( $autoupgrade = false, $purge_other = true ) inherits java {
    
    Package['sun/java/6'] {
        ensure => $autoupgrade ? {
            true    => latest,
            /^[0-9]+\./ => $autoupgrade,
            default => present
        }
    }

    case $::operatingsystem {
      'Ubuntu','Debian': {
        realize(File['sun/java/6/preseed'])
        Package['sun/java/6'] {
          require       +> File['sun/java/6/preseed'],
          responsefile  => '/var/local/sun-java-6-preseed'
        }
      }
      default: {
        # Nothing
      }
    }

    if $purge_other == true {
        Package <| tag == java and title != 'sun/java/6' |> { ensure => purged }
    }

    realize(Package['sun/java/6'])

}
