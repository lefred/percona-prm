class network {
	service { "iptables": ensure =>  'stopped'; }
}
