

execute "install curl" do
  command "aptitude install curl -y"
  ignore_failure false
  creates '/usr/bin/curl'
end

execute "install nodejs" do
  command "aptitude install nodejs -y"
  ignore_failure false
  creates '/usr/bin/node'
end

execute "install rvm" do
  cwd "/vagrant"
  user "vagrant"
  environment ({"HOME" => "/home/vagrant"})
  command "curl -Ls https://get.rvm.io | bash -s stable"
  ignore_failure false
  creates '/home/vagrant/.rvm/bin/rvm'
end

execute "install ruby" do
	action :nothing
  cwd "/vagrant"
  user "vagrant"
  environment ({"HOME" => "/home/vagrant", "PATH" => "/home/vagrant/.rvm/bin"})
  command "rvm install 1.9.3"  
  ignore_failure false
  creates '/home/vagrant/.rvm/rubies/ruby-1.9.3-p448/bin/ruby'
end
