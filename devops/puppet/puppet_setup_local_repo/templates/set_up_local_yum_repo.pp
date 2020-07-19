
#puppetserver ca list --all
#puppet parser validate <file>.pp
#puppet apply <file>.pp



# over agents
# puppet agent -tv
#
#
class local_yum_repo{
  yumrepo { 'localyum':
    name => 'localyum',
    enabled  => 1,
    descr    => 'localyum',
    baseurl  => 'file:///packages/downloaded_rpms',
    gpgcheck => 0,
  }
  
  package { 'httpd':
    ensure  => 'installed',
    require => Yumrepo['localyum'],
  }
}



node 'stapp01.stratos.xfusioncorp.com' {
    include local_yum_repo
}

node 'stapp02.stratos.xfusioncorp.com' {
    include local_yum_repo
}

node 'stapp03.stratos.xfusioncorp.com' {
    include local_yum_repo
}

node 'default' {
}


