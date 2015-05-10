class Mcrouter < FPM::Cookery::Recipe
  description 'A fast, light-weight proxy for memcached and redis'

  name 'mcrouter'
  version '1.0.0'
  revision 1
  homepage 'https://github.com/facebook/mcrouter'
  source 'https://github.com/facebook/mcrouter', \
         with: :git, \
         hash: '884eff34ad5be5a07726a18f6b47427c17db86af'

  section 'net'

  chain_package true
  chain_recipes ['../glog/0.3.4', '../folly/0.37.0']

  build_depends 'gcc', 'g++', 'libboost-dev', 'libboost-thread1.55-dev',
                'libboost1.55-dev', 'libboost-thread1.55-dev',
                'libboost-filesystem1.55-dev', 'libboost-system1.55-dev',
                'libboost-regex1.55-dev', 'libboost-python1.55-dev',
                'libboost-context1.55-dev', 'automake', 'libtool', 'ragel',
                'libboost-dev', 'cmake', 'libtool', 'python-dev', 'cmake',
                'libssl-dev', 'libcap-dev', 'libevent-dev', 'libgtest-dev',
                'libsnappy-dev', 'scons', 'binutils-dev', 'make',
                'libgflags-dev', 'libdouble-conversion-dev'

  def build
    Dir.chdir('mcrouter') do
      cleanenv_safesystem 'autoreconf --install'
      configure :prefix => prefix
      make
    end
  end

  def install
    var('log/mcrouter').mkdir
    var('spool/mcrouter').mkdir
    var('mcrouter/stats').mkdir
    (etc/'init.d').install_p(workdir/'mcrouter.init', 'mcrouter')
    (etc/'mcrouter').install_p(workdir/'mcrouter.json.dist', 'mcrouter.json.dist')
    Dir.chdir('mcrouter') do
      make :install
    end
  end
end
