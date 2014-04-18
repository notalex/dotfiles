# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #config.vm.synced_folder "#{ ENV['HOME']  }/.ssh", "/home/vagrant/.ssh"
  config.vm.box = "precise64"
  config.vm.box_url = "Downloads/precise-server-cloudimg-amd64-vagrant-disk1.box"
  #config.vm.network :forwarded_port, guest: 3000, host: 3000
end
