package 'apache2'

service "apache2" do
  service_name "apache2"

  restart_command "/usr/sbin/invoke-rc.d apache2 restart && sleep 1"
  reload_command "/usr/sbin/invoke-rc.d apache2 reload && sleep 1"

  supports [:restart, :reload, :status]
  action :enable
end

# enable mod rewrite
execute "/usr/sbin/a2enmod rewrite" do
  notifies :restart, "service[apache2]"
  not_if do (::File.symlink?("/etc/apache2/mods-enabled/rewrite.load") and
             ((::File.exists?("/etc/apache2/mods-available/rewrite.conf"))?
                (::File.symlink?("/etc/apache2/mods-enabled/rewrite.conf")):(true)))
  end
end
