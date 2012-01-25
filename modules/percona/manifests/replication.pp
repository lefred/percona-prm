class percona::replication {

	 mysql::rights{"Set rights for replication":
                ensure   => present,
                #database => "*",
                user     => "repl",
		host     => "%",
                password => "repl",
		priv    => [ 'repl_slave_priv', 'repl_client_priv' ], 
        }

}
