# == Class: pgpool2
#
# Full description of class pgpool2 here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class pgpool2 (
) inherits pgpool2::params {

  # validate parameters here

  anchor { 'pgpool2::begin': } ->
  class { 'pgpool2::install': } ->
  class { 'pgpool2::config': }
  class { 'pgpool2::service': } ->
  anchor { 'pgpool2::end': }

  Anchor['pgpool2::begin']  ~> Class['pgpool2::service']
  Class['pgpool2::install'] ~> Class['pgpool2::service']
  Class['pgpool2::config']  ~> Class['pgpool2::service']
}
