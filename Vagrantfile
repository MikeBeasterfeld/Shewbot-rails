Vagrant.configure("2") do |config|

  config.vm.box = "chef/ubuntu-14.04-i386"

  config.ssh.forward_agent = true
  
  config.vm.network "forwarded_port", guest: 3000, host: 3000,
    auto_correct: true

  config.vm.provision "shell", path: "chef/install_chef.bash"
    
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      "rbenv" => {
        "group_users" => [
          "vagrant"
        ]
      }
    }

    chef.cookbooks_path = ["cookbooks"]

    chef.run_list = [
      "recipe[railsstarter::default]"
    ]
  end
end
