class Ruby193 < FPM::Cookery::Recipe

  description 'The Ruby virtual machine v1.9.3 with patch 551'

  name        'ruby'
  version     '1.9.3'
  patch       'p551'
  revision    Time.now.strftime("%d%m%Y")
  homepage    'http://www.ruby-lang.org/'
  source      "http://cache.ruby-lang.org/pub/ruby/ruby-#{version}-#{patch}.tar.gz"
  sha256      'bb5be55cd1f49c95bb05b6f587701376b53d310eb1bb7c76fbd445a1c75b51e8'
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
