# /home/administrator/code/environments/production/modules/base/manifests/init.pp
# base 모듈의 기본 매니페스트
class base {

  include base::install
  include base::vim
  include base::ssh

  class { 'apt':
    update => {
      frequency => 'daily',
    },
  }

  notify { "==== base ====\n":  }

}
