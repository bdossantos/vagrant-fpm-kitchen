class ImageOptimGem < FPM::Cookery::Recipe
  description 'Optimize images using multiple utilities'

  name 'image_optim'
  version '0.24.0'

  source 'nothing', :with => :noop

  def build
    gem_install name, version
    gem_install 'image_optim_pack', '0.3.0.20160812'
  end

  def install
    # Provide 'safe' binaries in /opt/<package>/bin like Vagrant does
    rm_rf "#{destdir}/../bin"
    destdir('../bin').mkdir
    destdir('../bin').install workdir('../../shared/omnibus.bin'), 'image_optim'
  end

  private

  def gem_install(name, version = nil)
    v = version.nil? ? '' : "-v #{version}"
    cleanenv_safesystem "#{destdir}/bin/gem install --no-ri --no-rdoc #{v} #{name}"
  end
end
