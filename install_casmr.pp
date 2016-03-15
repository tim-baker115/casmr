class casmr::install_casmr {
include casmr::get_casmr_rpms, casmr::install_casmr
package { "compat-libldap-2_3-0-2.3.37-6.1.i586":
        ensure => installed,
        provider => 'rpm',
        source => "/tmp/rpms/compat-libldap-2_3-0-2.3.37-6.1.i586.rpm",
        }
package { "cas-firewall-3.1.0-170.noarch":
        ensure => installed,
        provider => 'rpm',
        source => "/tmp/rpms/cas-firewall-3.1.0-170.noarch.rpm",
        }
package { "flash-plugin-10.2.152.26-2.1.i586":
        ensure => installed,
        provider => 'rpm',
        source => "/tmp/rpms/flash-plugin-10.2.152.26-2.1.i586.rpm",
        }
package { "openldap2-compat-2.3.43-6.1":
        ensure => installed,
        provider => 'rpm',
        source => "/tmp/rpms/openldap2-compat-2.3.43-6.1.src.rpm",
	require => Package["compat-libldap-2_3-0-2.3.37-6.1.i586"],
	}
package { "openJDK-1.6.0_20a-fcs.x86_64":
        ensure => installed,
        provider => 'rpm',
        source => "/tmp/rpms/openJDK-1.6.0_20a-fcs.x86_64.rpm",
        }
package { "postgres-disk-space-reclamation-3.1.0-170.noarch":
        ensure => installed,
        provider => 'rpm',
        source => "/tmp/rpms/postgres-disk-space-reclamation-3.1.0-170.noarch.rpm",
        require => Package["compat-libldap-2_3-0-2.3.37-6.1.i586"],
        }
package { "postgresql-9.0.4-2.x86_64":
        ensure => installed,
        provider => 'rpm',
        source => "/tmp/rpms/postgresql-9.0.4-2.x86_64.rpm",
        require => Package["postgres-disk-space-reclamation-3.1.0-170.noarch"],
        }
package { "casmr-core-7.3.0-470.noarch":
        ensure => installed,
        provider => 'rpm',
        source => "/tmp/rpms/casmr-core-7.3.0-470.noarch.rpm",
        require => Package["cas-firewall-3.1.0-170.noarch"],
        }
package { "ccad-firebird-cast-assembly-7.0.4-2965.noarch":
        ensure => installed,
        provider => 'rpm',
        source => "/tmp/rpms/ccad-firebird-cast-assembly-7.0.4-2965.noarch.rpm",
        require => Package["casmr-core-7.3.0-470.noarch"],
        }

}
