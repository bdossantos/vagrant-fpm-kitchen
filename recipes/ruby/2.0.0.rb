class Ruby200 < FPM::Cookery::Recipe
  description 'Ruby is a dynamic, reflective, object-oriented, general-purpose programming language.'

  name 'ruby'
  version '1:2.0.0.451'
  revision 0
  homepage 'http://www.ruby-lang.org/'
  source 'http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p451.tar.bz2'
  sha256 '5bf8a1c7616286b9dbc962912c3f58e67bc3a70306ca90b0882ef0bd442e02f5'

  section 'interpreters'

  build_depends 'autoconf', 'libreadline6-dev', 'bison', 'zlib1g-dev',
                'libssl-dev', 'libyaml-dev', 'libffi5'

  depends 'libffi5', 'libncurses5', 'libreadline6', 'libssl1.0.0',
          'libtinfo5', 'libyaml-0-2', 'zlib1g'

  def build
    configure :prefix => prefix,
              'disable-install-doc' => true,
              'enable-shared' => true
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
