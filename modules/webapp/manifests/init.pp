# webapp 모듈의 기본 매니페스트
class webapp {
  
  include webapp::web
  include webapp::db
  include webapp::wp

  Class['webapp::db'] -> Class['webapp::wp']
}
