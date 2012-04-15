class percona::server ($ensure="running") {
	include percona::server::packages

	Class['percona::server::packages'] ->  Class['percona::server::config'] -> Class['percona::server::service']	
}
