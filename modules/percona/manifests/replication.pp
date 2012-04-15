class percona::replication {

#	 mysql::rights{"Set rights for replication":
#                ensure   => present,
#                #database => "*",
#                user     => "repl",
#		host     => "%",
#                password => "repl",
#		priv    => [ 'repl_slave_priv', 'repl_client_priv', 'super_priv' ], 
#		require => Exec['startmysql'],
#         }

#	 mysql::rights{"Set rights for replication local":
#                ensure   => present,
#                #database => "*",
#                user     => "repl",
#		host     => "localhost",
#                password => "repl",
#		priv    => [ 'repl_slave_priv', 'repl_client_priv', 'super_priv' ], 
#		require => Exec['startmysql'],
#         }

	exec {
		"addmysqluser1":	
			command 	=> "/usr/bin/mysql -e \"GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'repl'@'%' identified by 'repl'; FLUSH PRIVILEGES\"",
			subscribe	=> Exec['startmysql'],
			refreshonly	=> true,
	
	}

	exec {
		"addmysqluser2":	
			command 	=> "/usr/bin/mysql -e \"GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'repl'@'localhost' identified by 'repl'\"",
			subscribe	=> Exec['startmysql'],
			refreshonly	=> true,
	
	}

	exec {
		"addmysqluser3":	
			command 	=> "/usr/bin/mysql -e \"GRANT ALL PRIVILEGES  ON *.* TO 'repl'@'localhost' identified by 'repl'; FLUSH PRIVILEGES\"",
			subscribe	=> Exec['addmysqluser2'],
			refreshonly	=> true,
	}

	exec {
		"startmysql":
                        command         => "/etc/init.d/mysql start >/root/mysql_user",
			creates		=> "/root/mysql_user",
			require		=> [ Package['MySQL-client'], Package['MySQL-server'] ],
	}

	exec {
		"stopmysql":
                        command         => "/etc/init.d/mysql stop",
			subscribe       => [ Exec['addmysqluser1'], Exec['addmysqluser3'] ],
			refreshonly	=> true,
	}
}
