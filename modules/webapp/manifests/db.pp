# /home/administrator/code/environments/production/modules/webapp/manifests/db.pp
# 데이터베이스 운영
class webapp::db {

  $wp_root_password = lookup('wp_root_password')
  $wp_db_name = lookup('wp_db_name')  # 생성할 데이터 베이스 이름 
  $wp_user = lookup('wp_user') # 데이터베이스에 접근 가능한 사용자 이름
  $wp_user_password = lookup('wp_user_password') # 데이터베이스 사용자의 패스워드

  class { 'mysql::server':
    root_password => "${wp_root_password}",
    restart => true,
  }

  mysql::db { "${wp_db_name}":
    user => "${wp_user}",
    password => "${wp_user_password}",
    grant => ['ALL'],
  }
}
