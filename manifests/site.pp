node percona1 {
	include percona::repository
        include percona::server
        include percona::replication
	include percona::prm
	include myhosts

	Class['percona::repository'] -> Class['percona::server'] -> Class['percona::server::config'] -> Class['percona::replication'] -> Class['pacemaker'] -> Class['percona::prm']

	class {'percona::server::config': perconaserverid => "1" }
	class {'percona::server::service': ensure => "stopped" }
	class {'pacemaker': pcmk_ip => $ipaddress_eth1 }
}

node percona2 {
	include percona::repository
        include percona::server
        include percona::replication
	include percona::prm
	include myhosts

	Class['percona::repository'] -> Class['percona::server'] -> Class['percona::server::config'] -> Class['percona::replication'] -> Class['pacemaker'] -> Class['percona::prm']


	class {'percona::server::config': perconaserverid => "2" }
	class {'percona::server::service': ensure => "stopped" }
	class {'pacemaker': pcmk_ip => $ipaddress_eth1 }
}

node percona3 {
	include percona::repository
        include percona::server
        include percona::replication
	include percona::prm
	include myhosts

	Class['percona::repository'] -> Class['percona::server'] -> Class['percona::server::config'] -> Class['percona::replication'] -> Class['pacemaker'] -> Class['percona::prm']


	class {'percona::server::config': perconaserverid => "3" }
	class {'percona::server::service': ensure => "stopped" }
	class {'pacemaker': pcmk_ip => $ipaddress_eth1 }
}
