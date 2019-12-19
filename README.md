# How to create  a multi machine vagrant environment
This is connecting both of your env together


1. Clone the starter code into your directory

2. cd into the tests and rake spec, work based off the failures.

3. Create a db folder in environment
  - create two files within this:
      - mongod.conf
      - provision.sh

4. Copy and paste from your mongod conf file and sh file into the two you have created.

5. in your vagrant file change the vagrant class
Vagrant.configure("2") do |config|
  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/xenial64"
    app.vm.network "private_network", ip: "192.168.10.100"
    app.hostsupdater.aliases = ["development.local"]
    app.vm.synced_folder "app", "/home/ubuntu/app"
    app.vm.provision "shell", path: "environment/app/provision.sh", privileged: false
  end
 - this is from the nodejs directory and is looking at the methods needed


  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip: "192.168.10.150"
    db.hostsupdater.aliases = ["database.local"]
    db.vm.synced_folder "environment/db", "/home/ubuntu/db/"
    db.vm.provision "shell", path: "environment/db/provision.sh", privileged: false
  end

  - this is from the mongodb directory, need to define where you are reading from which is db.

# Check to see if the failures are completed

# To check if app is running

go into the app file and npm install and npm start and go on to the host name to check it is running
