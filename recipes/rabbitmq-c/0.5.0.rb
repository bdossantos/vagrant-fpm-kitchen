class RabbitmqC < FPM::Cookery::Recipe
  description 'RabbitMQ C client'

  name 'rabbitmq-c'
  version '0.5.0'
  homepage 'https://github.com/alanxz/rabbitmq-c'
  source "https://github.com/alanxz/rabbitmq-c/releases/download/v#{version}/rabbitmq-c-#{version}.tar.gz"
  sha1 '35910a2d66a2ec1d11403e6a79ca50e31db719da'
  build_depends 'libcurl4-openssl-dev'

  def build
    configure :prefix => prefix
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
