class percona::replication {

	 mysql::rights{"Set rights for replication":
                ensure   => present,
                database => "*",
                user     => "repl",
		host     => "%",
                password => "repl",
		priv    => "Repl_slave_priv",
        }
}
