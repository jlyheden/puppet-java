# == Class java::openjdk6
#
# This module manages java openjdk6
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
# include java::openjdk6
#
class java::openjdk6 ( $autoupgrade = false, $purge_other = true ) inherits java {
    
    Package['openjdk/java/6'] {
        ensure => $autoupgrade ? {
            true    => latest,
            /^[0-9]+\./ => $autoupgrade,
            default => present
        }
    }

    if $purge_other == true {
        Package <| tag == java and title != 'openjdk/java/6' |> { ensure => purged }
    }

    realize(Package['openjdk/java/6'])

}