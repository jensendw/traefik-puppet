# == Class: traefik::install
#
#  Fetches and installs the traefik binary
#
class traefik::install {
  if ! defined(Package['wget']) {
    package { 'wget': ensure => installed }
  }

  file { "/opt/${traefik::package_name}":
    ensure  => directory,
    require => Package['wget'],
    mode    => '0755',
  }

  exec { "${traefik::package_name}-${traefik::version}":
    command => "wget --no-check-certificate --output-document=/opt/${traefik::package_name}/${traefik::package_name}-${traefik::version} ${traefik::download_url_base}${traefik::version_url}/${traefik::download_package_name}",
    creates => "/opt/${traefik::package_name}/${traefik::package_name}-${traefik::version}",
    require => File["/opt/${traefik::package_name}"],
  }

  file {"/opt/${traefik::package_name}/${traefik::package_name}":
    ensure  => link,
    target  => "/opt/${traefik::package_name}/${traefik::package_name}-${traefik::version}",
    require => Exec["${traefik::package_name}-${traefik::version}"],
  }

}
