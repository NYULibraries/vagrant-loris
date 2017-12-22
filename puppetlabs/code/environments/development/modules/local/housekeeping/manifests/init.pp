#
class housekeeping (
    $user = $housekeeping::params::user
) inherits housekeeping::params {

  include housekeeping::packages
  #include housekeeping::python
  #include housekeeping::aws
  include housekeeping::ruby
  include housekeeping::r10k

  housekeeping::user{ 'root': }
  #housekeeping::user{ 'centos': }
  housekeeping::user{ $user: }

  housekeeping::gemrc{ 'root': }
  #housekeeping::gemrc{ 'centos': }
  housekeeping::gemrc{ $user: }

}
