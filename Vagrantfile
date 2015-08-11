# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"
    
    config.vm.network :forwarded_port, guest: 80, host: 8080, autocorrect: true
    
    config.vm.provision :shell, path: "./provisioning/root.sh", privileged: true
    config.vm.provision :shell, path: "./provisioning/user.sh", privileged: false
    config.vm.provision :shell, path: "./provisioning/always.sh", privileged: true, run: "always"
end
