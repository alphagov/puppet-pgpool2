# == Class pgpool2::config
#
# This class is called from pgpool2
#
class pgpool2::config(
   $backend_zero_hostname,
   $backend_one_hostname,
   $load_balance_mode = 'off',
) {

  file { '/etc/pgpool2/pgpool.conf':
    ensure  => present,
    content => template('pgpool2/etc/pgpool2/pgpool.conf.erb'),
    require => Package['pgpool2'],
    notify  => Service['pgpool2'],
  }

}
