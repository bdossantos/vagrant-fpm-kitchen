class NodeJS < FPM::Cookery::Recipe
  description 'Evented I/O for V8 JavaScript'

  name     'nodejs'
  version  '0.10.26'
  revision 0
  homepage 'http://nodejs.org/'
  source   "http://nodejs.org/dist/v#{version}/node-v#{version}.tar.gz"
  sha256   'ef5e4ea6f2689ed7f781355012b942a2347e0299da0804a58de8e6281c4b1daa'
  section  'interpreters'

  build_depends 'libssl-dev', 'g++', 'python'
  depends       'openssl'

  def build
    configure
    make
  end

  def install
    make :install
    man1.install Dir['local/share/man/man1/node.1']
    system 'gzip', '/usr/local/share/man/man1/node.1'
  end
end
