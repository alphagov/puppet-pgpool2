# == Class pgpool2::params
#
# This class is meant to be called from pgpool2
# It sets variables according to platform
#
class pgpool2::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'pgpool2'
      $service_name = 'pgpool2'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
