DBHOST=localhost
DBNAME=cakephp
DBUSER=dbuser
DBPASSWD=dbpassword

#install php and apache after updating
#apt-get update
apt-get install -y apache2 php5 php-pear php5-mysql php5-intl curl

#install mysql using config variables
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DBPASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DBPASSWD"

apt-get -y install mysql-server
mysql -u root -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'"
mysql -u lcori -p$DBPASSWD < /vagrant/setup/db.sql

cd /vagrant
sudo curl -s https://getcomposer.org/installer | php

rm -rf /var/www/html
sudo ln -fs /vagrant/webapp /var/www/html

sudo cp /vagrant/setup/apache.conf /etc/apache2/sites-enabled/000-default.conf
sudo a2enmod rewrite

service apache2 restart
