class casmr::revert_ruby {
#include casmr::get_casmr_rpms, casmr::install_casmr
package { "ruby-1.8.7.p72-5.24.2.x86_64":
        ensure => installed,
        provider => 'rpm',
        source => "/tmp/rpms/ruby-1.8.7.p72-5.24.2.x86_64.rpm",
        }

exec { "update_alternatives":
    command => "/usr/sbin/update-alternatives --install /usr/bin/ruby.latest ruby /usr/bin/ruby 0",
    unless => "/usr/bin/test -h /usr/local/bin/ruby",
}

exec { "mv_new":
    command => "/bin/mv /usr/local/bin/ruby /usr/local/bin/ruby.2.0",
    onlyif => "/usr/bin/test -f /usr/local/bin/ruby.2.0",
    unless => "/usr/bin/test -h /usr/bin/ruby",
}

exec { "link_old":
    command => "/bin/ln -s /usr/bin/ruby /usr/local/bin/ruby",
    onlyif => "/usr/bin/test -f /usr/bin/ruby",
    unless => "/usr/bin/test -h /usr/local/bin/ruby",
}

}
