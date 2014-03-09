# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'wheezy64'

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '512']
  end

  config.vm.provision 'puppet' do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'requirements.pp'
  end

  config.vm.provision 'shell', inline: 'cd /vagrant && ' \
                                       'bundle install  && ' \
                                       'rake build'
end
