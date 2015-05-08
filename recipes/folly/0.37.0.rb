class Folly < FPM::Cookery::Recipe
  description 'An open-source C++ library developed and used at Facebook.'

  name 'folly'
  version '0.37.0'
  homepage 'https://github.com/facebook/folly'
  source "https://github.com/facebook/folly/archive/v#{version}.tar.gz"
  sha1 'decb184ac33726add8f12dccf87eca44d2139f39'

  chain_package true
  chain_recipes ['../glog/0.3.4']

  build_depends 'g++', 'automake', 'autoconf', 'autoconf-archive', 'libtool',
                'libboost-all-dev', 'libevent-dev', 'libdouble-conversion-dev',
                'libgflags-dev', 'liblz4-dev', 'liblzma-dev', 'libsnappy-dev',
                'make', 'zlib1g-dev', 'binutils-dev', 'libjemalloc-dev',
                'libssl-dev'

  def build
    Dir.chdir('folly') do
      cleanenv_safesystem 'autoreconf -ivf'
      configure :prefix => prefix
      make
    end
  end

  def install
    Dir.chdir('folly') do
      make :install, 'DESTDIR' => destdir
    end
  end
end
