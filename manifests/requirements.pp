exec { '/usr/bin/apt-get update': } ->

package { ['ruby-dev', 'rubygems', 'git-core', ]:
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
