node default {
  ##include classifier
  ##hiera_include('classes')
  #lookup('classes')
  include roles::tct
}
