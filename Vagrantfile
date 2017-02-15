# -*- mode: ruby -*-
# vi: set ft=ruby :
#

HOST_NAME = "loris"
ENVIRONMENT = "development"

Vagrant.configure(2) do |config|
  # Disable insecure key replacement
  config.ssh.insert_key = false
  # Use your id_rsa key from !/.ssh
  config.ssh.private_key_path = [ '~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa' ]
  config.vm.box = "flannon/centos_7_min"
  #config.vm.box = "Centos7-1611-2"
  config.vm.provider "virtualbox" do |vb|
    #vb.memory = "2048"
    #vb.name = HOST_NAME
    vb.linked_clone = true if Vagrant::VERSION =~ /^1.8/
  end
  config.vm.network "private_network", type: "dhcp",
  #config.vm.network "private_network", ip: "192.168.50.4",
      virtualbox__hostonly: true
  config.vm.network "forwarded_port", guest:  80, host: 9080,
    auto_correct: true
  config.vm.network "forwarded_port", guest:  8005, host: 8005,
    auto_correct: true
  config.vm.network "forwarded_port", guest:  8983, host: 8983,
    auto_correct: true
  config.vm.hostname = HOST_NAME + ".local"
  config.vm.synced_folder ".", "/vagrant"
  #config.vm.synced_folder "./", "/vagrant", type: "nfs"
  #config.vm.synced_folder "./", "/vagrant", disabled: true
  #config.vm.synced_folder "./", "/vagrant-" + HOST_NAME, id: "vagrant-" + HOST_NAME
  config.vm.provision "shell", path: "bin/init-puppet-centos7.sh"
  config.vm.provision "shell", path: "bin/init-venv.sh"
  config.vm.provision "shell", path: "bin/load-mpapis-sig.sh"
  #config.vm.provision "file", source: "../../../puppet/", destination: "/etc/puppetlabs/puppet/"
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"

  config.r10k.puppet_dir = "puppet/environments/#{ENVIRONMENT}"
  config.r10k.puppetfile_path = "puppet/environments/#{ENVIRONMENT}/Puppetfile"
  config.r10k.module_path = "puppet/environments/#{ENVIRONMENT}/modules/thirdparty"

  config.vm.provision "puppet" do |puppet|
#  config.vm.provision :puppet do |puppet|
      ##puppet.options = '--verbose --debug'
      puppet.hiera_config_path = 'puppet/hiera.yaml'
      puppet.environment = "#{ENVIRONMENT}"
      puppet.environment_path = "puppet/environments"
      
      # Working directory needs to be set because vagrant does not
      # calculate path relative to the environment
      puppet.working_directory = "/tmp/vagrant-puppet/environments/#{ENVIRONMENT}"         
  end
  #config.vm.provision "shell", path: "bin/load-ssh-keys.sh"
  #config.vm.provision "shell", path: "bin/load-aws-credentials.sh"
  ###config.vm.provision "shell", path: "bin/update-git.sh"

end
