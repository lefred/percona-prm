class percona::server::config ($perconaserverid=undef) {

        file {
                "/etc/my.cnf":
                        ensure  => present,
                        content => template("percona/server/my.cnf.erb"),
        }

        exec {
                "disable-selinux":
                        path    => ["/usr/bin","/bin"],
                        command => "echo 0 >/selinux/enforce",
                        unless => "grep 0 /selinux/enforce",
        }

}
