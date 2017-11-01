# == Class: traefik::params
#
#  All parameters for the traefik puppet module
#
class traefik::params {
  $package_name                   = 'traefik'
  $download_url_base              = 'https://github.com/containous/traefik/releases/download/'
  $version                        = '1.1.2'
  $service_name                   = 'traefik'
  $download_package_name          = 'traefik_linux-amd64'
  $config_path                    = '/etc/traefik'
  $config_file_path               = "${config_path}/traefik.toml"
  $file_limit                     = '60000'

  #set init style
  if $::operatingsystem =~ /Scientific|CentOS|RedHat|OracleLinux/ {
    case $::operatingsystemmajrelease {
      '7': {
        $init_style = 'systemd'
        $init_path  = "/lib/systemd/system/${service_name}.service"
      }
      default: {
        fail('Unsupported operating system version')
      }
    }
  } else {
    fail('Unsupported operating system')
  }


}
