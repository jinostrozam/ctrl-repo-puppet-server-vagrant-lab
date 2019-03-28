# Set up Puppet config and cron run
class profile::puppet {
  service { ['puppet', 'mcollective', 'pxp-agent']:
    ensure => running,
    enable => true,
  }

  cron { 'run-puppet':
    ensure  => present,
    command => '/usr/local/bin/run-puppet',
    minute  => '*/10',
    hour    => '*',
  }

  file { '/usr/local/bin/run-puppet':
    source => 'puppet:///modules/profile/puppet/run-puppet.sh',
    mode   => '0755',
  }
}
