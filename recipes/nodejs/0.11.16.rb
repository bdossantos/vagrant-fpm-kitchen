class NodeJS < FPM::Cookery::Recipe
  description 'Evented I/O for V8 JavaScript'

  name     'nodejs'
  version  '0.11.16'
  revision Time.now.strftime("%d%m%Y")
  homepage 'http://nodejs.org/'
  source   "http://nodejs.org/dist/v#{version}/node-v#{version}.tar.gz"
  sha256   'f0d141faa1f7da3aff53e9615d76040d29c0650542be3b09ee80aca2f2cc61f6'
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
