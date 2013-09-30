import 'python-stack'
import 'fish'
import 'matlab'

# apt-get update
exec { "apt-get update":
  path => "/usr/bin",
  # refreshonly => true
}

#git
package { "git":
	ensure => present,
	require => Exec["apt-get update"]
}