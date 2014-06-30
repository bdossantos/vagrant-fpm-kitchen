class PHPAMQP < FPM::Cookery::Recipe
  description 'PHP AMQP'

  name 'php5-amqp'
  version '1.4.0'
  homepage 'http://pecl.php.net/package/amqp'
  source "http://pecl.php.net/get/amqp-#{version}.tgz"
  sha1 '7a08ff1cf0368f2f61db360b3402ed8c45444e85'

  section 'php'

  chain_package true
  chain_recipes ['rabbitmq-c']

  depends 'php5-common', 'rabbitmq-c'
  build_depends 'php5-dev', 'automake', 'libtool', 'php5-dev', 'gcc', 'make', \
                'libcurl4-openssl-dev'

  def build
    safesystem 'phpize'
    configure :prefix => prefix, :'with-amqp' => true, :'with-librabbitmq-dir' => "#{destdir}/usr"
    make
    make :install, 'DESTDIR' => destdir
  end

  def install
    prefix('lib/php5/20100525/').install 'modules/amqp.so'
    etc('php5/conf.d').install workdir('20-amqp.ini'), '20-amqp.ini'
  end
end
