# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "serverh-vagrant"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  config.vm.box_url = "file:///home/cmartin/Code/serverh/package.box"

  config.vm.network "private_network", ip: "192.168.56.102"

  config.vm.synced_folder "#{ENV['HOME']}/projects", "/deploy/projects"
  config.vm.synced_folder "projectsFiles/sites-available", "/etc/apache2/sites-available"

  config.vm.provider "virtualbox" do |vb|
    # Don't boot with headless mode
    vb.gui = false

    vb.memory = 1024
    vb.cpus = 1
  end

  # Flag to update repositories
  if File.exist?("apt_update.flag") then
    config.vm.provision :shell,
                        inline: "apt-get update"
  end

  # Provision
  config.vm.provision "chef_solo" do |chef|
    chef.install = false
    chef.roles_path = "roles"
    chef.add_role "base"
    chef.add_role "web"

    # Projects configurations
    chef.json = { "apache" => {"sitesAvailable" => ["010-callepuzzle",
                                                    "011-callepuzzle"
                                                   ],
                              }
                }
  end

end
