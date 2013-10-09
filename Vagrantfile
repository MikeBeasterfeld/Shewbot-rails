# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.ssh.forward_agent = true

  config.vm.network :forwarded_port, guest: 3000, host: 3001

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["chef/cookbooks"]
    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "postgresql"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "custom::rvm"
    chef.add_recipe "custom::postgres"
    chef.json = {
      "postgresql" => {
        "password" => {
          "postgres" => "thiswilldofornow",
        }
      }
    }
  end

end
