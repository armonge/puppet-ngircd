class ngircd(
    $servername='localhost',
    package{'ngircd':
            ensure => present,
    }
    file{'ngircd.conf':
            path    => '/etc/ngircd.conf',
            ensure  => file,
            owner   => root,
            group   => ngircd,
            content => template('ngircd/ngircd.conf.erb'),
            require => Package['ngircd'],
    }
    service{'ngircd':
        ensure    => running,
        enable    => true,
        subscribe => File['ngircd.conf'],
    }

        
}
