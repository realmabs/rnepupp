# == Class: base
#
# Full description of class base here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'base':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class base {

include ::ssh
::ssh::server::configline { 'PermitRootLogin': value => 'yes' }
class { '::ntp':
servers => [ '0.pool.ntp.org', '2.centos.pool.ntp.org', '1.rhel.pool.ntp.org'],
}

$defaultpass = '$6$1CVTIPO0$wF89yqg.lLpR3UAaTlF4vs68TQNOEup2EH0cIkbgrVxFqGZy3n9CcfLmE1NNNpVcUJBzxztVtgzpGo0D57cXR0'

::base::user { 'kallet':
state => 'present',
id => 'kallet',
uid => '507',
gid => '507',
pass => $defaultpass,
realname => 'KalleT',
sgroups => [],
}

group { 'kallet':
ensure => 'present',
gid => '507',
}
}
