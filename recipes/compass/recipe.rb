class CompassOmnibus < FPM::Cookery::Recipe
  description 'Provide an elegant DSL in Ruby for performing backups on UNIX-like systems.'

  name 'compass'
  version '1:1.0.3'
  revision 0
  homepage 'http://compass-style.org/'

  vendor 'fpm'
  maintainer '<root@bds.io>'

  section 'Utilities'

  source '', with: :noop

  omnibus_package true
  omnibus_dir "/opt/#{name}"
  omnibus_recipes '../ruby/2.3',
                  'compass'

  def build
  end

  def install
  end
end
