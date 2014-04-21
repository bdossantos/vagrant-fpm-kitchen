class Ruby211 < FPM::Cookery::Recipe
  description 'Ruby is a dynamic, reflective, object-oriented, general-purpose programming language.'

  name 'ruby'
  version '1:2.1.1'
  revision 0
  homepage 'http://www.ruby-lang.org/'
  source 'http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz'
  sha256 'c843df31ae88ed49f5393142b02b9a9f5a6557453805fd489a76fbafeae88941'

  section 'interpreters'

  build_depends 'autoconf', 'libreadline6-dev', 'bison', 'zlib1g-dev',
                'libssl-dev', 'libyaml-dev', 'libffi-dev', 'libgdbm-dev',
                'libncurses5-dev', 'libxml2-dev', 'libxslt1-dev', 'libc6-dev'

  depends 'libffi5', 'libncurses5', 'libreadline6', 'libssl1.0.0',
          'libtinfo5', 'libyaml-0-2', 'zlib1g', 'libc6', 'libgdbm3'

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
