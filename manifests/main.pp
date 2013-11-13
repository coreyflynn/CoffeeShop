import 'python-stack'
import 'fish'
import vb
# import 'matlab'

# apt-get update
exec { "apt-get update":
  path => "/usr/bin",
}

#git
package { "git":
	ensure => present,
	require => Exec["apt-get update"]
}