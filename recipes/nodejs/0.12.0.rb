class NodeJS < FPM::Cookery::Recipe
  description 'Evented I/O for V8 JavaScript'

  name     'nodejs'
  version  '0.12.0'
  revision Time.now.strftime("%d%m%Y")
  homepage 'http://nodejs.org/'
  source   "http://nodejs.org/dist/v#{version}/node-v#{version}.tar.gz"
  sha256   '9700e23af4e9b3643af48cef5f2ad20a1331ff531a12154eef2bfb0bb1682e32'
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
