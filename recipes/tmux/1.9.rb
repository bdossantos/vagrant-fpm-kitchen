class Tmux < FPM::Cookery::Recipe
  description 'tmux is a terminal multiplexer'

  name     'tmux'
  version  '1.9a'
  homepage 'http://tmux.sourceforge.net/'
  source   "http://downloads.sourceforge.net/tmux/tmux-#{version}.tar.gz"
  sha1     '815264268e63c6c85fe8784e06a840883fcfc6a2'

  conflicts 'tmux'
  replaces  'tmux'

  build_depends 'autoconf', 'libevent-dev', 'libncurses5-dev'
  depends 'libevent-2.0-5', 'libncurses5'

  def build
    configure prefix: prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
