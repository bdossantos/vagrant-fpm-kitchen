class Ruby200 < FPM::Cookery::Recipe
  description 'Ruby is a dynamic, reflective, object-oriented, general-purpose programming language.'

  name 'ruby'
  version '1:2.0.0.643'
  revision Time.now.strftime("%d%m%Y")
  homepage 'http://www.ruby-lang.org/'
  source 'http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p643.tar.gz'
  sha256 '4bd267a4187e4bc25c1db08f9f9bdc0ce595a705569cac460d98c4f5b02e614e'

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
