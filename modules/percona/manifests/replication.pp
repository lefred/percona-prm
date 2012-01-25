class percona::replication {

	 mysql::rights{"Set rights for replication":
                ensure   => present,
                #database => "*",
                user     => "repl",
		host     => "%",
                password => "repl",
		priv    => [ 'repl_slave_priv', 'repl_client_priv', 'super_priv' ], 
         }

	 mysql::rights{"Set rights for replication local":
                ensure   => present,
                #database => "*",
                user     => "repl",
		host     => "localhost",
                password => "repl",
		priv    => [ 'repl_slave_priv', 'repl_client_priv', 'super_priv' ], 
         }

}
