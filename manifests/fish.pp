# get fish
exec { "get_fish":
	command => "wget http://fishshell.com/files/2.0.0/linux/Ubuntu_12.10/x86_64/fish_2.0.0-201305151006_amd64.deb",
	path => "/usr/bin",
	# refreshonly => true,
}

# install fish
exec { "install_fish":
	command => "sudo dpkg -i fish_2.0.0-201305151006_amd64.deb",
	path => "/usr/bin",
	# refreshonly => true,
	require => Exec["get_fish"]
}

# copy script to configure fish
file { "/usr/bin/configure_fish":
	ensure => present,
	owner => "vagrant",
	group => "vagrant",
	mode => "755",
	source => "file:///vagrant/res/fish/configure_fish.sh",
	require => Exec["install_fish"]
}

# run script to configure fish
exec { "configure_fish":
	command => "/usr/bin/configure_fish",
	#refreshonly => true,
}

