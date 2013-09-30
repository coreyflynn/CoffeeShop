# copy script to configure MATLAB's MCR
file { "/usr/bin/configure_mcr":
	ensure => present,
	owner => 'root',
	group => 'root',
	mode => '0755',
	source => 'file:///vagrant/res/matlib/configure_mcr.sh',
}

# run script to configure fish
exec { "configure_mcr":
	command => "/usr/bin/configure_mcr",
	require => File["/usr/bin/configure_mcr"]
	#refreshonly => true,
}