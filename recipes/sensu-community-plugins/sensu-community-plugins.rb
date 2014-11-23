class SensuCommunityPlugins < FPM::Cookery::Recipe
  description 'Sensu community plugins'

  name 'sensu-community-plugins'
  version '0.0.1'

  source 'https://github.com/sensu/sensu-community-plugins', \
         :with => :git, \
         :hash => '2fcc571aea829bcb29f78b0f43d8dfce9861edbb'

  build_depends 'libmysqlclient-dev', 'libpq-dev'

  def build
    %w(sensu-plugin mysql:2.9.1 mysql2:0.3.16 pg:0.17.1 redis:3.1.0
       mongo:1.11.1 bson_ext:1.11.1 rest-client:1.7.2 redphone:0.0.6
       ruby-supervisor:0.0.2 aws-sdk:1.53.0 docker:0.0.1
       crack:0.4.2 carrot-top:0.0.7
       net-ping:1.7.4 inifile:3.0.0 hipchat:1.3.0).each do |gem|
      gem_install gem
    end
  end

  def install
    # Provide 'safe' binaries in /opt/<package>/bin like Vagrant does
    rm_rf "#{destdir}/../bin"
    destdir('../bin').mkdir
    destdir('../bin').install workdir('../../shared/omnibus.bin'), 'ruby'
    root('opt/sensu-community-plugins').install builddir('sensu-community-plugins-HEAD/extensions')
    root('opt/sensu-community-plugins').install builddir('sensu-community-plugins-HEAD/handlers')
    root('opt/sensu-community-plugins').install builddir('sensu-community-plugins-HEAD/mutators')
    root('opt/sensu-community-plugins').install builddir('sensu-community-plugins-HEAD/plugins')
  end

  private

  def gem_install(name, version = nil)
    environment.with_clean {
      v = version.nil? ? '' : "-v #{version}"
      safesystem "#{destdir}/bin/gem install --no-ri --no-rdoc #{v} #{name}"
    }
  end
end
