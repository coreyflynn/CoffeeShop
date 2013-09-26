# apt-get update
exec { "apt-get update":
  path => "/usr/bin",
  # refreshonly => true
}

# get fish
exec { "get_fish":
	command => "wget http://fishshell.com/files/2.0.0/linux/Ubuntu_12.04/i586/fish_2.0.0-201305151006_i386.deb",
	path => "/usr/bin",
	#path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
	# refreshonly => true,
}

# install fish
exec { "install_fish":
	command => "sudo dpkg -i fish_2.0.0-201305151006_i386.deb",
	path => "/usr/bin",
	#path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
	# refreshonly => true,
	require => Exec["get_fish"]
}

# default script to configure fish
file { '/usr/bin/configure_fish':
ensure => present,
owner => 'root',
group => 'root',
mode => '0755',
source => 'file:///vagrant/res/fish/configure_fish.sh',
require => Exec["install_fish"]
}

# numpy
package { "python-numpy":
	ensure => present,
	require => Exec["apt-get update"]
}

# scipy
package { "python-scipy":
	ensure => present,
	require => Package["python-numpy"]
}

#matplotlib
package { "python-matplotlib":
	ensure => present,
	require => Package["python-numpy"]
}

#networkx
package { "python-networkx":
	ensure => present,
	require => Package["python-numpy"]
}

#pandas
package { "python-pandas":
	ensure => present,
	require => Package["python-numpy"]
}

#pytables
package { "python-tables":
	ensure => present,
	require => Package["python-scipy"]
}

#ipython
package { "python-pymongo":
	ensure => present,
	require => Exec["apt-get update"]
}

#ipython
package { "ipython":
	ensure => present,
	require => Exec["apt-get update"]
}

#git
package { "git":
	ensure => present,
	require => Exec["apt-get update"]
}

#pip
package { "python-pip":
	ensure => installed,
	require => Exec["apt-get update"]
}

# pip blessings
exec { "pip install blessings":
  path => "/usr/bin"
}
