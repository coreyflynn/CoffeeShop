#make sure unzip is installed
package { "unzip":
	ensure => present,
	require => Exec["apt-get update"]
}

#make sure bc is installed
package { "bc":
    ensure => present,
    require => Exec["apt-get update"]
}

#make sure gnuplot is installed
package { "gnuplot":
    ensure => present,
    require => Exec["apt-get update"]
}

# copy matlib files
file { "/xchip":
    ensure => "directory",
    owner  => "vagrant",
    group  => "vagrant",
    mode   => "755",
    require => Package["unzip"]
}

file { "/xchip/cogs":
    ensure => "directory",
    owner  => "vagrant",
    group  => "vagrant",
    mode   => "755",
    require => File["/xchip"]
}

exec { "copy_matlib_bin":
	command => "cp -r /vagrant/res/matlab/matlib /xchip/cogs",
	path => "/bin",
	creates => "/xchip/cogs/matlib/bin/rum",
	require => File["/xchip/cogs"]
}

#create mcr directories
file { "/xchip/cogs/matlib/mcr":
    ensure => "directory",
    owner  => "vagrant",
    group  => "vagrant",
    mode   => "755",
    require => Exec["copy_matlib_bin"]
}

file { "/home/vagrant/mcr":
    ensure => "directory",
    owner  => "vagrant",
    group  => "vagrant",
    mode   => "755",
}

# # run script to get the matlab mcr
# exec { "get_mcr":
# 	command => "wget -O /home/vagrant/mcr/MCR_R2012a_glnx86_installer.zip http://www.mathworks.com/supportfiles/MCR_Runtime/R2012a/MCR_R2012a_glnx86_installer.zip",
# 	path => "/usr/bin",
# 	creates => "/home/vagrant/mcr/MCR_R2012a_glnx86_installer.zip",
# 	require => File["/home/vagrant/mcr"]
# }

# # unzip the matlab mcr
# exec { "unzip_mcr":
# 	command => "unzip -d /home/vagrant/mcr/ /home/vagrant/mcr/MCR_R2012a_glnx86_installer.zip",
# 	path => "/usr/bin",
# 	creates => "/home/vagrant/mcr/install",
# 	require => Exec["get_mcr"]
# }

# copy install parameters to the unzipped path
file { '/home/vagrant/mcr/installer_input.txt':
	ensure => present,
	owner => 'vagrant',
	group => 'vagrant',
	mode => '755',
	source => 'file:///vagrant/res/matlab/installer_input.txt'
}

# install the mcr
exec { "make_mcr_subdir":
	command => "mkdir -p /xchip/cogs/matlib/mcr/versions/v717",
	path => "/bin",
	require => File["/home/vagrant/mcr/installer_input.txt"]
}

# exec { "install_mcr":
# 	command => "sudo sh /home/vagrant/mcr/install -inputFile /home/vagrant/mcr/installer_input.txt",
# 	path => "/usr/bin",
# 	creates => "/xchip/cogs/matlib/mcr/2012a_717/v717/license.txt",
# 	require => Exec["make_mcr_subdir"]
# }