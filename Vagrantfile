Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.network "forwarded_port", guest: "3000", host: "3000"
  config.vm.synced_folder 'c:\Vagrant\flashcards_advanced', '/flashcards_advanced/'
end
