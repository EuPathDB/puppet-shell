class shell {

  file { '/etc/profile':
    owner => root,
    group => root,
    mode => '0644',
    source => 'puppet:///modules/shell/profile';
  }

  file { '/etc/bashrc':
    owner => root,
    group => root,
    mode => '0644',
    source => 'puppet:///modules/shell/bashrc';
  }

  # motd should be a banner notification of Gov't system.
  # per FISMA, AC-8 'System Use Notification'
  file { '/etc/motd':
    owner => root,
    group => root,
    mode => '0644',
    source => 'puppet:///modules/shell/motd';
  }

  file { '/etc/environment':
    owner => root,
    group => root,
    mode => '0644',
    source => 'puppet:///modules/shell/environment';
  }

  file { '/etc/profile.d/service-tab-completion.sh':
    owner => root,
    group => root,
    mode => '0644',
    source => 'puppet:///modules/shell/profile.d/service-tab-completion.sh';
  }

  file { '/etc/profile.d/historytimeformat.sh':
    owner => root,
    group => root,
    mode => '0644',
    source => 'puppet:///modules/shell/profile.d/historytimeformat.sh';
  }

  file { '/etc/profile.d/direxpand.sh':
    owner => root,
    group => root,
    mode => '0644',
    source => 'puppet:///modules/shell/profile.d/direxpand.sh';
  }

}
