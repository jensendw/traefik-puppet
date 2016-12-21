# Traefik

## Table of Contents

1. [Overview](#Overview)
1. [Support](#Support)
1. [Setup](#Setup)
    * [What the Traefik class affects](#what-the-Traefik-class-affects)
1. [Usage](#Usage)
    * [Install Traefik with default settings](#Install-Traefik-with-default-settings)
    * [Install Traefik with custom configuration file path](#Install-Traefik-with-custom-configuration-file-path)
    * [Install Traefik and create custom config directory](#Install-Traefik-and-create-custom-config-directory)

## Overview

The traefik puppet module downloads, extracts and deploys the traefik-server binary and sets up the directory structure for configuration files.

## Support

This module is currently tested on:

* CentOS 7

## Setup

### What the Traefik class affects

* Downloads and unpackages a specific release of traefik from https://github.com/containous/traefik
* Extracts download to `/opt/traefik/traefik-{version}`
* Creates configuration directory /etc/traefik (the actual configuration file is managed out of band)
* Creates startup scripts for traefik

## Usage

### Install Traefik with default settings

```puppet
class {'::traefik':}
```
This results in /opt/traefik/traefik pointing to the current release which is 1.1.2 and the creation of /etc/traefik, the traefik service points to /etc/traefik/traefik.toml by default.

### Install Traefik with custom configuration file path

```puppet
class {'::traefik':
  config_file_path => '/tmp/somefile.toml',
}
```
Installs traefik but sets a custom path for the configuration file

### Install Traefik and create custom config directory

```puppet
class {'::traefik':
  config_path      => '/usr/local/config/traefik'
}
```

This will install traefik, create the directory /usr/local/config/traefik and point the startup script to look for a configuration file called /usr/local/config/traefik/traefik.toml
