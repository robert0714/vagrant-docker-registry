#!/bin/bash

echo "Installing Ansible  on CentOS..." 

A=`yum info ansible`

testing=`[[ $A =~ 'Ansible' ]]`

echo $testing

echo  "############# ${testing} ##############"
timedatectl set-timezone Asia/Taipei

 
if [[ $testing != ""  ]]; then
     echo "Ansible is already installed."
else
      echo "Ansible is not installed."
      yum install -y wget
      wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
      rpm -ivh  epel-release-7-8.noarch.rpm
      rm -rf epel-release-7-8.noarch.rpm
      
fi

yum  install -y ansible


cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg

yum update -y
