Vagrant.configure(2) do |config|
    config.vm.define "master1" do |master|
        master.vm.box = "bento/ubuntu-18.04"
        master.vm.box_version = "201812.27.0"

        master.vm.provider "virtualbox" do |vb|
            vb.memory = "2048"
            vb.cpus = "2"
        end
        
        master.vm.network "private_network", ip: "192.168.255.100"
        master.vm.provision "file", source: "./config/etc.hosts", destination: "~/etc.hosts"#
        master.vm.provision "shell", path: "./config/init-on-all.sh"
        master.vm.provision "shell", path: "./config/master/init.sh"
    end

    config.vm.define "node1" do |node|
        node.vm.box = "bento/ubuntu-18.04"
        node.vm.box_version = "201812.27.0"
        
        node.vm.network "private_network", ip: "192.168.255.101"
        node.vm.provision "file", source: "./config/etc.hosts", destination: "~/etc.hosts"
        node.vm.provision "shell", path: "./config/init-on-all.sh"
        node.vm.provision "shell", path: "./config/node/init.sh"
    end

    config.vm.define "node2" do |node|
        node.vm.box = "bento/ubuntu-18.04"
        node.vm.box_version = "201812.27.0"
        
        node.vm.network "private_network", ip: "192.168.255.102"
        node.vm.provision "file", source: "./config/etc.hosts", destination: "~/etc.hosts"
        node.vm.provision "shell", path: "./config/init-on-all.sh"
        node.vm.provision "shell", path: "./config/node/init.sh"
    end
end