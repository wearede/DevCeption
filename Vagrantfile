# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # https://docs.vagrantup.com.

  config.vm.box = "bento/centos-7.6"
  config.vm.define "DevCeption"
  config.vm.network "private_network", ip: "192.168.33.33"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provision "shell", inline: "mkdir /srv/www /srv/docker && chown -R vagrant:vagrant /srv/*"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.cpus = 2
    vb.gui = false
    vb.customize ["modifyvm", :id, "--vrde", "off"]
    vb.customize ["modifyvm", :id, "--audio", "none"]
  end

  # config.push.define "atlas" do |push|
  #   push.app = "wearede/devception"
  # end

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "provisioning/playbook.yml"
  end
end
