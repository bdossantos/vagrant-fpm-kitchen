class TwemProxy < FPM::Cookery::Recipe
  description 'A fast, light-weight proxy for memcached and redis'

  name 'twemproxy'
  version '0.3.0'
  revision 0
  homepage 'https://github.com/twitter/twemproxy'
  source "https://github.com/twitter/twemproxy/archive/v#{version}.tar.gz"
  sha256 'daf54481035d92506953c6ace6bedd84b7b04696b9e4af147eb318053de225e4'

  section 'net'

  build_depends 'automake', 'libtool'

  def build
    cleanenv_safesystem 'autoreconf -fvi'
    configure :prefix => prefix
    make
  end

  def install
    (etc/'init.d').install_p(workdir/'nutcracker.init', 'twemproxy')
    (etc/'twemproxy').install_p(workdir/'nutcracker.root.yml', 'nutcracker.root.yml')
    make :install, 'DESTDIR' => destdir
  end
end
