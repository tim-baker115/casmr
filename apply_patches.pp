#Struggled to get any of this to work due to changes being required in the database.

class casmr::apply_patches {
exec { "mk_cast_cache_dir":
    command => "/bin/mkdir -p /usr/local/cast/p2/org.eclipse.equinox.p2.engine/profileRegistry/kernel.profile/.data/.settings/",
    unless => "/usr/bin/test -d /usr/local/cast/p2/org.eclipse.equinox.p2.engine/profileRegistry/kernel.profile/.data/.settings/",
    user => "cast",
}

exec { "mk_casmr_cache_dir":
    command => "/bin/mkdir -p /usr/local/casmr/p2/org.eclipse.equinox.p2.engine/profileRegistry/kernel.profile/.data/.settings/",
    unless => "/usr/bin/test -d /usr/local/casmr/p2/org.eclipse.equinox.p2.engine/profileRegistry/kernel.profile/.data/.settings/",
    user => "casmr",
}

exec { "unzip_cast_core":
    command => "/bin/mkdir -p /usr/local/cast/repositories/casmr-core-7.3.0-repository && /usr/bin/unzip /tmp/rpms/casmr-core-7.3.0-repository.zip -d /usr/local/cast/repositories/casmr-core-7.3.0-repository",
    user => "cast",
    unless => "/usr/bin/test -d /usr/local/cast/repositories/casmr-core-7.3.0-repository",
}

exec { "unzip_cast_dta":
    command => "/bin/mkdir -p /usr/local/cast/repositories/casmr-dta-7.3.6-repository && /usr/bin/unzip /tmp/rpms/casmr-dta-7.3.6-repository.zip -d /usr/local/cast/repositories/casmr-dta-7.3.6-repository",
    user => "cast",
    unless => "/usr/bin/test -d /usr/local/cast/repositories/casmr-dta-7.3.6-repository",
}

exec { "unzip_cast_cast":
    command => "/bin/mkdir -p /usr/local/cast/repositories/ccad-firebird-cast-assembly-7.0.4-repository && /usr/bin/unzip /tmp/rpms/ccad-firebird-cast-assembly-7.0.4-repository.zip -d /usr/local/cast/repositories/ccad-firebird-cast-assembly-7.0.4-repository",
    user => "cast",
    unless => "/usr/bin/test -d /usr/local/cast/repositories/ccad-firebird-cast-assembly-7.0.4-repository",
}

exec { "unzip_casmr_core":
    command => "/bin/mkdir -p /usr/local/casmr/repositories/casmr-core-7.3.0-repository && /usr/bin/unzip /tmp/rpms/casmr-core-7.3.0-repository.zip -d /usr/local/casmr/repositories/casmr-core-7.3.0-repository",
    user => "casmr",
    unless => "/usr/bin/test -d /usr/local/casmr/repositories/casmr-core-7.3.0-repository",
}

exec { "unzip_casmr_dta":
    command => "/bin/mkdir -p /usr/local/casmr/repositories/casmr-dta-7.3.6-repository && /usr/bin/unzip /tmp/rpms/casmr-dta-7.3.6-repository.zip -d /usr/local/casmr/repositories/casmr-dta-7.3.6-repository",
    user => "casmr",
    unless => "/usr/bin/test -d /usr/local/casmr/repositories/casmr-dta-7.3.6-repository",
}

exec { "unzip_casmr_cast":
    command => "/bin/mkdir -p /usr/local/casmr/repositories/ccad-firebird-cast-assembly-7.0.4-repository && /usr/bin/unzip /tmp/rpms/ccad-firebird-cast-assembly-7.0.4-repository.zip -d /usr/local/casmr/repositories/ccad-firebird-cast-assembly-7.0.4-repository",
    user => "casmr",
    unless => "/usr/bin/test -d /usr/local/casmr/repositories/ccad-firebird-cast-assembly-7.0.4-repository",
}

exec { "copy_cast_cache_file":
    command => "/bin/cp -f /tmp/rpms/cast_prefs /usr/local/cast/p2/org.eclipse.equinox.p2.engine/profileRegistry/kernel.profile/.data/.settings/org.eclipse.equinox.p2.metadata.repository.prefs && /bin/cp -f /tmp/rpms/cast_prefs /usr/local/cast/p2/org.eclipse.equinox.p2.engine/profileRegistry/kernel.profile/.data/.settings/org.eclipse.equinox.p2.artifact.repository.prefs",
    user => "cast",
    unless => "/usr/bin/test -f /usr/local/cast/p2/org.eclipse.equinox.p2.engine/profileRegistry/kernel.profile/.data/.settings/org.eclipse.equinox.p2.artifact.repository.prefs",
    require => Exec["mk_cast_cache_dir"],
}

exec { "copy_casmr_cache_file":
    command => "/bin/cp -f /tmp/rpms/casmr_prefs /usr/local/casmr/p2/org.eclipse.equinox.p2.engine/profileRegistry/kernel.profile/.data/.settings/org.eclipse.equinox.p2.metadata.repository.prefs && /bin/cp -f /tmp/rpms/casmr_prefs /usr/local/casmr/p2/org.eclipse.equinox.p2.engine/profileRegistry/kernel.profile/.data/.settings/org.eclipse.equinox.p2.artifact.repository.prefs",
    user => "casmr",
    unless => "/usr/bin/test -f /usr/local/casmr/p2/org.eclipse.equinox.p2.engine/profileRegistry/kernel.profile/.data/.settings/org.eclipse.equinox.p2.artifact.repository.prefs",
    require => Exec["mk_casmr_cache_dir"],
}

#exec { "install_casmr_core":
#    command => "/usr/local/casmr/bin/install-iu.sh /usr/local/casmr/repositories/casmr-core-7.3.0-repository com.ccadllc.firebird.vms.appsvr.feature.group && /usr/bin/touch /usr/local/casmr/.core",
#    unless => "/usr/bin/test -f /usr/local/casmr/.core",
#    user => "casmr",
#    require => Exec["unzip_casmr_core"],
#}
#
#exec { "install_casmr_cast":
#    command => "/usr/local/casmr/bin/install-iu.sh /usr/local/casmr/repositories/ccad-firebird-cast-assembly-7.0.4-repository com.ccadllc.firebird.act.appsvr.feature.group && /usr/bin/touch /usr/local/casmr/.cast",
#    unless => "/usr/bin/test -f /usr/local/casmr/.cast",
#    user => "casmr",
#    require => Exec["unzip_casmr_cast"],
#}
#
#exec { "install_casmr_dta":
#    command => "/usr/local/casmr/bin/install-iu.sh /usr/local/casmr/repositories/casmr-dta-7.3.6-repository com.ccadllc.firebird.dss.client.plugin.feature.group,com.ccadllc.firebird.act.appsvr.feature.group,com.ccadllc.firebird.vms.solutions.dta.assembly.feature.group,com.ccadllc.firebird.vms.dssrm.plugin.feature.group,com.ccadllc.firebird.dss.server.plugin.feature.group,com.ccadllc.firebird.vms.terminals.plugin.feature.group,com.ccadllc.firebird.vms.sem.plugin.feature.group,com.ccadllc.firebird.act.repository.management.plugin.feature.group,com.ccadllc.firebird.vms.dc2.plugin.feature.group,com.ccadllc.firebird.vms.generic-edge-device.plugin.feature.group,com.ccadllc.firebird.vms.wirelink.plugin.feature.group,com.ccadllc.firebird.vms.download.plugin.feature.group,com.ccadllc.firebird.vms.dta.plugin.feature.group,com.ccadllc.firebird.vms.dks.plugin.feature.group,com.ccadllc.firebird.terminal.catalog.plugin.feature.group,com.ccadllc.firebird.vms.apex.plugin.feature.group,com.ccadllc.firebird.vms.sigen.plugin.feature.group,com.ccadllc.firebird.vms.dac.plugin.feature.group,com.ccadllc.firebird.act.dc2.campaign.plugin.feature.group,com.ccadllc.firebird.act.download.provisioner.plugin.feature.group,com.ccadllc.firebird.act.gateway.campaign.plugin.feature.group,com.ccadllc.firebird.act.dta.campaign.plugin.feature.group,com.ccadllc.firebird.core.snmp.client.plugin.feature.group,com.ccadllc.firebird.core.jms.feature.group,com.ccadllc.firebird.core.simplebackup.feature.group,com.ccadllc.firebird.core.snmp.client.plugin.feature.group,com.ccadllc.firebird.core.jms.feature.group,com.ccadllc.firebird.core.simplebackup.feature.group,com.ccadllc.firebird.act.dc2.campaign.plugin.feature.group,com.ccadllc.firebird.act.download.provisioner.plugin.feature.group,com.ccadllc.firebird.act.gateway.campaign.plugin.feature.group,com.ccadllc.firebird.act.dta.campaign.plugin.feature.group,com.ccadllc.firebird.vms.terminals.plugin.feature.group,com.ccadllc.firebird.vms.sem.plugin.feature.group,com.ccadllc.firebird.act.repository.management.plugin.feature.group,com.ccadllc.firebird.vms.dc2.plugin.feature.group,com.ccadllc.firebird.vms.generic-edge-device.plugin.feature.group,com.ccadllc.firebird.vms.wirelink.plugin.feature.group,com.ccadllc.firebird.vms.download.plugin.feature.group,com.ccadllc.firebird.vms.dta.plugin.feature.group,com.ccadllc.firebird.vms.dks.plugin.feature.group,com.ccadllc.firebird.terminal.catalog.plugin.feature.group,com.ccadllc.firebird.vms.apex.plugin.feature.group,com.ccadllc.firebird.vms.sigen.plugin.feature.group,com.ccadllc.firebird.vms.dac.plugin.feature.group,com.ccadllc.firebird.vms.dssrm.plugin.feature.group,com.ccadllc.firebird.dss.server.plugin.feature.group && /usr/bin/touch /usr/local/casmr/.dta",
#    unless => "/usr/bin/test -f /usr/local/casmr/.dta",
#    user => "casmr",
#    require => Exec["unzip_casmr_dta"],
#}
#
#exec { "install_cast_core":
#    command => "/usr/local/cast/bin/install-iu.sh /usr/local/cast/repositories/casmr-core-7.3.0-repository com.ccadllc.firebird.vms.appsvr.feature.group && /usr/bin/touch /usr/local/cast/.core",
#    unless => "/usr/bin/test -f /usr/local/cast/.core",
#    user => "cast",
#    require => Exec["unzip_cast_core"],
#}
#
#exec { "install_cast_cast":
#    command => "/usr/local/cast/bin/install-iu.sh /usr/local/cast/repositories/ccad-firebird-cast-assembly-7.0.4-repository com.ccadllc.firebird.act.appsvr.feature.group && /usr/bin/touch /usr/local/cast/.cast",
#    unless => "/usr/bin/test -f /usr/local/cast/.cast",
#    user => "cast",
#    require => Exec["unzip_cast_cast"],
#}
#
#exec { "install_cast_dta":
#    command => "/usr/local/cast/bin/install-iu.sh /usr/local/cast/repositories/casmr-dta-7.3.6-repository com.ccadllc.firebird.dss.client.plugin.feature.group,com.ccadllc.firebird.act.appsvr.feature.group,com.ccadllc.firebird.vms.solutions.dta.assembly.feature.group,com.ccadllc.firebird.vms.dssrm.plugin.feature.group,com.ccadllc.firebird.dss.server.plugin.feature.group,com.ccadllc.firebird.vms.terminals.plugin.feature.group,com.ccadllc.firebird.vms.sem.plugin.feature.group,com.ccadllc.firebird.act.repository.management.plugin.feature.group,com.ccadllc.firebird.vms.dc2.plugin.feature.group,com.ccadllc.firebird.vms.generic-edge-device.plugin.feature.group,com.ccadllc.firebird.vms.wirelink.plugin.feature.group,com.ccadllc.firebird.vms.download.plugin.feature.group,com.ccadllc.firebird.vms.dta.plugin.feature.group,com.ccadllc.firebird.vms.dks.plugin.feature.group,com.ccadllc.firebird.terminal.catalog.plugin.feature.group,com.ccadllc.firebird.vms.apex.plugin.feature.group,com.ccadllc.firebird.vms.sigen.plugin.feature.group,com.ccadllc.firebird.vms.dac.plugin.feature.group,com.ccadllc.firebird.act.dc2.campaign.plugin.feature.group,com.ccadllc.firebird.act.download.provisioner.plugin.feature.group,com.ccadllc.firebird.act.gateway.campaign.plugin.feature.group,com.ccadllc.firebird.act.dta.campaign.plugin.feature.group,com.ccadllc.firebird.core.snmp.client.plugin.feature.group,com.ccadllc.firebird.core.jms.feature.group,com.ccadllc.firebird.core.simplebackup.feature.group,com.ccadllc.firebird.core.snmp.client.plugin.feature.group,com.ccadllc.firebird.core.jms.feature.group,com.ccadllc.firebird.core.simplebackup.feature.group,com.ccadllc.firebird.act.dc2.campaign.plugin.feature.group,com.ccadllc.firebird.act.download.provisioner.plugin.feature.group,com.ccadllc.firebird.act.gateway.campaign.plugin.feature.group,com.ccadllc.firebird.act.dta.campaign.plugin.feature.group,com.ccadllc.firebird.vms.terminals.plugin.feature.group,com.ccadllc.firebird.vms.sem.plugin.feature.group,com.ccadllc.firebird.act.repository.management.plugin.feature.group,com.ccadllc.firebird.vms.dc2.plugin.feature.group,com.ccadllc.firebird.vms.generic-edge-device.plugin.feature.group,com.ccadllc.firebird.vms.wirelink.plugin.feature.group,com.ccadllc.firebird.vms.download.plugin.feature.group,com.ccadllc.firebird.vms.dta.plugin.feature.group,com.ccadllc.firebird.vms.dks.plugin.feature.group,com.ccadllc.firebird.terminal.catalog.plugin.feature.group,com.ccadllc.firebird.vms.apex.plugin.feature.group,com.ccadllc.firebird.vms.sigen.plugin.feature.group,com.ccadllc.firebird.vms.dac.plugin.feature.group,com.ccadllc.firebird.vms.dssrm.plugin.feature.group,com.ccadllc.firebird.dss.server.plugin.feature.group && /usr/bin/touch /usr/local/cast/.dta",
#    unless => "/usr/bin/test -f /usr/local/cast/.dta",
#    user => "cast",
#    require => Exec["unzip_cast_dta"],
#}

exec { "fix_casmr_permissions":
    command => "/bin/chmod -R 755 /usr/local/casmr/ && /bin/chown -R casmr:casmr /usr/local/casmr/",
    unless => "/bin/sh -c '[ $(/usr/bin/stat -c %a /usr/local/casmr/repositories/) = 755 ]'",
}

exec { "fix_cast_permissions":
    command => "/bin/chmod -R 755 /usr/local/cast/ && /bin/chown -R cast:cast /usr/local/cast/",
    unless => "/bin/sh -c '[ $(/usr/bin/stat -c %a /usr/local/cast/repositories/) = 755 ]'",
}

exec { "start_cast":
    command => "/etc/init.d/cast start",
    require => Exec["run_db_wizard"],
    onlyif => "/usr/bin/test -f /etc/init.d/cast",
    unless => "/usr/bin/lsof -i:8020 > /dev/null",
    }

exec { "start_casmr":
    command => "/etc/init.d/casmr start",
    require => Exec["start_cast"],
    onlyif => "/usr/bin/test -f /etc/init.d/casmr",
    unless => "/usr/bin/lsof -i:8010 > /dev/null",
    }

}
