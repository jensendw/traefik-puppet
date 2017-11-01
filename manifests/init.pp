# == Class: traefik
#
#  Module to install traefik reverse proxy server
#
class traefik (
  $package_name                   = $traefik::params::package_name,
  $download_url_base              = $traefik::params::download_url_base,
  $version                        = $traefik::params::version,
  $service_name                   = $traefik::params::service_name,
  $download_package_name          = $traefik::params::download_package_name,
  $init_style                     = $traefik::params::init_style,
  $init_path                      = $traefik::params::init_path,
  $config_file_path               = $traefik::params::config_file_path,
  $config_path                    = $traefik::params::config_path,
  $file_limit                     = $traefik::params::file_limit,

  ) inherits traefik::params {

  anchor { 'traefik::begin': } ->
  class { '::traefik::install': } ->
  class { '::traefik::config': } ->
  class { '::traefik::service': } ->
  anchor { 'traefik::end': }

  #stuff goes here
}
