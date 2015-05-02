exec { '/usr/bin/apt-get update': } ->

case $lsbdistcodename {
  squeeze, wheezy: {
    package { ['ruby1.9.1', 'ruby1.9.1-dev', ]:
      ensure => installed,
    }
  }
  jessie: {
    package { ['ruby2.1:any', 'ruby2.1-dev', ]:
      ensure => installed,
    }
  }
  default: { fail "not available for ${operatingsystem}/${lsbdistcodename}"}
}

package { ['rubygems', 'git-core', 'build-essential', ]:
  ensure => installed,
}

file { '/etc/gemrc':
  ensure  => file,
  content => 'gem: --no-rdoc --no-ri',
}

package { 'bundler':
  ensure   => installed,
  provider => 'gem',
  require  => Package['rubygems'],
}
