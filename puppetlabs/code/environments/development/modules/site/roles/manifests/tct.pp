class roles::tct {
  include profiles::base
  #include profiles::db_postgres
  include profiles::webapp_tct
  include profiles::rbenv
}
