# == Class pgpool2::service
#
# This class is meant to be called from pgpool2
# It ensure the service is running
#
class pgpool2::service {
  include pgpool2::params

  service { $pgpool2::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
