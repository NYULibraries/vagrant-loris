# -*- mode: ruby -*-
# vi: set ft=ruby :
#

Vagrant.require_version ">= 2.0.1"

HOST_NAME = "loris"
MANIFEST = "#{HOST_NAME}"
CPUS = "1"
MEMORY = "1024"
MULTIVOL = false
MOUNTPOINT = "/mnt"
ENVIRONMENT = "development"
PUPPET = "4.10.8"
VAGRANTDIR = File.expand_path(File.dirname(__FILE__))
VAGRANTFILE_API_VERSION = "2"
DATADIR = "#{VAGRANTDIR}/puppetlabs/code/environments/#{ENVIRONMENT}/data"

# Load the required vagrant plugins.
required_plugins = %w( vagrant-vbguest vagrant-puppet-install vagrant-r10k vagrant-scp vagrant-share vagrant-persistent-storage  )
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin};vagrant #{ARGV.join(" ")}" unless Vagrant.has_plugin? plugin || ARGV[0] == 'plugin'
end

# Link to the puppet environments data directory so we don't have 
# to go digging around for it.
unless FileTest.symlink?("#{VAGRANTDIR}/hieradata")
  File.symlink "#{DATADIR}", "#{VAGRANTDIR}/hieradata"
end

#unless FileTest.directory?("puppetlabs/code")
#  system('git submodule update --init --recursive')
#  Dir.chdir('puppetlabs'){
#    system('pwd')
#    #system('/usr/local/bin/r10k deploy environment development -p -v -c r10k/r10k-public.yaml')
#    system('r10k deploy environment development -p -v -c r10k/r10k-public.yaml')
#  }
#end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Disable insecure key replacement
  config.ssh.insert_key = false
  # Use your id_rsa key from !/.ssh
  config.ssh.private_key_path = [ '~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa' ]
  config.vm.box = "NYULibraries/centos_7_3_1611"

  config.vm.network "private_network", ip: "192.168.50.49",
    virtualbox__hostonly: true
  config.vm.network "forwarded_port", guest:  80, host: 9080,
      virtualbox__hostonly: true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    # ref for multiple cpu support
    # https://github.com/rdsubhas/vagrant-faster/issues/5
    vb.cpus = CPUS
    if CPUS != "1"
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
    end
    vb.memory = MEMORY
    vb.name = HOST_NAME
    vb.linked_clone = true if Vagrant::VERSION =~ /^1.8/
  end
  
  config.vm.hostname = HOST_NAME + ".local"
  config.vm.synced_folder ".", "/vagrant"

  if MULTIVOL == true
    # Create second volume
    config.vm.provision "shell", inline: "mkdir -p #{MOUNTPOINT}"
    #config.vm.provision "shell", inline: "mkdir -p /mnt"
    config.persistent_storage.enabled = true
    config.persistent_storage.use_lvm = false
    config.persistent_storage.diskdevice = '/dev/sdb'
    config.persistent_storage.location = "./untracked-files/#{HOST_NAME}-vol2.vdi"
    config.persistent_storage.size = 10240
    config.persistent_storage.mountname = 'vol2'
    config.persistent_storage.filesystem = 'ext4'
    config.persistent_storage.mountpoint = MOUNTPOINT 
    config.vm.provision "shell", inline: "mount -a"
  end
  

  config.vm.provision "shell", path: "bin/init-puppet-centos7.sh"
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"

  config.r10k.puppet_dir = "puppetlabs/code/environments/#{ENVIRONMENT}"
  config.r10k.puppetfile_path = "puppetlabs/code/environments/#{ENVIRONMENT}/Puppetfile"
  config.r10k.module_path = "puppetlabs/code/environments/#{ENVIRONMENT}/modules/thirdparty"

  # Plugin to force vagrant to use a spcecific version of puppet
  config.puppet_install.puppet_version = "#{PUPPET}"
  config.vm.provision "puppet" do |puppet|
      puppet.hiera_config_path = 'puppetlabs/puppet/hiera.yaml'
      #puppet.hiera_config_path = 'puppetlabs/code/environments/development//hiera.yaml'
      puppet.environment_path = "puppetlabs/code/environments"
      puppet.environment = "#{ENVIRONMENT}"
      puppet.manifests_path = "puppetlabs/code/environments/#{ENVIRONMENT}/manifests"
      puppet.manifest_file = "#{MANIFEST}.pp"
      puppet.module_path = ["puppetlabs/code/modules", "puppetlabs/code/environments/#{ENVIRONMENT}/modules/site", "puppetlabs/code/environments/#{ENVIRONMENT}/modules/local", "puppetlabs/code/environments/#{ENVIRONMENT}/modules/thirdparty"]
      # Working directory needs to be set because vagrant does not
      # calculate path relative to the environment
      puppet.working_directory = "/tmp/vagrant-puppet/environments/#{ENVIRONMENT}"         
      puppet.options = [
                       "--verbose",
                       #"--debug",
                       "--trace",
                       "--strict_variables",
                       #"--hiera_config /vagrant/puppetlabs/puppet/hiera.yaml"
                       ] 
  end

end
