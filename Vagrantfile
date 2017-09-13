# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  else
    config.vm.synced_folder ".", "/vagrant"
  end
  config.vm.define "reg"  do |reg|
    reg.vm.box = "ubuntu/trusty64"
    reg.vm.network "public_network", bridge: "eno4", ip: "192.168.57.29", netmask: "255.255.255.0" , gateway: "192.168.57.1"
    default_router = "192.168.57.1"
    reg.vm.provision :shell, inline: "ip route delete default 2>&1 >/dev/null || true; ip route add default via #{default_router}" 
#    reg.vm.provision :shell , inline: "sudo systemctl restart network"
    reg.vm.provision :shell, path: "bootstrap.sh"
    reg.vm.provision :shell, inline: 'PYTHONUNBUFFERED=1  ansible-playbook /vagrant/ansible/reg.yml -c local -v'    
#sudo ifup enp0s8
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
