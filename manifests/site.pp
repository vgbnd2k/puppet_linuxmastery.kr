# /home/administrator/code/environments/production/manifests/site.pp
# 노드 선언
node 'vm03.linuxmastery.kr' {
  include base
  include fortunecow
}
