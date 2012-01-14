Vagrant::Config.run do |config|
  config.vm.define :db1 do |db1_config|
    db1_config.vm.box = "lucid64"
    db1_config.vm.network("192.168.200.1")
  end

  config.vm.define :db2 do |db2_config|
    db2_config.vm.box = "lucid64"
    db2_config.vm.network("192.168.200.2")
  end

  config.vm.define :db3 do |db3_config|
    db3_config.vm.box = "lucid64"
    db3_config.vm.network("192.168.200.3")
  end

end


