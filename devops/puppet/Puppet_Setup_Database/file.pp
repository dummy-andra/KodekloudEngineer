class mysql_database {
  package {'mariadb-server':
      ensure => installed,

  }
  service { 'mariadb':
    ensure => running,
    enable => true,

  }
  mysql::db { 'kodekloud_db10':
    user => 'kodekloud_roy',
    password => 'TmPcZjtRQx',
    host => 'localhost',
    grant => ['ALL']

  }

}



node 'stdb01.stratos.xfusioncorp.com' {
    include mysql_database
}

node 'default' {
}


#en el master
#/opt/puppetlabs/bin/puppet apply <file>.pp

#en los clientes
# puppet agent -t
