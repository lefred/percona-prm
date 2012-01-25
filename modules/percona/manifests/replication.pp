class percona::replication {

	#mysql_grant { "repl@%":
      	#	privileges => [ 'repl_slave_priv', 'repl_client_priv' ],
      	#	#require => File["/root/.my.cnf"],
    	#}

	 mysql::rights{"Set rights for replication":
                ensure   => present,
                database => "*",
                user     => "repl",
		host     => "%",
                password => "repl",
		priv    => [ 'repl_slave_priv', 'repl_client_priv' ],   # not used here but needed to avoid full privileges
        }
}
