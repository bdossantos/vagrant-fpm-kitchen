class Ruby214 < FPM::Cookery::Recipe
  description 'Ruby is a dynamic, reflective, object-oriented, general-purpose programming language.'

  name 'ruby'
  version '1:2.1.4'
  revision 0
  homepage 'http://www.ruby-lang.org/'
  source 'http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.4.tar.gz'
  sha256 'bf9952cdeb3a0c6a5a27745c9b4c0e5e264e92b669b2b08efb363f5156549204'

  maintainer '<root@bds.io>'
  vendor 'fpm'

  section 'interpreters'

  platforms [:ubuntu, :debian] do
    build_depends 'libreadline6-dev', 'libssl-dev', 'libyaml-dev',
                  'libffi-dev', 'libgdbm-dev', 'libncurses5-dev'

    depends 'libffi5', 'libncurses5', 'libreadline6', 'libyaml-0-2','libgdbm3'

    if Facter.value(:lsbdistcodename) == 'squeeze'
      depends.push('libssl0.9.8')
    else
      depends.push('libssl1.0.0')
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
