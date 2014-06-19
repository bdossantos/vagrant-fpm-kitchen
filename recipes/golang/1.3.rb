class Golang < FPM::Cookery::Recipe
  description 'Go is an open source programming language that makes it easy
              to build simple, reliable, and efficient software.'

  name 'go'
  version '1.3'
  homepage 'http://golang.org/'
  source "http://golang.org/dl/go#{version}.linux-amd64.tar.gz"
  sha1 'b6b154933039987056ac307e20c25fa508a06ba6'

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
