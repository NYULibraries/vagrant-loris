class fw::pre {

  Firewall {
    require => undef,
  }

  #basic in/out 
  firewall { '000 accept all icmp':
    chain  => 'INPUT',
    proto  => 'icmp',
    action => 'accept',
  }

  firewall { '001 accept all to lo interface':
    chain   => 'INPUT',
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }
  
  firewall  { '003 accept related established rules': 
    chain   => 'INPUT',
    proto   => 'all',
    ctstate => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
  }

  firewall { '004 accept related established rules':
    chain  => 'OUTPUT',
    proto  => 'icmp',
    icmp   => 'echo-request',
    action => 'accept',
  }

  # extra
  # ssh has to be opened here so we can init the firewall
  # rules before doing a full puppetrun.  Otherwise port 22 gets 
  # locked out, though I'm still not sure why.
  firewall { '100 allow openssh':
    chain  => 'INPUT',
    state  => ['NEW'],
    dport  => '22',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '200 allow outgoing icmp type 8 (pint)':
    chain  => 'OUTPUT',
    proto  => 'icmp',
    icmp   => 'echo-request',
    action => 'accept',
  }

  firewall { '200 allow outgoing http':
    chain  => 'OUTPUT',
    state  => ['NEW'],
    dport  => '80',
    action => 'accept',
  }

}
