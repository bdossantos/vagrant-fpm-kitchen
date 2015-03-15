class Ruby215 < FPM::Cookery::Recipe
  description 'The Ruby virtual machine v2.1.5'

  name        'ruby'
  version     '2.1.5'
  revision    Time.now.strftime("%d%m%Y")
  homepage    'http://www.ruby-lang.org/'
  source      "http://cache.ruby-lang.org/pub/ruby/ruby-#{version}.tar.gz"
  sha256      '4305cc6ceb094df55210d83548dcbeb5117d74eea25196a9b14fa268d354b100'
  maintainer  '<doka@wepoca.net>'
  vendor      'fpm'
  section     'interpreters'
  
  platforms [:debian] do
     build_depends 'libffi-dev', 'libgdbm-dev', 'libncurses5-dev',
                   'libreadline6-dev', 'libssl-dev', 'libyaml-dev'

     depends 'libffi5', 'libncurses5', 'libreadline6', 'libssl1.0.0',
             'libyaml-0-2', 'libgdbm3'
  end

  def build
    configure :prefix => prefix,
              'disable-install-doc' => true
    make
  end

  def install
    make :install,
    DESTDIR' => destdir
  end

end
