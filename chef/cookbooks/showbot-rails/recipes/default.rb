ruby_version = "1.9.3-p484"

include_recipe "nodejs::default"
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"
include_recipe "postgresql::server"

package "libsqlite3-dev"

include_recipe "sqlite::default"

rbenv_ruby ruby_version do
  global true
end

rbenv_gem "bundler" do
  ruby_version ruby_version
end

rbenv_execute "run" do
  command "bundle install"
  cwd "/vagrant"
  ruby_version ruby_version
end

execute "bundle install" do
  user "root"
  command "bundle install"
  cwd "/vagrant"
end

link "/home/vagrant/.bashrc" do
  to "/vagrant/config/bashrc"
end

# execute "create vagrant user" do
#   user "postgres"
#   command "psql -c \"CREATE USER vagrant WITH PASSWORD 'vagrant' CREATEDB\""
#   ignore_failure true
# end

# execute "create vagrant database" do
#   user "postgres"
#   command "createdb -O vagrant shewbot"
#   ignore_failure true
# end
