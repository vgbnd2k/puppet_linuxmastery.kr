# /home/administrator/code/environments/production/modules/base/manifests/install.pp
# 패키지 설치하기
class base::install {

  package { ['tree', 'curl', 'wget', 'unzip']: }

  notify { "==== base::install ====\n": }
}
