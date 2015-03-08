# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'wheezy64'

  config.vm.provision 'puppet' do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'requirements.pp'
  end

  recipe = ENV['RECIPE'].nil? ? nil : "recipe=#{ENV['RECIPE']}"
  config.vm.provision 'shell', inline: 'cd /vagrant && ' \
                                       'bundle install  && ' \
                                       "rake build #{recipe}"
end
