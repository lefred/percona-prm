node percona1 {
	include percona::repository
        include percona::packages
        include percona::replication
	include pacemaker::service
	include percona-prm
	include myhosts

	Class['percona::repository'] -> Class['percona::packages'] -> Class['percona::config'] -> Class['percona::service'] -> Class['percona::replication'] -> Class['pacemaker'] -> Class['pacemaker::service'] -> Class['percona-prm']

	class {'percona::config': perconaserverid => "1" }
	class {'percona::service': ensure => "stopped" }
	class {'pacemaker': pcmk_ip => $ipaddress_eth1 }
}

node percona2 {
	include percona::repository
        include percona::packages
        include percona::replication
	include pacemaker::service
	include percona-prm
	include myhosts
	#include testdb::employee

	Class['percona::repository'] -> Class['percona::packages'] -> Class['percona::config'] -> Class['percona::service'] -> Class['percona::replication'] -> Class['pacemaker'] -> Class['pacemaker::service'] -> Class['percona-prm']

	class {'percona::config': perconaserverid => "2" }
	class {'percona::service': ensure => "stopped" }
	class {'pacemaker': pcmk_ip => $ipaddress_eth1 }
}

node percona3 {
	include percona::repository
        include percona::packages
        include percona::replication
	include pacemaker::service
	include percona-prm
	include myhosts

	Class['percona::repository'] -> Class['percona::packages'] -> Class['percona::config'] -> Class['percona::service'] -> Class['percona::replication'] -> Class['pacemaker'] -> Class['pacemaker::service'] -> Class['percona-prm']

	class {'percona::config': perconaserverid => "3" }
	class {'percona::service': ensure => "stopped" }
	class {'pacemaker': pcmk_ip => $ipaddress_eth1 }
}
