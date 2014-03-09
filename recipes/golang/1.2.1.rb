class Golang < FPM::Cookery::Recipe
  description 'Go is an open source programming language that makes it easy
              to build simple, reliable, and efficient software.'

  name 'go'
  version '1.2.1'
  homepage 'http://golang.org/'
  source "http://go.googlecode.com/files/go#{version}.linux-amd64.tar.gz"
  sha1 '7605f577ff6ac2d608a3a4e829b255ae2ebc8dcf'

  config_files '/etc/profile.d/go.sh'

  conflicts 'golang', 'golang-go', 'golang-src', 'golang-doc'
  replaces 'golang', 'golang-go', 'golang-src', 'golang-doc'

  def build
  end

  def install
    root('usr/local').install builddir('go')
    share('gocode/src').mkpath
    share('gocode/bin').mkpath
    share('gocode/pkg').mkpath
    etc('profile.d').install workdir('go.profile'), 'go.sh'
  end
end
