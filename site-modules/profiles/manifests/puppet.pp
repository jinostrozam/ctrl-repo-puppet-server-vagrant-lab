# Set up Puppet config and cron run
class profiles::puppet {
  service { ['puppet', 'pxp-agent']:
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
    source => 'puppet:///modules/profiles/puppet/run-puppet.sh',
    mode   => '0755',
  }
}
