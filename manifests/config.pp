# == Class: traefik::config
#
#  Handles various configuration for traefik
#
class traefik::config {
  file { $traefik::init_path:
    content => template("traefik/traefik.${traefik::init_style}.erb"),
    mode    => '0755',
    require => File["/opt/${traefik::package_name}/${traefik::package_name}-${traefik::version}"],
  }

  file { '/etc/systemd/system/traefik.service.d':
    ensure  => 'directory',
    require => File["/opt/${traefik::package_name}/${traefik::package_name}-${traefik::version}"],
  }

  file { '/etc/systemd/system/traefik.service.d/limits.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('traefik/limits.conf.erb'),
    require => File['/etc/systemd/system/traefik.service.d'],
  }

  exec { 'reload_configuration':
    command     => 'systemctl daemon-reload',
    path        => '/usr/local/bin/:/bin/',
    subscribe   => [
      File['/etc/systemd/system/traefik.service.d/limits.conf'],
    ],
    refreshonly => true,
  }

  file { $traefik::config_path:
    ensure => directory,
  }



}
