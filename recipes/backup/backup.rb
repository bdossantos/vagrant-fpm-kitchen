class PuppetGem < FPM::Cookery::Recipe
  description 'Backup Gem'

  name 'backup'
  version '4.1.8'

  source 'nothing', :with => :noop

  def build
    gem_install name, version
  end

  def install
    # Provide 'safe' binaries in /opt/<package>/bin like Vagrant does
    rm_rf "#{destdir}/../bin"
    destdir('../bin').mkdir
    destdir('../bin').install workdir('../../shared/omnibus.bin'), 'backup'
  end

  private

  def gem_install(name, version = nil)
    v = version.nil? ? '' : "-v #{version}"
    cleanenv_safesystem "#{destdir}/bin/gem install --no-ri --no-rdoc #{v} #{name}"
  end
end
