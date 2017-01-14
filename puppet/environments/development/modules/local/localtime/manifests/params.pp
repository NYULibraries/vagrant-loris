class localtime::params {

    $default_zone       = 'UTC'
    $default_package_name   = 'tzdata'
    $package_name       = 'tzdata'
    $package_ensure     = 'present'
    $zone               = $default_zone

}
