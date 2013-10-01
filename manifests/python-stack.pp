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

#biopython
package { "python-biopython":
	ensure => present,
	require => Exec["apt-get update"]
}

#ipython
package { "ipython":
	ensure => present,
	require => Exec["apt-get update"]
}

#jinja
package { "python-jinja2":
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
  path => "/usr/bin",
  require => Package["python-pip"]
}