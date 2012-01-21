class percona-prm {

	file {
		"/usr/lib/ocf/resource.d/percona":
			ensure  => directory,
        		mode    => 0644,
        		owner   => "root",
        		group   => "root",
	}

    	file {
        	"/usr/lib/ocf/resource.d/percona/MySQL_replication":
        		ensure  => present,
			source  => "puppet:///modules/percona-prm/MySQL_replication",
        		mode    => 0755,
        		owner   => "root",
        		group   => "root",
        		require => File["/usr/lib/ocf/resource.d/percona"],
    	}

    	file {
        	"/root/crm_config":
        		ensure  => present,
			source  => "puppet:///modules/percona-prm/crm_config",
        		mode    => 0644,
        		owner   => "root",
        		group   => "root",
			notify  => Exec['loadcrmconfig'],
    	}

        exec { "loadcrmconfig":
		refreshonly	=> true,
		command         => "/bin/sleep 5; /bin/echo FRED; /usr/sbin/crm configure load replace /root/crm_config",
		require 	=> [ Network::If["eth3"], File["/usr/lib/ocf/resource.d/percona/MySQL_replication"] ],
	}

}
