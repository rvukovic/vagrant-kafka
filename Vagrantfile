Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-7.2"
  config.vm.hostname = "kafka.dev"
  config.vm.provision :shell, path: "install_kafka.sh"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network :forwarded_port, guest: 9092, host: 9092

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
end
