define ngircd::channel(
  $channel = $title,
  $topic = '',
  $modes = 'tnk',
  $key   = '',  
){
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
 file { "${ngircd::ng_temp_dir}/ngircd/001-${channel}":
    ensure  => $ensure ? {
      'absent' => absent,
      default  => 'file',
    },
    content => template('ngircd/channel.erb'),
    notify => Class['ngircd::service'],
  }
}
