class housekeeping::ruby (
    $user = 'ec2-user'
) {

  class { 'ruby':
    gems_version => 'latest',
  }
  include ruby::dev
  class { 'ruby::gemrc' :
    gem_command => {
      'gem'     => [ 'no-document' ],
    }
  }



}
