package "mysql-client" do
  action :install
end

package "mysql-server" do
  action :install
end

package "libapache2-mod-auth-mysql"
package "php5-mysql"

service "mysql" do
  service_name "mysql"
  /usr/bin/mysql
  restart_command "/usr/sbin/invoke-rc.d apache2 restart && sleep 1"
  reload_command "/usr/sbin/invoke-rc.d apache2 reload && sleep 1"

  supports [:restart, :reload, :status]
  action :enable
end
