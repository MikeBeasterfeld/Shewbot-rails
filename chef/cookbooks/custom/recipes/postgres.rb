
execute "create vagrant user" do
	user "postgres"
  command "psql -c \"CREATE USER vagrant WITH PASSWORD 'vagrant' CREATEDB\""
  ignore_failure true
end

execute "create vagrant user" do
	user "postgres"
  command "createdb -O vagrant shewbot"
  ignore_failure true
end
