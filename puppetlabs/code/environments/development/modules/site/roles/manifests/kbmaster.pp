class roles::kbmaster {
  include profiles::base
  include profiles::container_kbmaster
  include profiles::rbenv
}
