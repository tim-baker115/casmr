class casmr {
if $operatingsystem != 'SLES' {
	fail('Must be run on SLES, exiting.')
}
else {
	notice('4GB required in order to be able to start CASMR, ignoring this message will result in the application stalling.')
	include casmr::get_casmr_rpms, casmr::install_casmr, casmr::revert_ruby, casmr::add_users, casmr::start_applications, casmr::apply_patches
	Class['casmr::get_casmr_rpms'] -> Class['casmr::install_casmr'] -> Class['casmr::revert_ruby'] -> Class['casmr::add_users'] -> Class['casmr::start_applications'] -> Class['casmr::apply_patches']
}

}
