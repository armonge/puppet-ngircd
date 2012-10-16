class ngircd(
    $servername='localhost',
    $listenaddress='127.0.0.1',
    $port='6667',
){
    $ng_temp_dir = '/tmp'
    $ng_conf_dir = '/etc'

    class {'stdlib':}
    class {'ngircd::package':
        notify  => Class['ngircd::service'],
    }
    class {'ngircd::config':
      require => Class['ngircd::package'],
      notify  => Class['ngircd::service'],
    }

    class {'ngircd::service':}

  # Allow the end user to establish relationships to the "main" class
  # and preserve the relationship to the implementation classes through
  # a transitive relationship to the composite class.
  anchor{ 'ngircd::begin':
    before => Class['ngircd::package'],
    notify => Class['ngircd::service'],
  }
  anchor { 'ngircd::end':
    require => Class['ngircd::service'],
  }

}
