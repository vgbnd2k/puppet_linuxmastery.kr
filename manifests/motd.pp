# /home/administrator/code/environments/production/manifests/motd.pp
# motd 보여주기
class motd {
  file { '/etc/motd':
    ensure    => file,
    owner     => 'root',
    content   => "\n
      Hostname      : ${::fqdn}\n
      IP Address    : ${::ipaddress}\n",
  }
}
