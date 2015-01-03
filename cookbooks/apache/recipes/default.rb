package 'apache2'

service "apache2" do
  service_name "apache2"

  restart_command "/usr/sbin/invoke-rc.d apache2 restart && sleep 1"
  reload_command "/usr/sbin/invoke-rc.d apache2 reload && sleep 1"

  supports [:restart, :reload, :status]
  action :enable
end
