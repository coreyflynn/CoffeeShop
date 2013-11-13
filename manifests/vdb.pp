# copy matlib files
file { "/xchip":
    ensure => "directory",
    owner  => "root",
    group  => "root",
    mode   => "0755",
}

file { "/xchip/cogs":
    ensure => "directory",
    owner  => "root",
    group  => "root",
    mode   => "0755",
    require => File["/xchip"]
}

file { "/xchip/cogs/data":
    ensure => "directory",
    owner  => "root",
    group  => "root",
    mode   => "0755",
    require => File["/xchip/cogs"]
}

file { "/xchip/cogs/data/vdb":
    ensure => "directory",
    owner  => "root",
    group  => "root",
    mode   => "0755",
    require => File["/xchip/cogs/data"]
}

file { "/xchip/cogs/data/vdb/mongo":
    ensure => "directory",
    owner  => "root",
    group  => "root",
    mode   => "0755",
    require => File["/xchip/cogs/data/vdb"]
}

file { '/xchip/cogs/data/vdb/mongo/default_fields.gmt':
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'file:///vagrant/res/vdb/default_fields.gmt',
    require => File["/xchip/cogs/data/vdb/mongo"]
}
