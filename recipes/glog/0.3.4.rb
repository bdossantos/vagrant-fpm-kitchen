class Glog < FPM::Cookery::Recipe
  description 'C++ implementation of the Google logging module'

  name 'glog'
  version '0.3.4'
  homepage 'https://github.com/google/glog'
  source "https://github.com/google/glog/archive/v#{version}.tar.gz"
  sha1 '69f91cd5a1de35ead0bc4103ea87294b0206a456'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
