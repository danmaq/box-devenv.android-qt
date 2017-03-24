# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "https://atlas.hashicorp.com/opensuse/boxes/openSUSE-42.1-x86_64/versions/1.0.1/providers/virtualbox.box"
  config.vm.provider "virtualbox" do |vb|
    vb.name = "Android devenv using Qt"
    vb.gui = true
    vb.linked_clone = true
    vb.memory = "1536"
    # Windows / macOS の場合、サウンドを有効にする
    if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
      vb.customize [
        "modifyvm", :id,
        "--audio", "dsound",
        "--audiocontroller", "ac97"
      ]
    elsif (/darwin/ =~ RUBY_PLATFORM) != nil
      vb.customize [
        "modifyvm", :id,
        "--audio", "coreaudio",
        "--audiocontroller", "ac97"
      ]
    end
  end
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.limit = 'all'
    ansible.verbose = false
    ansible.install = true
  end
end
