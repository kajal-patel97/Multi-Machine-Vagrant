wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -

#gets the source
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

sudo apt-get update -y
sudo apt-get upgrade -y



# sudo apt-get install mongodb-org=3.2.20 -y
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

sudo rm /etc/mongod.conf

#updates it with the system path to the vm path
  # the ln makes the links between files
  # -s overites the suffix file
sudo ln -s /home/ubuntu/environment/db/mongod.conf /etc/mongod.conf

#updates the changes made
sudo systemctl restart mongod
sudo systemctl enable mongod
