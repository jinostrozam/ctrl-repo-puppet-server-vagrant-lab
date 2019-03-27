# Set the time zone for all nodes
class profiles::timezone {
  class { 'timezone':
    timezone => 'Etc/UTC',
  }
}

