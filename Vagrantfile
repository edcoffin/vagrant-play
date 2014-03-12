# -*- mode: ruby -*-
# vi: set ft=ruby :

#NOTE:
# Librarian-Chef-No-Chef vagrant plugin must be installed:
# % vagrant plugin install vagrant-librarian-chef-nochef
 
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  
  # http
  config.vm.network :forwarded_port, guest: 80, host: 8000
  # play
  config.vm.network :forwarded_port, guest: 9000, host: 9001
  # postgres
  config.vm.network :forwarded_port, guest: 5432, host: 9002
  # mongo
  config.vm.network :forwarded_port, guest: 27017, host: 9003

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true
  
  config.vm.synced_folder "./log", "/vagrant_log"
  config.vm.synced_folder "./projects", "/projects"

  
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # upgrade the chef install that comes on the base box
  config.vm.provision :shell, :inline => "gem install chef --version 11.4.2 --no-rdoc --no-ri --conservative"
  
  config.librarian_chef.cheffile_dir = "chef"
    
  config.vm.provision :chef_solo do |chef|

    chef.cookbooks_path = "chef/cookbooks"
    
    # Arguments for Chef recipes
    chef.json = {
  
      "java" => {
        'jdk_version' => '7',
        'openjdk_packages' => ["openjdk-7-jdk"]
      },
      "postgresql" => {
        'version' => '9.3',
        'password' => {
          'postgres' => 'postgres'
        },
        'config' => {
          'ssl' => false,
          'listen_addresses' => '*'
        }
      }
    }

    #chef.add_recipe "apt::default"
    chef.add_recipe "git"
    #chef.add_recipe "java::default"
    #chef.add_recipe "postgresql" 
    #chef.add_recipe "postgresql::server"  
    #chef.add_recipe "vim"  

  end
    
  config.vm.provision "shell", path: "scripts/postinstall.sh"
    
  
  end