# sites-available
sitesAvailable = [
  010-callepuzzle,
  011-callepuzzle
]

sitesAvailable.each { |a|
  execute "/usr/sbin/a2ensite #{a}"
}

notifies :reload, "service[apache2]"
