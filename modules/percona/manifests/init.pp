class percona::repository {


 $releasever = "6"
 $basearch = $hardwaremodel
 yumrepo {
        "percona":
            descr       => "Percona",
            enabled     => 1,
            baseurl     => "http://repo.percona.com/centos/$releasever/os/$basearch/",
            gpgcheck    => 0;
 }

}

class percona::packages {

	package {
		"Percona-Server-server-55.$hardwaremodel":
            		alias => "MySQL-server",
			ensure => "installed";
		"Percona-Server-client-55.$hardwaremodel":
            		alias => "MySQL-client",
			ensure => "installed";		
		"mysql-libs":
			ensure => "absent";		
		"Percona-Server-shared-compat":
			require => [ Package['mysql-libs'], Package['MySQL-client'] ],
			ensure => "installed";
	}
}

class percona::service ($ensure="running") {

	service {
		"mysql":
			enable  => false,
			require => Package['MySQL-server'],
	}
}

class percona::config ($perconaserverid=undef) {

	file {
		"/etc/my.cnf":
			ensure  => present,
                        content => template("percona/my.cnf.erb"),
        }
}

