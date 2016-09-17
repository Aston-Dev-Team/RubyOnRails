# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

  config.vm.box = "ubuntu/xenial64"
  config.vm.box_version = "20160914.0.0"
  config.vm.hostname = "vagrant"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end

  config.vm.provider "virtualbox" do |v|
    v.memory = 3072
    v.gui = true
    v.customize ["modifyvm", :id, "--natdnspassdomain1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    #v.customize ["modifyvm", :id, "--nic2", "natnetwork", "--nat-network2", "test", "--nictype2", "virtio"]
  end

  #config.ssh.insert_key = false

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "scripts/", "/home/ubuntu/scripts/", create: true
  config.vm.synced_folder "apps/", "/home/ubuntu/apps/", create: true

  # Add scripts to run after vagrant up. You can force them to run by typing vagrant provision
  config.vm.provision :shell, path: "scripts/add-host.sh", privileged: false
  config.vm.provision :shell, path: "scripts/bootstrap.sh"

  config.vm.define "test", primary: true do |test|
    config.vm.provision :shell, path: "scripts/testapp.sh", privileged: false
  end

  config.vm.define "blog", autostart: false do |blog|
    config.vm.provision :shell, path: "apps/RubyOnRails/bootstrap.sh", privileged: false
  end
end
