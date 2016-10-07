# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
#  config.vm.box = "ubuntu/trusty64"
  config.vm.box = "bento/centos-7.2"
  # If you run into issues with Ansible complaining about executable permissions,
  # comment the following statement and uncomment the next one.
  config.vm.synced_folder ".", "/vagrant"
  # config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
  config.vm.define :reg, primary: true do |reg|
#    reg.vm.network :forwarded_port, host: 8080, guest: 8080
#    reg.vm.network :forwarded_port, host: 5000, guest: 5000
#    reg.vm.network :forwarded_port, host: 2201, guest: 22, id: "ssh", auto_correct: true
#    reg.vm.network "private_network", ip: "192.168.50.91"
    reg.vm.network "public_network", bridge: "eno4", ip: "192.168.57.29", auto_config: "false", netmask: "255.255.255.0" , gateway: "192.168.57.1"
    reg.vm.provision "shell", path: "bootstrap.sh"
    reg.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/reg.yml -c local -v'
    reg.vm.hostname = "reg"
  end
  
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
