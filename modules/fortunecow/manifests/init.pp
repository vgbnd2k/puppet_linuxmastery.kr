# /home/administrator/code/environments/production/modules/fortunecow/manifests/init.pp
# fortunecow 모듈의 기본 매니페스트
class fortunecow {
  
  include fortunecow::install
  include fortunecow::motd

  Class['fortunecow::install'] -> Class['fortunecow::motd']

}
