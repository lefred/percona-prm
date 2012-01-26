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
			command 	=> "/usr/bin/mysql -e \"CREATE USER 'repl'@'%' IDENTIFIED BY 'repl'\"",
			require		=> Exec['startmysql']
	}

	exec {
		"addmysqluser2":	
			command 	=> "/usr/bin/mysql -e \"GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%'; FLUSH PRIVILEGES\"",
			require		=> Exec['addmysqluser1']
	
	}
	exec {
		"addmysqluser3":	
			command 	=> "/usr/bin/mysql -e \"CREATE USER 'repl'@'localhost' IDENTIFIED BY 'repl'\"",
			require		=> Exec['startmysql']
	}

	exec {
		"addmysqluser4":	
			command 	=> "/usr/bin/mysql -e \"GRANT REPLICATION SLAVE ON *.* TO 'repl'@'localhost'\"",
			require		=> Exec['addmysqluser3']
	
	}

	exec {
		"addmysqluser5":	
			command 	=> "/usr/bin/mysql -e \"GRANT ALL PRIVILEGES  ON *.* TO 'repl'@'localhost'; FLUSH PRIVILEGES\"",
			require		=> Exec['addmysqluser4']
	

	}

	exec {
		"startmysql":
                        command         => "/etc/init.d/mysql start >/root/mysql_user",
			creates		=> "/root/mysql_user",
	}

	exec {
		"stopmysql":
                        command         => "/etc/init.d/mysql stop",
			require => [ Exec['addmysqluser2'], Exec['addmysqluser5'] ],
	}
}
