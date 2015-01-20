# == Class pgpool2::install
#
class pgpool2::install {
  include pgpool2::params

  package { $pgpool2::params::package_name:
    ensure => present,
  }

  file { '/var/run/postgresql':
    ensure  => directory,
    owner   => 'postgres',
    group   => 'postgres',
    mode    => '0755',
    notify  => Service[$pgpool2::params::service_name],
    require => Package[$pgpool2::params::package_name],
  }
  file { '/etc/pgpool2/pool_passwd':
    ensure  => present,
    owner   => 'postgres',
    group   => 'postgres',
    mode    => '0644',
    notify  => Service[$pgpool2::params::service_name],
    require => Package[$pgpool2::params::package_name],
  }
}
