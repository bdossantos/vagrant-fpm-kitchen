class BackupOmnibus < FPM::Cookery::Recipe
  description 'Provide an elegant DSL in Ruby for performing backups on UNIX-like systems.'

  name 'backup'
  version '1:4.2.2'
  revision 0
  homepage 'https://github.com/meskyanichi/backup'

  vendor 'fpm'
  maintainer '<root@bds.io>'

  section 'Utilities'

  source '', with: :noop

  omnibus_package true
  omnibus_dir "/opt/#{name}"
  omnibus_recipes '../ruby/2.2',
                  'backup'

  def build
  end

  def install
  end
end
