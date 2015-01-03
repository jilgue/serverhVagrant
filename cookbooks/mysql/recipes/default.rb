package "mysql-client"
package "mysql-server"
package "libapache2-mod-auth-mysql"
package "php5-mysql"

service "mysql" do
  service_name "mysql"
  action [:start, :enable]
end
