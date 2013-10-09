
rvm install ruby-1.9.3

rvm use 1.9.3

echo 'install: --no-rdoc --no-ri' >> ~/.gemrc
echo 'update: --no-rdoc --no-ri' >> ~/.gemrc

bundle install

