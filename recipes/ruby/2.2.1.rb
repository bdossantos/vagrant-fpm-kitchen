class Ruby221 < FPM::Cookery::Recipe

  description 'The Ruby virtual machine v2.2.1'

  name        'ruby'
  version     '2.2.1'
  revision    Time.now.strftime("%d%m%Y")
  homepage    'http://www.ruby-lang.org/'
  source      "http://cache.ruby-lang.org/pub/ruby/ruby-#{version}.tar.gz"
  sha256      '5a4de38068eca8919cb087d338c0c2e3d72c9382c804fb27ab746e6c7819ab28'
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
         'DESTDIR' => destdir
  end

end
