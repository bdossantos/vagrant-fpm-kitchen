class Ruby222 < FPM::Cookery::Recipe
  description 'Ruby is a dynamic, reflective, object-oriented, general-purpose programming language.'

  name 'ruby'
  version '1:2.3.1'
  revision 0
  homepage 'http://www.ruby-lang.org/'
  source 'https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz'
  sha256 'b87c738cb2032bf4920fef8e3864dc5cf8eae9d89d8d523ce0236945c5797dcd'

  maintainer '<root@bds.io>'
  vendor 'fpm'

  section 'interpreters'

  platforms [:ubuntu, :debian] do
    build_depends 'libreadline6-dev', 'libssl-dev', 'libyaml-dev',
                  'libffi-dev', 'libgdbm-dev', 'libncurses5-dev'

    depends 'libssl1.0.0', 'libncurses5', 'libreadline6', 'libyaml-0-2'

    if Facter.value(:lsbdistcodename) == 'jessie'
      depends.push('libffi6')
    else
      depends.push('libffi5')
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
