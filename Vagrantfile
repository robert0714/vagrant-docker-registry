# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  else
    config.vm.synced_folder ".", "/vagrant"
  end
  config.vm.define "reg"  do |reg|
   reg.vm.box = "bento/centos-7.3"
#    reg.vm.hostname = "reg"
#    reg.vm.network :forwarded_port, host: 8080, guest: 8080
#    reg.vm.network :forwarded_port, host: 5000, guest: 5000
#    reg.vm.network :forwarded_port, host: 2201, guest: 22, id: "ssh", auto_correct: true
#    reg.vm.network "private_network", ip: "192.168.50.91"
    reg.vm.network "public_network", bridge: "eno4", ip: "192.168.57.29", netmask: "255.255.255.0" , gateway: "192.168.57.1"
    reg.vm.provision "shell", path: "bootstrap.sh"
    reg.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/reg.yml -c local -v'
    reg.vm.provision :shell , inline: "systemctl restart network"
    reg.vm.hostname = "reg"
    reg.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
   if Vagrant.has_plugin?("vagrant-vbguest")
     config.vbguest.auto_update = false
     config.vbguest.no_install = true
     config.vbguest.no_remote = true
   end
end
