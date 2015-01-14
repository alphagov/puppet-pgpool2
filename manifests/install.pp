# == Class pgpool2::install
#
class pgpool2::install {
  include pgpool2::params

  package { $pgpool2::params::package_name:
    ensure => present,
  }
}
