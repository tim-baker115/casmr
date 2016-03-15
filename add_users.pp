class casmr::add_users {
user { "postgres":
    ensure => present,
    password => '$1$szxsKziL$2I/sXeABkfA4MvwZj76rb1',
}

user { "casmr":
    ensure => present,
    password => '$1$szxsKziL$2I/sXeABkfA4MvwZj76rb1',
}

user { "cast":
    ensure => present,
    password => '$1$szxsKziL$2I/sXeABkfA4MvwZj76rb1',
}

user { "fldendr":
    ensure => present,
    password => '$1$szxsKziL$2I/sXeABkfA4MvwZj76rb1',
}

user { "acc4000d":
    ensure => present,
    password => '$1$szxsKziL$2I/sXeABkfA4MvwZj76rb1',
}

exec { "sudo_postgres":
    command => "/bin/echo 'postgres     ALL = NOPASSWD: ALL, !/bin/su, !/sbin/reboot, !/sbin/init, !/sbin/shutdown, !/sbin/halt, !/sbin/poweroff' >> /etc/sudoers",
    unless => "/usr/bin/grep -c postgres /etc/sudoers",
}

}
