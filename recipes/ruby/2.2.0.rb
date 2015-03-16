class Ruby220 < FPM::Cookery::Recipe
  description 'Ruby is a dynamic, reflective, object-oriented, general-purpose programming language.'

  name 'ruby'
  version '1:2.2.0'
  revision Time.now.strftime("%d%m%Y")
  homepage 'http://www.ruby-lang.org/'
  source 'http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz'
  sha256 '7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc'

  maintainer '<root@bds.io>'
  vendor 'fpm'

  section 'interpreters'

  platforms [:ubuntu, :debian] do
    build_depends 'autoconf', 'libreadline6-dev', 'bison', 'zlib1g-dev',
                  'libssl-dev', 'libyaml-dev', 'libffi-dev', 'libgdbm-dev',
                  'libncurses5-dev', 'libxml2-dev', 'libxslt1-dev', 'libc6-dev'

    depends 'libffi5', 'libncurses5', 'libreadline6', 'libyaml-0-2', 'zlib1g',
            'libc6', 'libgdbm3'

    if Facter.value(:lsbdistcodename) == 'squeeze'
      depends.push('libssl0.9.8')
    else
      depends.push('libssl1.0.0', 'libtinfo5')
    end
  end

  def build
    configure :prefix => destdir.to_s.include?('embedded') ? destdir : prefix,
              'disable-install-doc' => true,
              'enable-shared' => true,
              'with-opt-dir' => destdir
    make
  end

  def install
    if destdir.to_s.include?('embedded')
      make :install

      # Shrink package.
      rm_f "#{destdir}/lib/libruby-static.a"
      safesystem "strip #{destdir}/bin/ruby"
      safesystem "find #{destdir} -name '*.so' -or -name '*.so.*' | xargs strip"
    else
      make :install, 'DESTDIR' => destdir
    end
  end
end
