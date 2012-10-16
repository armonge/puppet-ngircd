class ngircd::config{
    File {
        owner => 'root',
        group => 'root',
        mode  => '0644',
    }

    file { "${ngircd::config::ng_temp_dir}/ngircd":
        ensure  => directory,
        purge   => true,
        recurse => true,
    }
    file{ "${ngircd::ng_temp_dir}/ngircd/001":
        ensure  => file,
        content => template('ngircd/ngircd.conf.erb'),
        require => Package['ngircd'],
    }
}
