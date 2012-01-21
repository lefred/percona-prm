node percona1 {
	include percona::repository
        include percona::packages
        include percona::replication
	include pacemaker::service
	include percona-prm
	include myhosts
	$extraipaddr="192.168.70.2"
	network::if {
		"eth3":
			ip_add		=> $extraipaddr,
			ip_netmask	=> "255.255.255.0",
			ip_network	=> "192.168.70.0",
			broadcast	=> "192.168.70.255",
			proto		=> "static",
	}

	Class['percona::repository'] -> Class['percona::packages'] -> Class['percona::config'] -> Class['percona::service'] -> Class['pacemaker'] -> Class['pacemaker::service'] -> Class['percona-prm'] -> Class['percona::replication']

	class {'percona::config': perconaserverid => "1" }
	class {'percona::service': ensure => "running" }
	class {'pacemaker': pcmk_ip => $extraipaddr }
}

node percona2 {
	include percona::repository
        include percona::packages
        include percona::replication
	include pacemaker::service
	include percona-prm
	include myhosts
	#include testdb::employee

	$extraipaddr="192.168.70.3"
	network::if {
		"eth3":
			ip_add		=> $extraipaddr,
			ip_netmask	=> "255.255.255.0",
			ip_network	=> "192.168.70.0",
			broadcast	=> "192.168.70.255",
			proto		=> "static",
	}

	Class['percona::repository'] -> Class['percona::packages'] -> Class['percona::config'] -> Class['percona::service'] -> Class['pacemaker'] -> Class['pacemaker::service'] -> Class['percona-prm'] -> Class['percona::replication']

	class {'percona::config': perconaserverid => "2" }
	class {'percona::service': ensure => "running" }
	class {'pacemaker': pcmk_ip => $extraipaddr }
}

node percona3 {
	include percona::repository
        include percona::packages
        include percona::replication
	include pacemaker::service
	include percona-prm
	include myhosts

	$extraipaddr="192.168.70.4"
	network::if {
		"eth3":
			ip_add		=> $extraipaddr,
			ip_netmask	=> "255.255.255.0",
			ip_network	=> "192.168.70.0",
			broadcast	=> "192.168.70.255",
			proto		=> "static",
	}

	Class['percona::repository'] -> Class['percona::packages'] -> Class['percona::config'] -> Class['percona::service'] -> Class['pacemaker'] -> Class['pacemaker::service'] -> Class['percona-prm'] -> Class['percona::replication']

	class {'percona::config': perconaserverid => "3" }
	class {'percona::service': ensure => "running" }
	class {'pacemaker': pcmk_ip => $extraipaddr }
}
