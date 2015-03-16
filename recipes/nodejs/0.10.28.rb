class NodeJS < FPM::Cookery::Recipe
  description 'Evented I/O for V8 JavaScript'

  name     'nodejs'
  version  '0.10.28'
  revision Time.now.strftime("%d%m%Y")
  homepage 'http://nodejs.org/'
  source   "http://nodejs.org/dist/v#{version}/node-v#{version}.tar.gz"
  sha256   'abddc6441e0f208f6ed8a045e0293f713ea7f6dfb2d6a9a2024bf8b1b4617710'
  section  'interpreters'

  build_depends 'libssl-dev', 'g++', 'python'
  depends       'openssl'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
    man1.install Dir['local/share/man/man1/node.1']
    system 'gzip', '/usr/local/share/man/man1/node.1'
  end
end
