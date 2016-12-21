# == Class: traefik::service
#
#  Sets up the service for traefik server
#
class traefik::service {
  service { $traefik::service_name:
    ensure  => running,
    enable  => true,
    require => File[$traefik::init_path],
  }
}
