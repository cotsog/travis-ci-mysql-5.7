if [ ! -f mysql-5.7-packages/mysql-server_5.7.21-1ubuntu14.04_amd64.deb-bundle.tar ]
then
  mkdir mysql-5.7-packages || true
  wget -P ./mysql-5.7-packages https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-server_5.7.21-1ubuntu14.04_amd64.deb-bundle.tar
fi
 
sudo apt-get purge mysql-client-5.6 mysql-client-core-5.6 mysql-common mysql-common-5.6 mysql-server-5.6 mysql-server-core-5.6 mysql-client mysql-server
sudo apt-get autoremove
sudo apt-get autoclean
 
pushd mysql-5.7-packages
tar -xvf mysql-server_5.7.21-1ubuntu14.04_amd64.deb-bundle.tar
sudo apt-get install libmecab2 libaio1
sudo dpkg-preconfigure mysql-community-server_*.deb
sudo dpkg -i mysql-{common,community-client,client,community-server,server}_*.deb
rm *.deb
popd
