class Ruby200 < FPM::Cookery::Recipe

  description 'The Ruby virtual machine v2.0.0 with patch 643'

  name        'ruby'
  version     '2.0.0'
  patch       'p643'
  revision    Time.now.strftime("%d%m%Y")
  homepage    'http://www.ruby-lang.org/'
  source      "http://cache.ruby-lang.org/pub/ruby/ruby-#{version}-#{patch}.tar.gz"
  sha256      '4bd267a4187e4bc25c1db08f9f9bdc0ce595a705569cac460d98c4f5b02e614e'
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
