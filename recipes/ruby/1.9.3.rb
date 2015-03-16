class Ruby193 < FPM::Cookery::Recipe
  description 'Ruby is a dynamic, reflective, object-oriented, general-purpose programming language.'

  name 'ruby'
  version '1:1.9.3.551'
  revision 0
  homepage 'http://www.ruby-lang.org/'
  source 'http://cache.ruby-lang.org/pub/ruby/2.0/ruby-1.9.3-p551.tar.gz'
  sha256 'bb5be55cd1f49c95bb05b6f587701376b53d310eb1bb7c76fbd445a1c75b51e8'

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
