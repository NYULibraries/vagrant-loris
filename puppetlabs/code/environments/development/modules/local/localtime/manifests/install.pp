class localtime::install inherits localtime {

    package { $package_name:
        ensure  => $package_ensure
    }

}
