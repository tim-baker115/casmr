class casmr::start_applications {

exec { "start_postgres":
	command => "/bin/echo -ne 'ippv4000\n' | /etc/init.d/postgresql start",
	user => "postgres",
	returns => [0, 1],
	unless => "/usr/bin/lsof -i:5432 > /dev/null",
}

exec { "run_db_wizard":
	command => "/bin/echo -ne '1\ncasmr\nippv4000\n2\n' | /usr/local/casmr/bin/config-wizard.sh",
	user => "casmr",
	returns => [0, 1],
	require => Exec["start_postgres"],
	unless => "/usr/bin/test -f /usr/local/casmr/configuration/services/com.ccadllc.firebird.core.database.datasource.properties",
    }

#exec { "start_cast":
#	command => "/etc/init.d/cast start",
#	require => Exec["run_db_wizard"],
#	onlyif => "/usr/bin/test -f /etc/init.d/cast",
#	unless => "/usr/bin/lsof -i:8020 > /dev/null",
#    }
#
#exec { "start_casmr":
#	command => "/etc/init.d/casmr start",
#	require => Exec["start_cast"],
#	onlyif => "/usr/bin/test -f /etc/init.d/casmr",
#	unless => "/usr/bin/lsof -i:8010 > /dev/null",
#    }

}
