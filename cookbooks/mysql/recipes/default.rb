package "mysql-client"
package "mysql-server"
package "libapache2-mod-auth-mysql"
package "php5-mysql"

service "mysql" do
  service_name "mysql"
  action [:start, :enable]
end

# Set mysql password
execute "mysqlSetPassword" do

  if ::File.exist?(node.mysql.fileToSaveMysqlPass)
    file = File.open(node.mysql.fileToSaveMysqlPass)
    pass = file.read
    pass.delete!("\n")
    oldPass = "-p'#{pass}'"
  else
    File.open(node.mysql.fileToSaveMysqlPass, "w+") {|f| f.write(node.mysql.password) }
    oldPass = "";
  end

  command "mysqladmin -u root #{oldPass} password #{node.mysql.password}"
  action :run
end

# Create databases
execute "createDatabase" do
  node.mysql.databases.each do |db|
    command "mysql -u root -p#{node.mysql.password} -e \"CREATE DATABASE #{db};\""
    ignore_failure true
    action :run
  end
end

execute "loadDatabase" do
  node.mysql.databases.each do |db|
    file = "/deploy/projects/#{db}/#{db}.sql"
    if ::File.exist?(file)
      command "mysql -u root -p#{node.mysql.password} #{db} < #{file}"
      action :run
    end
  end
end
