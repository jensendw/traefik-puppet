# == Class: traefik::config
#
#  Handles various configuration for traefik
#
class traefik::config {
  file { $traefik::init_path:
    content => template("traefik/traefik.${traefik::init_style}.erb"),
    mode    => '0755',
  }

  file { $traefik::config_path:
    ensure => directory,
  }

}
