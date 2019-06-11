Vagrant.configure(2) do |config|
	config.vm.box = "opentable/win-2012r2-standard-amd64-nocm"
	config.vm.guest = :windows
	config.vm.boot_timeout = 300
	config.vm.communicator = "winrm"
	config.winrm.username = "vagrant"
	config.winrm.password = "vagrant"

	config.vm.provider :virtualbox do |vb|
		vb.name = "NewTrialAgain00000050-ENV"
		vb.gui = true
		vb.customize ["modifyvm", :id, "--memory", "1024"]
		vb.customize ["modifyvm", :id, "--cpus", "1"]
		vb.customize ["modifyvm", :id, "--vram", "64"]
		vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
	end

	config.vm.network "public_network" 

	config.vm.provision "shell", inline: <<-SCRIPT
		Set-Item WSMan:\\localhost\\Shell\\MaxShellsPerUser -Value 100
		Set-Item WSMan:\\localhost\\Service\\MaxConcurrentOperationsPerUser -Value 100
	SCRIPT

	config.vm.provision :shell, path: "windowsProvisioning_Part1.cmd"
	config.vm.provision :shell, path: "windowsProvisioning_Part2.cmd"
end
