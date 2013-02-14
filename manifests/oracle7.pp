# == Class java::oracle7
#
# This module manages Java from Oracle version 7
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
# include java::oracle7
#
class java::oracle7 ( $autoupgrade = false, $purge_other = true ) inherits java {
    
    Package['oracle/java/7'] {
        ensure => $autoupgrade ? {
            true    => latest,
            /^[0-9]+\./ => $autoupgrade,
            default => present
        }
    }

    if $purge_other == true {
        Package <| tag == java and title != 'oracle/java/7' |> { ensure => purged }
    }

    realize(Package['oracle/java/7'])

}
