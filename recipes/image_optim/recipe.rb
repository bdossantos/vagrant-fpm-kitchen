class ImageOptimOmnibus < FPM::Cookery::Recipe
  description 'Optimize images using multiple utilities'

  name 'image_optim'
  version '1:0.24.0'
  revision 0
  homepage 'https://github.com/toy/image_optim'

  vendor 'fpm'
  maintainer '<root@bds.io>'

  section 'Utilities'

  source '', with: :noop

  omnibus_package true
  omnibus_dir "/opt/#{name}"
  omnibus_recipes '../ruby/2.3',
                  'image_optim'

  def build
  end

  def install
  end
end
