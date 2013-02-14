class java::params {
    case $::operatingsystem {
        'ubuntu','debian': {
            $openjdk6_packages = [ 'openjdk-6-jre-headless', 'openjdk-6-jre-lib' ]
            $sun6_packages = [ 'sun-java6-jre', 'sun-java6-jdk', 'sun-java6-bin' ]
            $oracle7_packages = [ 'oracle-java7-bin', 'oracle-java7-jre', 'oracle-java7-jdk' ]
        }
        default: {
            fail("Unsupport operatingsystem ${::operatingsystem}")
        }
    }
}
