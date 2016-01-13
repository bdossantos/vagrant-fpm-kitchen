class TwemProxy < FPM::Cookery::Recipe
  description 'A fast, light-weight proxy for memcached and redis'

  name 'twemproxy'
  version '0.4.1'
  revision 1
  homepage 'https://github.com/twitter/twemproxy'
  source 'https://github.com/twitter/twemproxy', \
         with: :git, \
         tag: 'v0.4.1'

  section 'net'

  build_depends 'automake', 'libtool'

  def build
    cleanenv_safesystem 'autoreconf -fvi'
    configure :prefix => prefix
    make
  end

  def install
    var('log/twemproxy').mkdir
    (etc/'init.d').install_p(workdir/'nutcracker.init', 'twemproxy')
    (etc/'twemproxy').install_p(workdir/'nutcracker.root.yml', 'nutcracker.root.yml')
    make :install, 'DESTDIR' => destdir
  end
end
