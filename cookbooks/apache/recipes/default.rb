package 'apache2'

service "apache2" do
  service_name "apache2"
  restart_command "/usr/sbin/invoke-rc.d apache2 restart && sleep 1"
  reload_command "/usr/sbin/invoke-rc.d apache2 reload && sleep 1"
  supports [:restart, :reload, :status, :start]
  action [:start, :enable]
end

# enable mod rewrite
execute "/usr/sbin/a2enmod rewrite" do
  notifies :restart, "service[apache2]"
end

# sites-available
node.apache.sitesAvailable.each do |site|
  execute "/usr/sbin/a2ensite #{site}"
end
#notifies :reload, "service[apache2]"
