class NodeJS < FPM::Cookery::Recipe
  description 'Evented I/O for V8 JavaScript'

  name     'nodejs'
  version  '0.10.36'
  revision 0
  homepage 'http://nodejs.org/'
  source   "http://nodejs.org/dist/v#{version}/node-v#{version}-linux-x64.tar.gz"
  sha256   '2bc13477684a9fe534bdc9d8f4a8caf6257a11953b57c42cad9b919ee259a0d5'
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
