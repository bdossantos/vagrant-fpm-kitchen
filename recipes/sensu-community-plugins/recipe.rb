class SensuOmnibus < FPM::Cookery::Recipe
  description 'Sensu community plugins for checks, handlers, & mutators.'

  name 'sensu-community-plugins'
  version '0.0.1'
  revision 0
  homepage 'https://github.com/sensu/sensu-community-plugins'

  vendor 'fpm'
  maintainer '<root@bds.io>'

  section 'Utilities'

  source '', with: :noop

  omnibus_package true
  omnibus_dir "/opt/#{name}"
  omnibus_recipes '../ruby/2.1',
                  'sensu-community-plugins'

  def build
  end

  def install
  end
end
