# Class: tct
# ===========================
#
# Full description of class tct here.
#
#
# Examples
# --------
#
#
# Authors
# -------
#
# Flannon Jackson <flannon@nyu.edu>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class tct {
  alert("Alert - tct module ")
  crit("Crit - tct module ")
  include tct::install
  include tct::install::backend
  #include tct::install::nginx
  #include tct::install::frontend
}
