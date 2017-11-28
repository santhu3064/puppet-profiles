class profile::base(
	$ntp_servers = [
		'puppet-lamp-centos-client.local',
		'puppet-lamp-ubuntu-client.local',
	],
) {
include ::ssh
class { '::ntp': 
	servers => $ntp_servers,
}
if $facts['os']['family'] == 'RedHat' {
	include ::profile::selinux
	}
}

