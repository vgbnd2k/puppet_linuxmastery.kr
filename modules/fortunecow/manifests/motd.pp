# /home/administrator/code/environments/production/modules/fortunecow/manifests/motd.pp
# motd.sh 파일 생성하기
class fortune::motd {
  file { '/etc/profile.d/motd.sh':
    ensure => file,
    owner => 'root',
    content => "/usr/games/fortune | /usr/games/cowsay -n",
  }
}
