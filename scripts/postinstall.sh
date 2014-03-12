# Final touches!

mkdir -p /usr/local/util
cp -r /vagrant/util/pvm /usr/local/util 
chown -R vagrant:vagrant /usr/local/util/pvm

printf "%s\n" "source /usr/local/util/pvm/pvm.sh" >> /home/vagrant/.bashrc

exit