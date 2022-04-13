# modules/webapp/manifests/web.pp
# 웹 서버 운영
class webapp::web {

  $servername = lookup('servername')
  $port = lookup('port')
  
  class {'apache':
    mpm_module => 'prefork',
    default_vhost => false,
    default_charset => 'UTF-8',
  }

  apache::vhost { "${servername}":
    port => "${port}",
    docroot => "/var/www/${servername}",
  }

  include apache::mod::php
  include mysql::bindings::php

  file { 'index.html':
    name => "/var/www/${servername}/index.html",
    content => "<html><head><title>Host Infomation</title></head></html>
      <body><h1>안녕하세요</h1>
      <h2>host name : ${::fqdn}</h2>
      <h2>ip address : ${::ipaddress}</h2></body></html>\n",
    require => Apache::Vhost["${servername}"],
    ensure => absent,
  } 

  file { 'index.php':
    name => "/var/www/${servername}/index.php",
    content => "<?php phpinfo(); ?>",
    require => Apache::Vhost["${servername}"],
    ensure => absent,
  }
}
