# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # https://docs.vagrantup.com.

  config.vm.box = "bento/centos-7.4"
  config.vm.define "DevCeption"
  config.vm.network "private_network", ip: "192.168.33.33"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "./www", "/srv/www", type: "rsync"
  config.vm.synced_folder "./configs/docker", "/srv/docker", type: "rsync"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 2
  end

  # config.push.define "atlas" do |push|
  #   push.app = "wearede/devception"
  # end

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "provisioning/playbook.yml"
  end
end
