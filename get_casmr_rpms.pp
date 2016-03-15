class casmr::get_casmr_rpms {
file { "/tmp/rpms":
        path => "/tmp/rpms",
        ensure => directory,
        source => "puppet:///cas/cas/",
        recurse => true,
        }
}
